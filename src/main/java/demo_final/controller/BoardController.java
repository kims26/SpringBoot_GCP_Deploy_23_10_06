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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import demo_final.dao.BoardDao;
import demo_final.vo.BoardVo;
import demo_final.vo.MemberVo;
import util.MyConstant;
import util.Paging;

@Controller
@RequestMapping("/board/")
public class BoardController {

    @Autowired
    HttpSession session;

    @Autowired
    HttpServletRequest request;

    BoardDao boardDao;

    @Autowired // <- 생략가능하다(가급적이면 써주는게 좋다)
    public BoardController(BoardDao boardDao) {
        this.boardDao = boardDao;
    }

    @RequestMapping("list.do") // 위에 "/board/" + "list.do"
    public String list(@RequestParam(name = "search", defaultValue = "all") String search,
            @RequestParam(name = "search_text", defaultValue = "") String search_text,
            @RequestParam(name = "page", defaultValue = "1") int nowPage, Model model) {

        // 검색조건을 담을 Map
        Map<String, Object> map = new HashMap<String, Object>();

        // 가져올 게시물 시작/끝을 구한다
        int start = (nowPage - 1) * MyConstant.Board.BLOCK_LIST + 1;
        int end = start + MyConstant.Board.BLOCK_LIST - 1;

        map.put("start", start);
        map.put("end", end);

        // 검색 map조건포장
        if (search.equals("name_subject_content")) {
            // 이름 + 제목+ 내용
            map.put("name", search_text);
            map.put("subject", search_text);
            map.put("content", search_text);

        } else if (search.equals("name")) {
            // 이름
            map.put("name", search_text);
        } else if (search.equals("subject")) {
            // 제목
            map.put("subject", search_text);
        } else if (search.equals("content")) {
            // 내용
            map.put("content", search_text);
        }
        List<BoardVo> list = boardDao.selectConditionList(map);

        // 전체 게시물 수
        int rowTotal = boardDao.selectRowTotal(map);// 현재 map 정보는 일단 무시

        // 페이징 메뉴 생성하기
        // 검색 조건 필터
        String search_filter = String.format("search=%s&search_text=%s", search, search_text);

        String pageMenu = Paging.getPaging("list.do",
                search_filter,
                nowPage,
                rowTotal,
                MyConstant.Board.BLOCK_LIST,
                MyConstant.Board.BLOCK_PAGE);

        // 이전 view.do에서 session저장해놓은 show값 지우기
        session.removeAttribute("shows");

        // model->DispatcherServlet전달->request binding
        // ->return되는 뷰정보를 이용해서 forward
        model.addAttribute("list", list);
        model.addAttribute("pageMenu", pageMenu);

        return "board/board_list";
    }

    @RequestMapping("list_comment.do") // 위에 "/board/" + "list_comment.do"
    public String list_comment(@RequestParam(name = "search", defaultValue = "all") String search,
            @RequestParam(name = "search_text", defaultValue = "") String search_text,
            @RequestParam(name = "page", defaultValue = "1") int nowPage, Model model, int b_idx) {

        // 검색조건을 담을 Map
        Map<String, Object> map = new HashMap<String, Object>();

        // 가져올 게시물 시작/끝을 구한다
        int start = (nowPage - 1) * MyConstant.Board.BLOCK_LIST + 1;
        int end = start + MyConstant.Board.BLOCK_LIST - 1;

        map.put("start", start);
        map.put("end", end);

        // 검색 map조건포장
        if (search.equals("name_subject_content")) {
            // 이름 + 제목+ 내용
            map.put("name", search_text);
            map.put("subject", search_text);
            map.put("content", search_text);

        } else if (search.equals("name")) {
            // 이름
            map.put("name", search_text);
        } else if (search.equals("subject")) {
            // 제목
            map.put("subject", search_text);
        } else if (search.equals("content")) {
            // 내용
            map.put("content", search_text);
        }
        List<BoardVo> list = boardDao.selectConditionList(map);

        // 전체 게시물 수
        int rowTotal = boardDao.selectRowTotal(map);// 현재 map 정보는 일단 무시

        // 페이징 메뉴 생성하기
        // 검색 조건 필터
        String search_filter = String.format("search=%s&search_text=%s", search, search_text);

        String pageMenu = Paging.getPaging1("view.do",
                search_filter,
                nowPage,
                rowTotal,
                MyConstant.Board.BLOCK_LIST,
                MyConstant.Board.BLOCK_PAGE, b_idx);

        // 이전 view.do에서 session저장해놓은 show값 지우기
        session.removeAttribute("show");

        // model->DispatcherServlet전달->request binding
        // ->return되는 뷰정보를 이용해서 forward
        model.addAttribute("list", list);
        model.addAttribute("pageMenu", pageMenu);

        return "board/board_list2";
    }

    @RequestMapping("view.do")
    public String view(int b_idx, Model model) {

        // Session에 show값이 있냐?
        if (session.getAttribute("shows") == null) {
            // 조회수 증가
            int res = boardDao.update_readhit(b_idx);
            if (res == 0) {
            }

            session.setAttribute("shows", true);
            System.out.println(session.getAttribute("shows"));
        }

        BoardVo vo = boardDao.selectOne(b_idx);
        int comment = boardDao.selectComment(b_idx);

        // 결과적으로 request binding
        model.addAttribute("vo", vo);
        model.addAttribute("comment", comment);

        return "board/board_view";
    }

