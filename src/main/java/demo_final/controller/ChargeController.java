package demo_final.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import demo_final.dao.FavoriteDao;
import demo_final.vo.ChargeVo;
import demo_final.vo.FavoriteVo;
import demo_final.vo.MemberVo;
import util.ChargeSearchUtils;

@Controller
@RequestMapping("/charge/")
public class ChargeController {

    @Autowired
    HttpServletRequest request;

    @Autowired
    FavoriteDao favoriteDao;

    // @RequestMapping("keyword.do")
    // public String list(Model model) {

    // int pageNo = 1;
    // int numOfRows = 10;
    // String search_addr = "영등포구 대림동 870";

    // List<ChargeVo> list = ChargeSearchUtils.searchKeyword(pageNo, numOfRows,
    // search_addr);

    // model.addAttribute("list", list);

    // return "charge/f_charger_list";
    // }

    @RequestMapping("view.do")
    public String view(double latitude, double longitude, Model model) {

        // List<ChargeVo> list = ChargeSearchUtils.searchKeyword(1, 3401);

        // 로그인 유저 정보 구하기
        HttpSession session = request.getSession();

        MemberVo user = (MemberVo) session.getAttribute("user");
        List<ChargeVo> list = new ArrayList<ChargeVo>();
        // 로그인 되어있으면
        if (user != null) {
            List<FavoriteVo> f_list = favoriteDao.selectList(user.getMem_idx());
            model.addAttribute("f_list", f_list);
            list = ChargeSearchUtils.searchKeyword(latitude, longitude, 1, 3401, 20000.0, f_list);
        } else {
            // 로그인 안되어있으면
            list = ChargeSearchUtils.searchKeyword(latitude, longitude, 1, 3401, 20000.0);
        }

        model.addAttribute("list", list);

        return "charge/charge_test";
    }

    @RequestMapping("map.do")
    public String map() {

        return "charge/charge_map";
    }

    @RequestMapping("line.do")
    @ResponseBody
    public List<ChargeVo> line(double latitude, double longitude, double lat, double longi) throws IOException {

        // 시작점과 도착점 문자열로 바꿔서 start, goal 대입
        String start = String.format("%s,%s", longitude, latitude);
        String goal = String.format("%s,%s", longi, lat);

        List<ChargeVo> list = ChargeSearchUtils.search_navi(start, goal);

        return list;
    }

}
