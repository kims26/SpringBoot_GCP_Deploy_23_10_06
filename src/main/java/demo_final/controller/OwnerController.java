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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import demo_final.dao.MemberDao;
import demo_final.dao.OwnerDao;
import demo_final.dao.ProductDao;
import demo_final.vo.MemberVo;
import demo_final.vo.OwnerVo;

@Controller
public class OwnerController {

	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	OwnerDao ownerDao;

	@Autowired
	ProductDao productDao;

	@Autowired
	MemberDao memberDao;

	@Autowired
	public OwnerController(OwnerDao ownerDao) {
		this.ownerDao = ownerDao;
	}

	@RequestMapping("/owner/list.do")
	public String list(Model model) {

		List<OwnerVo> list = ownerDao.selectList();

		model.addAttribute("list", list);

		return "owner/owner_list";
	}

	@RequestMapping("/owner/owner_pay_list.do")
	public String owner_pay_list(Model model) {

		List<OwnerVo> list = ownerDao.selectList();
		List<MemberVo> mem_list = memberDao.selectList();
		model.addAttribute("list", list);
		model.addAttribute("mem_list", mem_list);
		return "owner/owner_pay_list";
	}

	@RequestMapping("/owner/owner_chart.do")
	public String rate_list(Model model) {

		List<OwnerVo> list = ownerDao.selectList();

		model.addAttribute("list", list);

		return "owner/owner_chart";
	}

	@RequestMapping("/owner/owner_pay.do")
	public String pay_list(Model model) {

		List<OwnerVo> list = ownerDao.selectList();

		model.addAttribute("list", list);

		return "owner/owner_pay";
	}

	@RequestMapping("/owner/insert_form.do")
	public String insert_form() {

		return "owner/owner_insert_form";
	}

	@RequestMapping("/owner/insert.do")
	public String insert(OwnerVo vo) {

		int res = ownerDao.insertPendingOwner(vo);
		if (res == 0) {
		}

		return "redirect:wait_form.do";
	}

	@RequestMapping("/owner/wait_form.do")
	public String wait_form() {

		return "owner/owner_insert_msg";
	}

	@RequestMapping("/owner/wait_insert.do")
	public String insert(OwnerVo vo, RedirectAttributes ra) {
		if (!"대기".equals(vo.getApprovalStatus())) {
			ra.addAttribute("reason", "대기");
			// 신청대기 페이지로 이동
			return "redirect:wait_form.do";
		}

		int res = ownerDao.insertPendingOwner(vo);
		if (res == 0) {

		}

		return "redirect:wait_form.do";
	}

	// 승인
	@RequestMapping("/admin/approve_Owner.do")
	public String approveOwner(int o_idx) {

		ownerDao.updateApprovalStatus(o_idx, "승인");
		return "redirect:../admin/admin_o_grade_list.do";
	}

	// 거절
	@RequestMapping("/admin/reject_Owner.do")
	public String rejectOwner(int o_idx) {

		ownerDao.updateApprovalStatus(o_idx, "거절");
		return "redirect:../admin/admin_o_grade_list.do";
	}

	@RequestMapping("/owner/login_form.do")
	public String login_form() {

		return "owner/owner_login_form";
	}

	@RequestMapping("/owner/login.do")
	public String login(String o_id, String o_pwd,
			@RequestParam(name = "url", defaultValue = "") String url,
			RedirectAttributes ra) {

		OwnerVo owner = ownerDao.selectOneFromId(o_id);

		if (owner == null) {

			ra.addAttribute("reason", "fail_id");
			return "redirect:login_form.do";

		}

		if (owner.getO_pwd().equals(o_pwd) == false) {

			ra.addAttribute("reason", "fail_pwd");
			ra.addAttribute("o_id", o_id);
			return "redirect:login_form.do";
		}

		if (owner.getApprovalStatus().equals("거절")) {

			ra.addAttribute("reason", "승인거절");

			return "redirect:login_form.do";
		}

		if (owner.getApprovalStatus().equals("대기")) {

			ra.addAttribute("reason", "승인대기");

			return "redirect:login_form.do";
		}

		if (session.getAttribute("user") != null) {
			session.invalidate();
		}

		session.setAttribute("owner", owner);

		if (url.isEmpty()) {
			return "redirect:../product/list.do";
		}

		return "redirect:" + url;
	}

	@RequestMapping("/owner/logout.do")
	public String logout() {

		session.removeAttribute("owner");

		return "redirect:../product/list.do";
	}

	@RequestMapping(value = "/owner/check_id.do", produces = "application/json;charset=utf-8;")
	@ResponseBody
	public Map<String, Boolean> check_id(String o_id) {

		OwnerVo vo = ownerDao.selectOneFromId(o_id);

		boolean bResult;
		if (vo == null)
			bResult = true;
		else
			bResult = false;

		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("result", bResult);

		return map;
	}

	@RequestMapping("/owner/modify_form.do")
	public String modify_form(int o_idx, Model model) {

		OwnerVo vo = ownerDao.selectOneFromIdx(o_idx);

		model.addAttribute("vo", vo);

		return "owner/owner_modify_form";
	}

	@RequestMapping("/owner/modify_form2.do")
	public String modify_form2(int o_idx, Model model) {

		OwnerVo vo = ownerDao.selectOneFromIdx(o_idx);

		model.addAttribute("vo", vo);

		return "owner/owner_modify_form2";
	}

	@RequestMapping("/owner/modify.do")
	public String update(OwnerVo vo) {

		int res = ownerDao.update(vo);

		System.out.println("idx" + vo.getO_idx());

		if (res == 0) {
		}

		return "redirect:../product/list.do";
	}

	@RequestMapping("/owner/modify2.do")
	public String update2(OwnerVo vo) {

		int res = ownerDao.update(vo);

		System.out.println("idx" + vo.getO_idx());

		if (res == 0) {
		}

		return "redirect:../admin/list.do";
	}

	@RequestMapping("/owner/delete.do")
	public String delete(int o_idx) {

		// 2.DB delete
		int res = ownerDao.delete(o_idx);
		if (res == 0) {
		}
		OwnerVo ownerVo = (OwnerVo) session.getAttribute("owner");
		if (ownerVo.getO_idx() == o_idx) {

			return "redirect:logout.do";
		}
		return "redirect:list.do";
	}

	@RequestMapping("/owner/delete2.do")
	public String delete2(int o_idx) {

		// 2.DB delete
		int res = ownerDao.delete(o_idx);
		if (res == 0) {
		}

		session.removeAttribute("owner");

		return "redirect:../admin/list.do";
	}

}