    @RequestMapping("insert_form.do")
    public String insert_form() {

        return "board/board_insert_form";
    }

    // /board.do?b_subject=제목&b_content=내용
    // 새글쓰기
    @RequestMapping("insert.do")
    public String insert(BoardVo vo, RedirectAttributes ra) {

        // 로그인 유저정보 구하기
        MemberVo user = (MemberVo) session.getAttribute("user");

        // 로그아웃된 상태면
        if (user == null) {

            ra.addAttribute("reason", "fail_session_timeout");
            // login_form.do?reason=fail_session_timeout
            return "redirect:../member/login_form.do";
        }

        // 로그인된 유저정보를 vo에 넣는다
        vo.setMem_idx(user.getMem_idx());
        vo.setMem_name(user.getMem_name());

        String b_ip = request.getRemoteAddr();
        vo.setB_ip(b_ip);

        // \n -> <br>
        String b_content = vo.getB_content().replaceAll("\n", "<br>");
        vo.setB_content(b_content);

        // DB Insert
        int res = boardDao.insert(vo);
        if (res == 0) {
        }

        return "redirect:list.do";
    }

    // 수정 폼
    @RequestMapping("modify_form.do")
    public String modify_form(int b_idx, Model model) {

        BoardVo vo = boardDao.selectOne(b_idx);

        // <br> -> \n
        String b_content = vo.getB_content().replaceAll("<br>", "\n");
        vo.setB_content(b_content);

        model.addAttribute("vo", vo);

        return "board/board_modify_form";
    }

    @RequestMapping("modify.do")
    public String modify(BoardVo vo, int page,
            @RequestParam(name = "search", defaultValue = "all") String search,
            @RequestParam(name = "search_text", defaultValue = "") String search_text, RedirectAttributes ra) {

        // 로그인 유저정보 구하기
        MemberVo user = (MemberVo) session.getAttribute("user");

        // 로그아웃된 상태면
        if (user == null) {

            ra.addAttribute("reason", "fail_session_timeout");
            // login_form.do?reason=fail_session_timeout
            return "redirect:../member/login_form.do";
        }

        String b_ip = request.getRemoteAddr();
        vo.setB_ip(b_ip);

        // \n -> <br>
        String b_content = vo.getB_content().replaceAll("\n", "<br>");
        vo.setB_content(b_content);

        // DB update
        int res = boardDao.update(vo);
        if (res == 0) {
        }
        // 수정후 원래뷰로 이동 : view.do?b_idx=5&page=4
        ra.addAttribute("b_idx", vo.getB_idx());
        ra.addAttribute("page", page);
        ra.addAttribute("search", search);
        ra.addAttribute("search_text", search_text);

        return "redirect:view.do";
    }

    @RequestMapping("reply_form.do")
    public String reply_form(int b_idx) {

        return "board/board_reply_form";
    }

    // 답글쓰기
    // /board/reply.do?b_idx=6&b_subject=제목&b_content=내용&page=4
    @RequestMapping("reply.do")
    public String reply(BoardVo vo, int page, RedirectAttributes ra) {

        // 로그인 유저정보 구하기
        MemberVo user = (MemberVo) session.getAttribute("user");

        // 로그아웃된 상태면
        if (user == null) {

            ra.addAttribute("reason", "fail_session_timeout");

            // login_form.do?reason=fail_session_timeout
            return "redirect:../member/login_form.do";
        }

        // 로그인된 유저정보를 vo에 넣는다
        vo.setMem_idx(user.getMem_idx());
        vo.setMem_name(user.getMem_name());

        String b_ip = request.getRemoteAddr();
        vo.setB_ip(b_ip);

        // \n -> <br>
        String b_content = vo.getB_content().replaceAll("\n", "<br>");
        vo.setB_content(b_content);

        // 1.b_idx에 해당되는 기준글 정보 얻어오기
        BoardVo baseVo = boardDao.selectOne(vo.getB_idx());

        // 2.기준글보다 b_step큰 게시물의 b_step를 1씩 증가
        int res = boardDao.update_step(baseVo);

        // 3.현재 등록글에 대한 b_ref,b_step,b_depth설정작업
        vo.setB_ref(baseVo.getB_ref()); // 그대로설정
        vo.setB_step(baseVo.getB_step() + 1); // 기준글+1

        // 4.DB reply
        res = boardDao.reply(vo);
        ra.addAttribute("page", page);

        return "redirect:list.do";
    }

    // 삭제
    @RequestMapping("delete.do")
    public String delete_update_b_use(int b_idx, int page,
            @RequestParam(name = "search", defaultValue = "all") String search,
            @RequestParam(name = "search_text", defaultValue = "") String search_text, RedirectAttributes ra) {

        int res = boardDao.delete(b_idx);// 내부적인 명령 update boatd set b_use_n

        // ↓↓↓가 페이지정보를 넘겨줌
        ra.addAttribute("page", page);// list.do?page=4
        ra.addAttribute("search", search);
        ra.addAttribute("search_text", search_text);

        return "redirect:list.do";
    }

}
