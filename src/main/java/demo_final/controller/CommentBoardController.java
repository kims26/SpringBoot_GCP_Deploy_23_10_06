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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import demo_final.dao.CommentBoardDao;
import demo_final.vo.CommentBoardVo;
import util.MyConstant;
import util.Paging;

@Controller
@RequestMapping("/board/")
public class CommentBoardController {

    @Autowired
    HttpSession session;

    @Autowired
    HttpServletRequest request;

    CommentBoardDao commentboardDao;

    @Autowired
    public CommentBoardController(CommentBoardDao commentboardDao) {
        this.commentboardDao = commentboardDao;
    }

    // /boatd/comment_list.do?b_idx=5&page=1
    // 댓글 목록 가져오기
    @RequestMapping("comment_list.do")
    public String comment_list(int b_idx,
            @RequestParam(name = "page", defaultValue = "1") int nowPage, Model model) {

        Map<String, Object> map = new HashMap<String, Object>();

        // 검색범위 구하기
        int start = (nowPage - 1) * MyConstant.Comment.BLOCK_LIST + 1;
        int end = start + MyConstant.Comment.BLOCK_LIST - 1;

        // 검색조건을 map에 포장
        map.put("b_idx", b_idx);
        map.put("start", start);
        map.put("end", end);

        List<CommentBoardVo> list = commentboardDao.selectList(map);

        int rowTotal = commentboardDao.selectRowTotal(map);// 현재 map 정보는 일단 무시

        String pageMenu = Paging.getPaging1("comment_list.do",
                nowPage,
                rowTotal,
                MyConstant.Comment.BLOCK_LIST,
                MyConstant.Comment.BLOCK_PAGE);

        // 이전 view.do에서 session저장해놓은 show값 지우기
        session.removeAttribute("show");

        model.addAttribute("list", list);
        model.addAttribute("pageMenu", pageMenu);

        return "board/comment_list"; // /WEB_INF/view/board/comment_list.jsp
    }

    @RequestMapping("comment_insert.do")
    @ResponseBody
    public Map<String, String> comment_insert(CommentBoardVo vo) {

        String c_b_ip = request.getRemoteAddr();
        vo.setC_b_ip(c_b_ip);

        // \n -> <br>
        String c_b_content = vo.getC_b_content().replaceAll("\n", "<br>");
        vo.setC_b_content(c_b_content);

        int res = commentboardDao.insert(vo);

        Map<String, String> map = new HashMap<String, String>();

        if (res == 1) {
            map.put("result", "success");
        } else {
            map.put("result", "fail");
        }
        return map;
    }

    @RequestMapping("comment_delete.do")
    @ResponseBody
    public Map<String, String> comment_delete(int c_b_idx) {

        int res = commentboardDao.delete(c_b_idx);

        Map<String, String> map = new HashMap<String, String>();

        if (res == 1) {

            map.put("result", "success");
        } else {
            map.put("result", "fail");
        }
        return map;

    }

}
