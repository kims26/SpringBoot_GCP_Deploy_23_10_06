<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8' %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>

<!DOCTYPE html>
<html>
    
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../css/reset.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=14z31bvsjz"></script>
    
    <script>    
    var markers;
    var mapBounds;
    var infoWindows;

    var latitude = 37.4820869;
    var longitude = 126.9013946;

   //browser초기화시 현재 위치의 위도/경도를 구한다
   window.onload = function(){
	   
		//  if (navigator.geolocation) {
		//      navigator.geolocation.getCurrentPosition(function(position){
		//     	latitude =  position.coords.latitude;
        // 		longitude=  position.coords.longitude;

        //         console.log("latitude : "+latitude);
        //         console.log("longitude : "+longitude);

        $.ajax({
            type : "GET",
            url  : "view.do",
            data : {
                "latitude" : latitude,
                "longitude" : longitude
                },
            datatype : "json",
            success : function (res_data) {
                $("#disp_map").html(res_data);

                f_list();

            },
            beforeSend: function () {
                var width = 0;
                var height = 0;
                var left = 0;
                var top = 0;

                width = 300;
                height = 300;
                top = ( $(window).height() - height ) / 2 + $(window).scrollTop();
                left = ( $(window).width() - width ) / 2 + $(window).scrollLeft();

                if($("#div_ajax_load_image").length != 0) {
                        $("#div_ajax_load_image").css({
                                "top": top+"px",
                                "left": left+"px"
                        });
                        $("#div_ajax_load_image").show();
                }
                else {
                        $('body').append('<div id="div_ajax_load_image" style="position:absolute; top:' + top + 'px; left:' + left + 'px; width:' + width + 'px; height:' + height + 'px; z-index:9999;margin:auto; padding:0;"><img src="../images/loading3.gif" style="width:200px; height:200px;"></div>');
                }

            }, complete: function () {
                
                setTimeout( function(){ $("#div_ajax_load_image").hide();}, 500);
            },
            error : function(err){
                alert(err.status);   //error code
            } 
        });
             
    };

    function f_list(){

            //if(${user != null}){
            if("${ not empty user }"=="true"){    

                var mem_idx = "${user.mem_idx}";

                $.ajax({

                    url  : "list.do",
                    data : {
                        "mem_idx" : mem_idx
                    },
                    success : function(res_data){
                        $("#disp_favorite").html(res_data);
                    },
                    error : function(err){
                        alert(err.status);
                    }
            
                });

            }
        
        }

        function favorite(f){
        
        let mem_idx = f.mem_idx.value;
        let marker_idx = f.marker_idx.value;
        let lat = f.lat.value;
        let longi = f.longi.value;
        let csNm = f.csNm.value;
        let csId = f.csId.value;
        let addr = f.addr.value;
        let cpTp = f.cpTp.value;
        let chargeTp = f.chargeTp.value;
        let cpStat = f.cpStat.value;
        let statUpdateDatetime = f.statUpdateDatetime.value;

       // alert(location.href);

        $.ajax({
           url : "favorite_insert.do",
           data : {"marker_idx" : marker_idx,
           "mem_idx" : mem_idx,
           "f_lat" : lat,
           "f_longi":longi,
           "csNm" : csNm,
           "csId" : csId,
           "addr" : addr,
           "cpTp" : cpTp,
           "chargeTp" : chargeTp,
           "cpStat" : cpStat,
           "statUpdateDatetime" : statUpdateDatetime
        },dataType:"json",
        success : function(res_data){    

            if(res_data.result=="max"){
                alert("즐겨찾기는 10개 까지만 가능합니다");
            }

            if(res_data.result=="success"){
               
                f_list();
                $("#f_star_"+csId).attr("src","../images/yellowStar.png");

            }

            if(res_data.result=="delete"){

                f_list();
                $("#f_star_"+csId).attr("src","../images/star.png");

            }
        },error:function(err){
            //alert(err.status);
        }
    });
        
    }

    </script>
    <style>
        #table{
            width: 100%;
            height: 900px;
        }
        #disp_map{
            width: 100%;
            height: 900px;
            float: left;
            overflow: hidden;
            margin: 0;
        }

        #disp_favorite{
            width: 40%;    
            position: absolute;
            right: 0;
            top: 0;
      
        }
    
 
        #inner{
            width: 80%;
            margin: auto !important;    
            height: 900px;
            position: relative;
        }
        #box .panel {
            height: 900px;
            overflow: scroll;
        }
        #p_box .panel{

            
            margin: 0;
            background: 0;
            border: none;

        }

        .bum_image{

            width: 25px;
            height: 35px;
            margin-bottom: 3px;
        }
        
        #infomation{
            position: absolute; 
            z-index: 50;
            background-color: white;
            border: 1px solid black;
            padding: 10px;
        }
        
    </style>
</head>
<body>
    <%@ include file="../main/header.jsp" %>
    <div id="table">
        <div id="inner">
        <div id="infomation">
            <div><img class="bum_image" src="../images/DefaultMarker.png"> : 전체 충전소 </div>
            <div><img class="bum_image" src="../images/FavoriteMarker.png"> : 즐겨찾기 </div>
            <div><img class="bum_image" src="../images/ChargeMarker.png"> : 내 차량 충전소 </div>
            <div><img class="bum_image" src="../images/NowMarker.png"> : 현재 위치 </div>
            <div style="margin-top : 10px">검색 반경 : 20Km </div>
        </div>
        <div id="disp_map"></div>
        <div id="disp_favorite">
         
        </div>
        <div id="p_box"></div>
        </div>
    </div>
    
    <%@ include file="../main/footer.jsp" %>
    
</body>
</html>