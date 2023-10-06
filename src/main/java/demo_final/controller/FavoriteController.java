package demo_final.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import demo_final.dao.FavoriteDao;
import demo_final.vo.FavoriteVo;
import demo_final.vo.MemberVo;

@Controller
@RequestMapping("/charge/")
public class FavoriteController {

    @Autowired
    FavoriteDao favoriteDao;

    @Autowired
    HttpSession session;

    @Autowired
    HttpServletRequest request;

    public FavoriteController(FavoriteDao favoriteDao) {
        this.favoriteDao = favoriteDao;
    }

    @RequestMapping("list.do")
    public String list(int mem_idx, Model model, RedirectAttributes ra) {

        // 로그인 유저 정보 구하기
        HttpSession session = request.getSession();
        MemberVo user = (MemberVo) session.getAttribute("user");

        // 로그아웃된 상태면
        if (user == null) {

            ra.addAttribute("reason", "fail_session_timeout");

            return "redirect:../member/login_form.do";

        }

        List<FavoriteVo> list = favoriteDao.selectList(mem_idx);

        model.addAttribute("f_list", list);

        return "charge/f_charger_list";
    }

    @RequestMapping(value = "favorite_insert.do", produces = "application/json;charset=utf-8;")
    @ResponseBody
    public Map<String, String> favorite_insert(FavoriteVo vo) {

        int res = 0;

        // 로그인 유저정보 구하기
        MemberVo user = (MemberVo) session.getAttribute("user");

        List<FavoriteVo> f_list = favoriteDao.selectList(user.getMem_idx());

        Map<String, String> map = new HashMap<String, String>();

        for (FavoriteVo f_vo : f_list) {

            if (f_vo.getCsId() == vo.getCsId()) {

                res = favoriteDao.delete(f_vo.getF_idx());

                map.put("result", "delete");

                return map;
            }

        }

        // 로그아웃된 상태면
        // if (user == null) {

        // ra.addAttribute("reason", "fail_session_timeout");
        // // login_form.do?reason=fail_session_timeout
        // return "fail";

        // }

        // vo 포장
        vo.setMem_idx(user.getMem_idx());

        // DB에 저장된 mem_idx의 갯수 가져오기
        int f_count = favoriteDao.c_selectList(vo.getMem_idx());

        // DB Insert
        if (f_count < 10) {

            res = favoriteDao.insert(vo);

        } else {
            // res가 실행되지 않았음으로 map에 result : max 값을 넣어서 반환한다.
            map.put("result", "max");
            return map;
        }

        if (res == 1) {
            // { "result" : "success" }
            map.put("result", "success");
        } else {
            map.put("result", "fail");
        }

        return map;

    }

    @RequestMapping("/favorite_delete.do")
    @ResponseBody
    public Map<String, String> favorite_delete(int f_idx) {

        Map<String, String> map = new HashMap<String, String>();

        int res = favoriteDao.delete(f_idx);

        if (res == 1) {
            // { "result" : "success" }
            map.put("result", "success");
        } else {
            map.put("result", "fail");
        }

        return map;
    }

}
