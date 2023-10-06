package util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.json.JSONArray;
import org.json.JSONObject;

import demo_final.dao.FavoriteDao;
import demo_final.vo.ChargeVo;
import demo_final.vo.FavoriteVo;

public class ChargeSearchUtils {

    // public static List<ChargeVo> searchKeyword(int pageNo, int numOfRows, String
    // search_addr) {
    // List<ChargeVo> list = new ArrayList<ChargeVo>();

    // try {
    // search_addr = URLEncoder.encode(search_addr, "utf-8");

    // String serviceKey =
    // "EdmhjIIQ%2F3Tis3HnKni%2FSNCG93dl%2B8GnMUDAS%2B%2FIa7oNrmiWSHnUqcKPgAsG9AZgBBN%2BFET7DACI8gTdevpnYA%3D%3D";

    // String urlStr = String.format(
    // "http://openapi.kepco.co.kr/service/EvInfoServiceV2/getEvSearchList?serviceKey=%s&pageNo=%d&numOfRows=%d&addr=%s",
    // serviceKey, pageNo, numOfRows, search_addr);

    // URL url = new URL(urlStr);

    // HttpURLConnection connection = (HttpURLConnection) url.openConnection();

    // // 받을요청타입 설정
    // connection.setRequestProperty("Content-Type", "application/xml");
    // connection.connect();

    // SAXBuilder builder = new SAXBuilder();

    // Document doc = builder.build(connection.getInputStream());

    // // <response> 시작점
    // Element root = doc.getRootElement();

    // // root < body < items < item의 리스트를 가져온다.
    // List<Element> element_list = root.getChild("body")
    // .getChild("items")
    // .getChildren("item");

    // // System.out.printf("조회수:%d\n",element_list.size());

    // for (Element item : element_list) {
    // String cpNm = item.getChildText("cpNm");
    // String chargeTp = item.getChildText("chargeTp");
    // String statUpdateDatetime =
    // item.getChildText("statUpdateDatetime").substring(0, 16);
    // String csNm = item.getChildText("csNm");
    // String addr = item.getChildText("addr");

    // int cpId = 0;
    // int cpStat = 0;
    // int csId = 0;
    // int cpTp = 0;
    // double lat = 0;
    // double longi = 0;

    // try {

    // cpId = Integer.parseInt(item.getChildText("cpId"));
    // cpStat = Integer.parseInt(item.getChildText("cpStat"));
    // csId = Integer.parseInt(item.getChildText("csId"));
    // cpTp = Integer.parseInt(item.getChildText("cpTp"));
    // lat = Double.parseDouble(item.getChildText("lat"));
    // longi = Double.parseDouble(item.getChildText("longi"));

    // } catch (Exception e) {

    // // e.printStackTrace();

    // }

    // // 상품목록을 포장
    // ChargeVo vo = new ChargeVo();
    // vo.setCpNm(cpNm);
    // vo.setChargeTp(chargeTp);
    // vo.setStatUpdateDatetime(statUpdateDatetime);

    // vo.setCsNm(csNm);
    // vo.setAddr(addr);
    // vo.setCpStat(cpStat);
    // vo.setCpId(cpId);
    // vo.setCsId(csId);
    // vo.setCpTp(cpTp);
    // vo.setLat(lat);
    // vo.setLongi(longi);

    // // ArrayList에 넣기
    // list.add(vo);

    // }

    // } catch (Exception e) {

    // e.printStackTrace();
    // }

    // return list;
    // }

