<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8' %>

<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=DnivzC3hlbYQYmvZlihT5P2niUPx0Sq6SlLShP10"></script>

    <style>
      
       #c_btn{
        margin-bottom: 15px;
       }
    </style>


</head>
<body>
    <div id="map" style="  height:900px;">
 
    </div>

<script>

    //var HOME_PATH = window.HOME_PATH || '.';
    var polyline = new naver.maps.Polyline();
    var map;

    // window.onload = function(){
        
    //     if (navigator.geolocation) {
    //         navigator.geolocation.getCurrentPosition(function(position){
    //             latitude =  position.coords.latitude;
    //             longitude=  position.coords.longitude;

    //         });

    //     }

    // }

    $(function() {
	
         initMap();

    });


    

    //거리 및 소요시간 계산 api
    function send(f){

        let lat = f.lat.value;
        let longi = f.longi.value;

        $.ajax({
            
            url : "line.do",
            data : {"latitude" : latitude,
                    "longitude" : longitude,
                    "lat"       : lat,
                    "longi"     : longi
                    },
            dataType : "json",
            success  :function(res_data){
                // for(var i=0; i<res_data.list; i++ ){
                //     console.log(res_data.list[i].vo.path_lat);
                //     console.log(res_data[i].path_longi);
                // }
                var path_array = new Array();
                for(var i = 0; i< res_data.length ; i++){
                        path_array[i] = new naver.maps.LatLng(res_data[i].path_lat, res_data[i].path_longi);
                }

                polyline.setMap(null);

                polyline = new naver.maps.Polyline({
                map: map,
                path:  path_array,
                strokeColor: '#E51D1A',
                strokeStyle: 'solid',
                strokeOpacity: 1,
                strokeWeight: 5
                    
                });
                
            },
            error    :function(err){
                alert(err.status);
            }

        })

        var searchOption = $("#selectLevel").val();
        var trafficInfochk = $("#year").val();
        var headers = {}; 
            headers["appKey"]="DnivzC3hlbYQYmvZlihT5P2niUPx0Sq6SlLShP10";

        //JSON TYPE EDIT [S]
        $.ajax({
            type : "POST",
            headers : headers,
            url : "https://apis.openapi.sk.com/tmap/routes?version=1&format=json&callback=result&appKey=DnivzC3hlbYQYmvZlihT5P2niUPx0Sq6SlLShP10",
            async : false,
            data : {
                "startX" : longitude,
                "startY" : latitude,
                "endX" : longi,
                "endY" : lat,
                "reqCoordType" : "WGS84GEO",
                "resCoordType" : "EPSG3857",
                "searchOption" : searchOption,
                "trafficInfo" : trafficInfochk
            },
            success : function(response) {

                var resultData = response.features;

                var tDistance = "예상 이동거리 : "
                        + (resultData[0].properties.totalDistance / 1000)
                                .toFixed(1) + "km";
                var tTime = ", 예상 이동시간 : "
                        + (resultData[0].properties.totalTime / 60)
                                .toFixed(0) + "분";
                $("#result").text(
                        tDistance + tTime);

            },

            error : function(request, status, error) {
                console.log("code:"
                        + request.status + "\n"
                        + "message:"
                        + request.responseText
                        + "\n" + "error:" + error);
            }
        });

    }


