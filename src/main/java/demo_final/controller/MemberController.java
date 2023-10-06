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

import demo_final.dao.MemberDao;
import demo_final.vo.MemberVo;
import demo_final.vo.PaymentVo;

@Controller
public class MemberController {

	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	MemberDao memberDao;

	public MemberController(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@RequestMapping(value = "/member/check_mem_id.do", produces = "application/json;charset=utf-8;")
	@ResponseBody
	public Map<String, Boolean> check_mem_id(String mem_id) {

		MemberVo vo = memberDao.selectOneFromId(mem_id);

		boolean bResult;
		if (vo == null)
			bResult = true;
		else
			bResult = false;

		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("result", bResult);

		return map;
	}

	@RequestMapping(value = "/member/check_pwd.do", produces = "application/json;charset=utf-8;")
	@ResponseBody
	public Map<String, Boolean> check_pwd(String mem_pwd) {

		MemberVo vo = memberDao.selectOneFromId(mem_pwd);

		boolean bResult;
		if (vo == null)
			bResult = true;
		else
			bResult = false;

		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("result", bResult);

		return map;
	}

	@RequestMapping("/member/mypage.do")
	public String list(int mem_idx, Model model) {

		MemberVo vo = memberDao.selectOneFromIdx(mem_idx);

		// request binding
		model.addAttribute("vo", vo);

		return "member/member_mypage";
	}

	@RequestMapping("/member/insert_form.do")
	public String insert_form() {

		return "member/member_insert_form";
	}

	@RequestMapping("/member/insert.do")
	public String insert(MemberVo vo) {

		String mem_ip = request.getRemoteAddr();
		vo.setMem_ip(mem_ip);

		// 5.DB insert
		int res = memberDao.insert(vo);
		if (res == 0) {
		}

		return "redirect:login_form.do";
	}

	@RequestMapping("/member/login_form.do")
	public String login_form() {

		return "member/member_login_form";
	}

	@RequestMapping("/member/login_form2.do")
	public String login_form2() {

		return "member/member_login_form2";
	}

	@RequestMapping("/member/login.do")
	public String login(String mem_id, String mem_pwd, RedirectAttributes ra) {

		MemberVo user = memberDao.selectOneFromId(mem_id);

		if (user == null) {

			ra.addAttribute("reason", "fail_id");
			return "redirect:login_form.do";

		}

		if (user.getMem_pwd().equals(mem_pwd) == false) {

			ra.addAttribute("reason", "fail_pwd");
			ra.addAttribute("mem_id", "mem_id");
			return "redirect:login_form.do";
		}

		if (session.getAttribute("user") != null) {
			session.invalidate();
		}

		session.setAttribute("user", user);

		return "redirect:../";
	}

	@RequestMapping("/member/logout.do")
	public String logout() {

		session.removeAttribute("user");

		return "redirect:../main/main.do";
	}

	@RequestMapping(value = "/member/check_id.do", produces = "application/json;charset=utf-8;")
	@ResponseBody
	public Map<String, Boolean> check_id(String mem_id) {

		MemberVo vo = memberDao.selectOneFromId(mem_id);

		boolean bResult;
		if (vo == null)
			bResult = true;
		else
			bResult = false;

		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("result", bResult);

		return map;
	}

	@RequestMapping("/member/modify_form.do")
	public String modify_form(int mem_idx, Model model) {

		MemberVo vo = memberDao.selectOneFromIdx(mem_idx);

		// request binding
		model.addAttribute("vo", vo);

		return "member/member_modify_form";
	}

	@RequestMapping("/member/modify_form2.do")
	public String modify_form2(int mem_idx, Model model) {

		MemberVo vo = memberDao.selectOneFromIdx(mem_idx);

		// request binding
		model.addAttribute("vo", vo);

		return "member/member_modify_form2";
	}

	@RequestMapping("/member/modify.do")
	public String modify(MemberVo vo, RedirectAttributes ra) {

		// 3.ip
		String mem_ip = request.getRemoteAddr();
		vo.setMem_ip(mem_ip);

		// 5.DB update
		int res = memberDao.update(vo);
		if (res == 0) {
		}

		return "redirect:../main/main.do";
	}

	@RequestMapping("/member/modify2.do")
	public String modify2(MemberVo vo, RedirectAttributes ra) {

		// 3.ip
		String mem_ip = request.getRemoteAddr();
		vo.setMem_ip(mem_ip);

		// 5.DB update
		int res = memberDao.update(vo);
		if (res == 0) {
		}

		return "redirect:../admin/list.do";
	}

	@RequestMapping("/member/delete.do")
	public String delete(int mem_idx) {

		// 2.DB delete
		int res = memberDao.delete(mem_idx);
		if (res == 0) {
		}
		MemberVo memberVo = (MemberVo) session.getAttribute("user");
		if (memberVo.getMem_idx() == mem_idx) {

			return "redirect:logout.do";
		}

		return "redirect:../main/main.do";
	}

	@RequestMapping("/member/delete2.do")
	public String delete2(int mem_idx) {

		// 2.DB delete
		int res = memberDao.delete(mem_idx);
		if (res == 0) {
		}

		return "redirect:../admin/list.do";
	}

	@RequestMapping("/member/order.do")
	public String orderlist(Model model) {

		HttpSession session = request.getSession();
		MemberVo user = (MemberVo) session.getAttribute("user");

		List<PaymentVo> list = memberDao.selectOrderFromIdx(user.getMem_idx());

		model.addAttribute("list", list);

		return "member/product_order";
	}

}