    public static List<ChargeVo> searchKeyword(int pageNo, int numOfRows) {
        List<ChargeVo> list = new ArrayList<ChargeVo>();

        try {

            String serviceKey = "EdmhjIIQ%2F3Tis3HnKni%2FSNCG93dl%2B8GnMUDAS%2B%2FIa7oNrmiWSHnUqcKPgAsG9AZgBBN%2BFET7DACI8gTdevpnYA%3D%3D";

            String urlStr = String.format(
                    "http://openapi.kepco.co.kr/service/EvInfoServiceV2/getEvSearchList?serviceKey=%s&pageNo=%d&numOfRows=%d",
                    serviceKey, pageNo, numOfRows);

            URL url = new URL(urlStr);

            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            // 받을요청타입 설정
            connection.setRequestProperty("Content-Type", "application/xml");
            connection.connect();

            SAXBuilder builder = new SAXBuilder();

            Document doc = builder.build(connection.getInputStream());

            // <response> 시작점
            Element root = doc.getRootElement();

            // root < body < items < item의 리스트를 가져온다.
            List<Element> element_list = root.getChild("body")
                    .getChild("items")
                    .getChildren("item");

            for (Element item : element_list) {
                String cpNm = item.getChildText("cpNm");
                String chargeTp = item.getChildText("chargeTp");
                String statUpdateDatetime = item.getChildText("statUpdateDatetime").substring(0, 16);
                String csNm = item.getChildText("csNm");
                String addr = item.getChildText("addr");

                int cpId = 0;
                int cpStat = 0;
                int csId = 0;
                int cpTp = 0;
                double lat = 0;
                double longi = 0;

                try {

                    cpId = Integer.parseInt(item.getChildText("cpId"));
                    cpStat = Integer.parseInt(item.getChildText("cpStat"));
                    csId = Integer.parseInt(item.getChildText("csId"));
                    cpTp = Integer.parseInt(item.getChildText("cpTp"));
                    lat = Double.parseDouble(item.getChildText("lat"));
                    longi = Double.parseDouble(item.getChildText("longi"));

                } catch (Exception e) {

                    // e.printStackTrace();

                }

                // 상품목록을 포장
                ChargeVo vo = new ChargeVo();
                vo.setCpNm(cpNm);
                vo.setChargeTp(chargeTp);
                vo.setStatUpdateDatetime(statUpdateDatetime);

                vo.setCsNm(csNm);
                vo.setAddr(addr);
                vo.setCpStat(cpStat);
                vo.setCpId(cpId);
                vo.setCsId(csId);
                vo.setCpTp(cpTp);
                vo.setLat(lat);
                vo.setLongi(longi);

                // ArrayList에 넣기
                list.add(vo);

            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return list;
    }

    public static List<ChargeVo> searchKeyword(double lat1, double lon1, int pageNo, int numOfRows, double radius,
            List<FavoriteVo> f_list) {
        List<ChargeVo> list = new ArrayList<ChargeVo>();

        try {

            String serviceKey = "EdmhjIIQ%2F3Tis3HnKni%2FSNCG93dl%2B8GnMUDAS%2B%2FIa7oNrmiWSHnUqcKPgAsG9AZgBBN%2BFET7DACI8gTdevpnYA%3D%3D";

            String urlStr = String.format(
                    "http://openapi.kepco.co.kr/service/EvInfoServiceV2/getEvSearchList?serviceKey=%s&pageNo=%d&numOfRows=%d",
                    serviceKey, pageNo, numOfRows);

            URL url = new URL(urlStr);

            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            // 받을요청타입 설정
            connection.setRequestProperty("Content-Type", "application/xml");
            connection.connect();

            SAXBuilder builder = new SAXBuilder();

            Document doc = builder.build(connection.getInputStream());

            // <response> 시작점
            Element root = doc.getRootElement();

            // root < body < items < item의 리스트를 가져온다.
            List<Element> element_list = root.getChild("body")
                    .getChild("items")
                    .getChildren("item");

            for (Element item : element_list) {
                String cpNm = item.getChildText("cpNm");
                String chargeTp = item.getChildText("chargeTp");
                String statUpdateDatetime = item.getChildText("statUpdateDatetime").substring(0, 16);
                String csNm = item.getChildText("csNm");
                String addr = item.getChildText("addr");

                int cpId = 0;
                int cpStat = 0;
                int csId = 0;
                int cpTp = 0;
                double lat = 0;
                double longi = 0;

                try {

                    cpId = Integer.parseInt(item.getChildText("cpId"));
                    cpStat = Integer.parseInt(item.getChildText("cpStat"));
                    csId = Integer.parseInt(item.getChildText("csId"));
                    cpTp = Integer.parseInt(item.getChildText("cpTp"));
                    lat = Double.parseDouble(item.getChildText("lat"));
                    longi = Double.parseDouble(item.getChildText("longi"));

                } catch (Exception e) {

                    // e.printStackTrace();

                }

                double distance = MyDistance.getDistance(lat1, lon1, lat, longi);

                // 상품목록을 포장
                ChargeVo vo = new ChargeVo();
                vo.setCpNm(cpNm);
                vo.setChargeTp(chargeTp);
                vo.setStatUpdateDatetime(statUpdateDatetime);

                vo.setCsNm(csNm);
                vo.setAddr(addr);
                vo.setCpStat(cpStat);
                vo.setCpId(cpId);
                vo.setCsId(csId);
                vo.setCpTp(cpTp);
                vo.setLat(lat);
                vo.setLongi(longi);

                // ArrayList에 넣기
                if (radius >= distance) {
                    list.add(vo);
                } else {
                    for (FavoriteVo f_vo : f_list) {
                        if (csId == f_vo.getCsId()) {
                            list.add(vo);
                        }
                    }
                }

            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return list;
    }

    public static List<ChargeVo> searchKeyword(double lat1, double lon1, int pageNo, int numOfRows, double radius) {
        List<ChargeVo> list = new ArrayList<ChargeVo>();

        try {

            String serviceKey = "EdmhjIIQ%2F3Tis3HnKni%2FSNCG93dl%2B8GnMUDAS%2B%2FIa7oNrmiWSHnUqcKPgAsG9AZgBBN%2BFET7DACI8gTdevpnYA%3D%3D";

            String urlStr = String.format(
                    "http://openapi.kepco.co.kr/service/EvInfoServiceV2/getEvSearchList?serviceKey=%s&pageNo=%d&numOfRows=%d",
                    serviceKey, pageNo, numOfRows);

            URL url = new URL(urlStr);

            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            // 받을요청타입 설정
            connection.setRequestProperty("Content-Type", "application/xml");
            connection.connect();

            SAXBuilder builder = new SAXBuilder();

            Document doc = builder.build(connection.getInputStream());

            // <response> 시작점
            Element root = doc.getRootElement();

            // root < body < items < item의 리스트를 가져온다.
            List<Element> element_list = root.getChild("body")
                    .getChild("items")
                    .getChildren("item");

            for (Element item : element_list) {
                String cpNm = item.getChildText("cpNm");
                String chargeTp = item.getChildText("chargeTp");
                String statUpdateDatetime = item.getChildText("statUpdateDatetime").substring(0, 16);
                String csNm = item.getChildText("csNm");
                String addr = item.getChildText("addr");

                int cpId = 0;
                int cpStat = 0;
                int csId = 0;
                int cpTp = 0;
                double lat = 0;
                double longi = 0;

                try {

                    cpId = Integer.parseInt(item.getChildText("cpId"));
                    cpStat = Integer.parseInt(item.getChildText("cpStat"));
                    csId = Integer.parseInt(item.getChildText("csId"));
                    cpTp = Integer.parseInt(item.getChildText("cpTp"));
                    lat = Double.parseDouble(item.getChildText("lat"));
                    longi = Double.parseDouble(item.getChildText("longi"));

                } catch (Exception e) {

                    // e.printStackTrace();

                }

                double distance = MyDistance.getDistance(lat1, lon1, lat, longi);

                if (radius >= distance) {
                    // 상품목록을 포장
                    ChargeVo vo = new ChargeVo();
                    vo.setCpNm(cpNm);
                    vo.setChargeTp(chargeTp);
                    vo.setStatUpdateDatetime(statUpdateDatetime);

                    vo.setCsNm(csNm);
                    vo.setAddr(addr);
                    vo.setCpStat(cpStat);
                    vo.setCpId(cpId);
                    vo.setCsId(csId);
                    vo.setCpTp(cpTp);
                    vo.setLat(lat);
                    vo.setLongi(longi);

                    // ArrayList에 넣기
                    list.add(vo);
                }

            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return list;
    }

    public static List<ChargeVo> search_navi(String start, String goal) throws IOException {

        List<ChargeVo> list = new ArrayList<ChargeVo>();

        // 네이버 API 인증 키
        String clientId = "14z31bvsjz";
        String clientSecret = "hgWdq6Jl3EiL9vrRwIUxJoEbHH51G9BhvOpVzw1N";

        String urlStr = String.format(
                "https://naveropenapi.apigw.ntruss.com/map-direction/v1/driving?start=%s&goal=%s&option=trafast",
                start, goal);

        URL url = new URL(urlStr);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        // 발급받은 ID
        connection.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
        // 발급받은 PW
        connection.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
        // 받을요청타입
        connection.setRequestProperty("Content-Type", "application/json");

        connection.connect();

        InputStream is = connection.getInputStream();// url.openStream();

        InputStreamReader isr = new InputStreamReader(is, "utf-8");

        BufferedReader br = new BufferedReader(isr);

        StringBuffer sb = new StringBuffer();

        while (true) {

            String data = br.readLine();
            // System.out.println(data);

            if (data == null)
                break;

            sb.append(data);
        }

        String json_data = sb.toString();

        // System.out.println(json_data);

        // JSON Parsing......
        JSONObject json = new JSONObject(json_data);

        JSONArray naviArray = json.getJSONObject("route").getJSONArray("trafast");

        // System.out.println(naviArray);

        for (int i = 0; i < naviArray.length(); i++) {

            JSONObject navi = naviArray.getJSONObject(i);

            JSONArray pathArray = navi.getJSONArray("path");

            for (int k = 0; k < pathArray.length(); k++) {

                // System.out.println(pathArray.getJSONArray(k));
                double longitude = pathArray.getJSONArray(k).getDouble(0);
                double latitude = pathArray.getJSONArray(k).getDouble(1);

                // System.out.printf("lat:%f lon:%f\n", latitude, longitude);

                ChargeVo vo = new ChargeVo();

                vo.setPath_lat(latitude);
                vo.setPath_longi(longitude);
                // System.out.println(latitude);
                // System.out.println(longitude);

                list.add(vo);
            }

            // System.out.println(list);

            // ChargeVo 생성 및 값을 넣는다.
            // vo.setLonlat_path(Lonlat_path);

            // ArrayList 추가
            // list.add(Lonlat_path);

            // System.out.println(Lonlat_path);

        }

        return list;

    }

}
