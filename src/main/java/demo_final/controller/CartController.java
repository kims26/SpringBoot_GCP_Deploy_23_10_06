package demo_final.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import demo_final.dao.CartDao;
import demo_final.dao.CategoryDao;
import demo_final.dao.ProductDao;
import demo_final.vo.CartVo;
import demo_final.vo.CategoryVo;
import demo_final.vo.MemberVo;
import demo_final.vo.ProductVo;

@Controller
public class CartController {

	@Autowired
	HttpSession session;

	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpServletResponse response;
	@Autowired
	CartDao cartDao;
	@Autowired
	CategoryDao categoryDao;
	@Autowired
	ProductDao productDao;

	public CartController(CartDao cartDao) {
		this.cartDao = cartDao;
	}

	@RequestMapping("/product/cart_list.do")
	public String cart_list(CartVo vo, Model model, RedirectAttributes ra) throws IOException {

		// 로그인 유저정보 구하기
		HttpSession session = request.getSession();
		MemberVo user = (MemberVo) session.getAttribute("user");

		// 로그아웃된 상태면
		if (user == null) {

			ra.addAttribute("reason", "fail_session_timeout");
			// login_form.do?reason=fail_session_timeout
			return "redirect:../member/login_form.do";
		}

		// 로그인된 유저정보를 vo에 넣는다
		vo.setMem_idx(user.getMem_idx());

		// 장바구니 목록구하기
		List<CartVo> list = cartDao.selectList(vo.getMem_idx());

		List<ProductVo> list2 = new ArrayList<>();
		for (CartVo vv : list) {
			int idx = vv.getP_idx();
			ProductVo v2 = productDao.selectOne(idx);
			list2.add(v2);
		}

		// 장바구니 총액구하기
		int total_amount = cartDao.selectTotalAmount(vo.getMem_idx());

		// 카테고리 목록

		List<CategoryVo> category_list = categoryDao.selectList();

		// request binding
		// request.setAttribute("list", list);
		// request.setAttribute("total_amount", total_amount);
		// request.setAttribute("category_list", category_list);
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("total_amount", total_amount);
		model.addAttribute("category_list", category_list);

		return "product/cart_list";
	}

	// 장바구니 수량 수정
	@RequestMapping("/product/cart_update.do")
	public String cart_update(CartVo vo, RedirectAttributes ra) {

		// /product/cart_update.do?cart_idx=5&cart_cnt_=10

		// 수정할 정보 포장

		// DB update
		int res = cartDao.update(vo);

		ra.addAttribute("mem_idx", vo.getMem_idx());
		ra.addAttribute("cart_num", vo.getCart_num());
		return "redirect:cart_list.do";
	}

	// 장바구니 삭제
	@RequestMapping("/product/cart_delete.do")
	public String cart_delete(int cart_idx) {

		// /product/cart_delete.do?cart_idx=5

		// DB update
		int res = cartDao.delete(cart_idx);

		return "redirect:cart_list.do";
	}

	// 선택항목 삭제

	@RequestMapping("/product/cart_delete_select.do")
	public String cart_delete_select(String[] cart_idx) {

		// 배열로 파라메터 받기

		// String [] str_cart_idx_array = {"5","6"};
		// 방법1 : 배열을 순환시켜서 삭제

		// for(String str_cart_idx : str_cart_idx_array) {

		// int cart_idx = Integer.parseInt(str_cart_idx);

		// DB update int res = cartDao.delete(cart_idx);

		// }

		// 방법2 : mybatis 기능 (foreach)
		// mybatis parameter 전달방법 : 배열을 Map에 넣어서 전달
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("cart_idx_array", cart_idx);

		int res = cartDao.deleteMap(map);

		return "redirect:cart_list.do";

	}

	// 장바구니 담기
	@RequestMapping(value = "/product/cart_insert.do", produces = "text/json;charset=utf-8;")
	@ResponseBody
	public String cart_insert(CartVo vo, RedirectAttributes ra) throws IOException {

		// /product/cart_insert.do?p_idx=5&mem_idx=1

		// 로그인상태정보 얻어온다

		MemberVo user = (MemberVo) session.getAttribute("user");

		if (user == null) {

			ra.addAttribute("reason", "fail_session_timeout");
			return "redirect:../member/login_form.do";
			// response.sendRedirect("../member/login_form.do?reason=fail_session_timeout");

		}

		// parameter받기
		int p_idx = Integer.parseInt(request.getParameter("p_idx"));
		int mem_idx = user.getMem_idx();

		// 장바구니에 이미등록된는지 여부 체크
		vo.setP_idx(p_idx);
		vo.setMem_idx(mem_idx);

		CartVo resVo = cartDao.selectOne(vo);

		String result = "success";

		// 등록되어있지 않으면=>등록
		if (resVo == null) {

			int res = cartDao.insert(vo);

			if (res == 0)
				result = "fail";
		} else {
			// 이미등록 되어 있으면
			result = "exist";

		}

		// 결과=>JSON전송 : {"result":"success"}
		JSONObject json = new JSONObject();
		json.put("result", result);

		return json.toString();
	}

	// 결제폼 띄우기

	@RequestMapping("/product/cart_payment_form.do")
	public String cart_payment_form(CartVo vo, String[] cart_idx, Model model, RedirectAttributes ra) {

		HttpSession session = request.getSession();
		MemberVo user = (MemberVo) session.getAttribute("user");

		if (user == null) {
			ra.addAttribute("reason", "fail_session_timeout");
			return "redirect:../member/login_form.do";
			// response.sendRedirect("../member/login_form.do?reason=fail_session_timeout");

		}

		// 배열로 파라메터 받기
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("cart_idx_array", cart_idx);

		// 결제목록구하기
		List<CartVo> payment_list = cartDao.selectListPay(map);

		List<ProductVo> list2 = new ArrayList<>();
		for (CartVo vv : payment_list) {
			int idx = vv.getP_idx();
			ProductVo v2 = productDao.selectOne(idx);
			list2.add(v2);
		}

		// 결제목록 총액구하기
		int cart_payment_total_amount = cartDao.selectPaymentTotalAmount(map);

		// request binding

		model.addAttribute("list2", list2);

		model.addAttribute("payment_list", payment_list);
		model.addAttribute("cart_payment_total_amount", cart_payment_total_amount);

		return "/product/product_cart_payment_list";
	}

}