function initMap(){

//API에서 불러온 충전소별 좌표값 및 상세정보를 positions[] 배열에 담기
var areaArr = new Array();
areaArr.push(
    <c:forEach var="vo" items="${list}" varStatus="status">
    {
    content :
    `
    <form id="c_form">
        <input type="hidden" name="marker_idx" value="${status.index}"/>
        <input type="hidden" name="lat" value="${ vo.lat }"/>
        <input type="hidden" name="longi" value="${ vo.longi }"/>
        <input type="hidden" name="csNm" value="${ vo.csNm }"/>
        <input type="hidden" name="csId" value="${ vo.csId }"/>
        <input type="hidden" name="addr" value="${ vo.addr }"/>
        <input type="hidden" name="cpTp" value="${ vo.cpTp }"/>
        <input type="hidden" name="chargeTp" value="${ vo.chargeTp }"/>
        <input type="hidden" name="cpStat" value="${ vo.cpStat }"/>
        <input type="hidden" name="statUpdateDatetime" value="${ vo.statUpdateDatetime }"/>
        <input type="hidden" name="mem_idx" value="${ user.mem_idx }"/>

        <div id="p_box" >
        <div class="panel panel-primary">
        <div class="panel-heading" style="text-align: center;">
            <h2>${vo.csNm} 
                <c:set var="loop_flag" value="false" />
                <c:if test="${empty f_list}">
                   <input class="star" type="image" id="f_star_${vo.csId}" src="../images/star.png" onclick="favorite(this.form); return false;"/>
                </c:if>
                <c:forEach var="f_vo" items="${ f_list }" varStatus="f_status">
                    <c:if test="${not loop_flag }">
                        <c:if test="${vo.csNm == f_vo.csNm}">
                            <input type="hidden" name="f_idx" value="${f_vo.f_idx}"/>
                            <input class="star" type="image" id="f_star_${vo.csId}" src="../images/yellowStar.png" onclick="favorite(this.form); return false;"/>
                            <c:set var="loop_flag" value="true" />
                        </c:if>

                        <c:if test="${not loop_flag }">
                            <c:if test="${f_status.last}"> 
                            <input class="star" type="image" id="f_star_${vo.csId}" src="../images/star.png" onclick="favorite(this.form); return false;"/>
                            </c:if>
                        </c:if>
                    </c:if>
                </c:forEach>
            </h2>
        </div>
        <div class="panel-body">
            <table class="table table-striped">

            <tr class="success">
                <th style="text-align: center;">주소</th>
                <td>${ vo.addr }</td>
            </tr>
            
            <tr class="success">
                <th style="text-align: center;">충전방식</th>
                <c:if test="${ vo.cpTp == 1 }">
                    <td>B타입(5핀)</td>
                </c:if>
                <c:if test="${ vo.cpTp == 2 }">
                    <td>C타입(5핀)</td>
                </c:if>
                <c:if test="${ vo.cpTp == 3 }">
                    <td>BC타입(5핀)</td>
                </c:if>
                <c:if test="${ vo.cpTp == 4 }">
                    <td>BC타입(7핀)</td>
                </c:if>
                <c:if test="${ vo.cpTp == 5 }">
                    <td>DC차데모</td>
                </c:if>
                <c:if test="${ vo.cpTp == 6 }">
                    <td>AC3상</td>
                </c:if>
                <c:if test="${ vo.cpTp == 7 }">
                    <td>DC콤보</td>
                </c:if>
                <c:if test="${ vo.cpTp == 8 }">
                    <td>DC차데모 + DC콤보</td>
                </c:if>
                <c:if test="${ vo.cpTp == 9 }">
                    <td>DC차데모 + AC3상</td>
                </c:if>
                <c:if test="${ vo.cpTp == 10 }">
                    <td>DC차데모 + DC콤보 + AC3상</td>
                </c:if>
            </tr>

            <tr class="success">
                <th style="text-align: center;">충전기명(충전속도)</th>
                <c:if test="${ vo.chargeTp == 1 }">
                <td>${ vo.cpNm }(완속)</td>
                </c:if>
                <c:if test="${ vo.chargeTp == 2 }">
                <td>${ vo.cpNm }(급속)</td>
                </c:if>
            </tr>

            <tr class="success">
                <th style="text-align: center;">충전상태</th>
                <c:if test="${ vo.cpStat == 0 }">
                    <td>상태확인불가</td>
                </c:if>
                <c:if test="${ vo.cpStat == 1 }">
                    <td>충전가능</td>
                </c:if>
                <c:if test="${ vo.cpStat == 2 }">
                    <td>충전중</td>
                </c:if>
                <c:if test="${ vo.cpStat == 3 }">
                <td style="background-color: red; color: white;">고장/점검</td>
                </c:if>
                <c:if test="${ vo.cpStat == 4 }">
                    <td style="background-color: red; color: white;">통신장애</td>
                </c:if>
                <c:if test="${ vo.cpStat == 9 }">
                    <td>충전예약</td>
                </c:if>
            </tr>

            <tr class="success">
                <th style="text-align: center;">충전기상태 갱신시각</th>
                <td>${ vo.statUpdateDatetime }</td>
            </tr>
        </table>

        <div>
        <input class="btn btn-primary" id="c_btn" style=" float:right"  type="button" value="경로검색" onclick="send(this.form);"/>
        <h4><span id="result" style="float:left;"></span></h4>
        </div>

        </div>
        </div>
    </div>
    </form>`,
    lat : '${vo.lat}',
    lng : '${vo.longi}'
    },
    </c:forEach>
    
    )

    markers = new Array(); // 마커 정보를 담는 배열
    infoWindows = new Array(); // 정보창을 담는 배열

        map = new naver.maps.Map('map', {
        center: new naver.maps.LatLng(latitude, longitude), //지도 시작 지점
        zoom: 15
    });
    <c:forEach var="vo" items="${list}" varStatus="status" >
        <c:set var="loop_flag2" value="false" />

       
        <c:forEach var="f_vo" items="${f_list}" >
            <c:if test="${not loop_flag2 }">
                <c:if test="${f_vo.csId eq vo.csId}">
                
                    var marker = new naver.maps.Marker({
                        map: map,
                        position: new naver.maps.LatLng(areaArr['${status.index}'].lat, areaArr['${status.index}'].lng),
                        icon : "../images/FavoriteMarker.png"
                    });
                    var infoWindow = new naver.maps.InfoWindow({
                        content: areaArr['${status.index}'].content
                    });

                    <c:set var="loop_flag2" value="true" />
                </c:if>
            </c:if>
        </c:forEach>

        <c:if test="${not loop_flag2 }">
            <c:choose>  
                <c:when test="${user.mem_type == 1 || user.mem_type == 2 || user.mem_type == 3 || user.mem_type == 4}">
                    <c:if test="${vo.cpTp == user.mem_type }">
                        var marker = new naver.maps.Marker({
                        map: map,
                        position: new naver.maps.LatLng(areaArr['${status.index}'].lat , areaArr['${status.index}'].lng),
                        icon : "../images/ChargeMarker.png"
                        });
                    </c:if>
                    <c:if test="${vo.cpTp != user.mem_type }">
                        var marker = new naver.maps.Marker({
                        map: map,
                        position: new naver.maps.LatLng(areaArr['${status.index}'].lat , areaArr['${status.index}'].lng),
                        icon : "../images/DefaultMarker.png"
                        });
                    </c:if>
                </c:when>
                <c:when test="${user.mem_type == 5}">
                    <c:if test="${vo.cpTp == 5 || vo.cpTp == 8 || vo.cpTp == 9 || vo.cpTp == 10}">
                        var marker = new naver.maps.Marker({
                        map: map,
                        position: new naver.maps.LatLng(areaArr['${status.index}'].lat , areaArr['${status.index}'].lng),
                        icon : "../images/ChargeMarker.png"
                        });
                    </c:if>
                    <c:if test="${ vo.cpTp == 1 || vo.cpTp == 2 || vo.cpTp == 3 || vo.cpTp == 4 || vo.cpTp == 6 || vo.cpTp == 7 }">
                        var marker = new naver.maps.Marker({
                        map: map,
                        position: new naver.maps.LatLng(areaArr['${status.index}'].lat , areaArr['${status.index}'].lng),
                        icon : "../images/DefaultMarker.png"
                        });
                    </c:if>
                </c:when>
                
                <c:when test="${user.mem_type == 6}">
                    <c:if test="${vo.cpTp == 6 || vo.cpTp == 9}">
                        var marker = new naver.maps.Marker({
                        map: map,
                        position: new naver.maps.LatLng(areaArr['${status.index}'].lat , areaArr['${status.index}'].lng),
                        icon : "../images/ChargeMarker.png"
                        });
                    </c:if>
                    <c:if test="${ vo.cpTp == 1 || vo.cpTp == 2 || vo.cpTp == 3 || vo.cpTp == 4 || vo.cpTp == 5 || vo.cpTp == 7 || vo.cpTp == 8 || vo.cpTp == 10}">
                        var marker = new naver.maps.Marker({
                        map: map,
                        position: new naver.maps.LatLng(areaArr['${status.index}'].lat , areaArr['${status.index}'].lng),
                        icon : "../images/DefaultMarker.png"
                        });
                    </c:if>
                </c:when>
                <c:when test="${user.mem_type == 7}">
                    <c:if test="${vo.cpTp == 7 || vo.cpTp == 10}">
                        var marker = new naver.maps.Marker({
                        map: map,
                        position: new naver.maps.LatLng(areaArr['${status.index}'].lat , areaArr['${status.index}'].lng),
                        icon : "../images/ChargeMarker.png"
                        });
                    </c:if>
                    <c:if test="${ vo.cpTp == 1 || vo.cpTp == 2 || vo.cpTp == 3 || vo.cpTp == 4 || vo.cpTp == 5 || vo.cpTp == 6 || vo.cpTp == 8 || vo.cpTp == 9}">
                        var marker = new naver.maps.Marker({
                        map: map,
                        position: new naver.maps.LatLng(areaArr['${status.index}'].lat , areaArr['${status.index}'].lng),
                        icon : "../images/DefaultMarker.png"
                        });
                    </c:if>
                </c:when>
                 
                <c:otherwise>
                    <c:if test="${ empty user }">
                    var marker = new naver.maps.Marker({
                        map: map,
                        position: new naver.maps.LatLng(areaArr['${status.index}'].lat , areaArr['${status.index}'].lng),
                        icon : "../images/DefaultMarker.png"
                    });
                    </c:if>
                </c:otherwise>
             </c:choose>
            
            var infoWindow = new naver.maps.InfoWindow({
            content: areaArr['${status.index}'].content
            });
        </c:if>

        markers.push(marker);
        infoWindows.push(infoWindow);

        <c:if test="${status.last}">
        var marker = new naver.maps.Marker({
            map: map,
            position: new naver.maps.LatLng(latitude, longitude), // 지역구의 위도 경도 넣기 
            title: '현재위치',
            icon: "../images/NowMarker.png",
            size: new naver.maps.Size(15, 30),
            origin: new naver.maps.Point(0, 0),
            anchor: new naver.maps.Point(15, 30),
            animation: naver.maps.Animation.DROP
        });
        var infoWindow = new naver.maps.InfoWindow({
            content: `<form>
            <div id="box111">             
                <div class="panel-heading" style="text-align: center;"><h1>현재위치</h1></div>
            </div>
        </form>`,
        });
        
        markers.push(marker);
        infoWindows.push(infoWindow);
        </c:if>

        </c:forEach>
        areaArr.push(
            {
                content : null,
                lat : latitude,
                lng : longitude
            }
        );
           
    //보이는 지도안에만 마커찍기
    naver.maps.Event.addListener(map, 'idle', function() {
        updateMarkers(map, markers);
    });

    function updateMarkers(map, markers) {

        mapBounds = map.getBounds();
        var marker, position;

        for (var i = 0; i < markers.length; i++) {

            marker = markers[i]
            position = marker.getPosition();

            if (mapBounds.hasLatLng(position)) {
                showMarker(map, marker);
            } else {
                hideMarker(map, marker);
            }
        }
    }

    function showMarker(map, marker) {

        if (marker.getMap()) return;
        marker.setMap(map);
    }

    function hideMarker(map, marker) {

        if (!marker.getMap()) return;
        marker.setMap(null);
    }//보이는 지도안에만 마커 찍기 end

    function getClickHandler(seq){
        return function(e){
            var m_marker = new naver.maps.LatLng(areaArr[seq].lat , areaArr[seq].lng);
            var marker = markers[seq];
            infoWindow = infoWindows[seq];

            if(infoWindow.getMap()){
                infoWindow.close();
            }else{
                infoWindow.open(map,marker);
                map.panTo(m_marker);
            }
        }
    }//getClickHandler-end

    for (var i=0, ii=markers.length; i<ii; i++) {
        naver.maps.Event.addListener(markers[i],'click', getClickHandler(i)); // 클릭한 마커 핸들러
    }

}//init-end

</script>

</body>
</html>