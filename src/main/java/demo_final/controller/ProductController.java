package demo_final.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import demo_final.dao.CategoryDao;
import demo_final.dao.OwnerDao;
import demo_final.dao.ProductDao;
import demo_final.vo.CategoryVo;
import demo_final.vo.OwnerVo;
import demo_final.vo.ProductVo;

@Controller
public class ProductController {

	@Autowired
	ServletContext application;

	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	ProductDao productDao;
	CategoryDao categoryDao;
	OwnerDao ownerDao;

	public ProductController(ProductDao productDao, CategoryDao categoryDao, OwnerDao ownerDao) {
		this.productDao = productDao;
		this.categoryDao = categoryDao;
		this.ownerDao = ownerDao;
	}

	@RequestMapping("/product/list.do")
	public String list(@RequestParam(name = "category_idx", defaultValue = "0") int category_idx,
			Model model) {

		List<ProductVo> list = null;

		if (category_idx == 0) {
			list = productDao.selectList();
		} else {
			list = productDao.selectCategoryList(category_idx);
		}
		List<CategoryVo> category_list = categoryDao.selectList();

		// System.out.println(category_List.size());

		model.addAttribute("list", list);
		model.addAttribute("category_list", category_list);

		return "product/product_list";
	}

	@RequestMapping("/owner/my_product_list.do")
	public String mylist(int o_idx, Model model) {

		List<ProductVo> list = productDao.selectOwnerList(o_idx);

		model.addAttribute("list", list);

		return "owner/owner_product_list";
	}

	@RequestMapping("/product/insert_form.do")
	public String insert_form() {

		return "product/product_insert_form";
	}

	@RequestMapping("/product/insert.do")
	public String insert(ProductVo vo,
			@RequestParam("productImage") MultipartFile[] product_array,
			RedirectAttributes ra) throws IllegalStateException, IOException {

		// 로그인상태정보 얻어온다
		OwnerVo owner = (OwnerVo) session.getAttribute("owner");

		if (owner == null) {
			ra.addAttribute("reason", "fail_session_timeout");
			return "redirect:../owner/login_form.do";
		}

		// 사진등록
		// 1.저장경로구하기 : 웹경로->절대경로 구하기
		String web_path = "/upload/";
		String abs_path = application.getRealPath(web_path);

		for (int i = 0; i < product_array.length; i++) {

			MultipartFile product = product_array[i];

			String filename = "no_file";

			if (product.isEmpty() == false) {// 업로드화일 존재하면
				// 임시화일이름
				filename = product.getOriginalFilename();
				// 저장화일정보
				File f = new File(abs_path, filename);

				if (f.exists()) {// 동일화일 존재하면

					long tm = System.currentTimeMillis();
					// 화일명 => 시간_화일명
					filename = String.format("%d_%s", tm, filename);
					f = new File(abs_path, filename);
				}

				// 임시파일->f로 복사
				product.transferTo(f);

				if (i == 0)
					vo.setP_image_s(filename);
				else
					vo.setP_image_l(filename);
			}
		}

		// \n -> <br>
		String p_content = vo.getP_content().replaceAll("\n", "<br>");
		vo.setP_content(p_content);

		// 8.DB insert
		int res = productDao.insert(vo);
		if (res == 0) {
		}

		return "redirect:list.do";

	}

	@RequestMapping(value = "/product/product_one.do", produces = "application/json;charset=utf-8;")
	@ResponseBody
	public Map<String, Object> product_one(int p_idx) {

		ProductVo vo = productDao.selectOne(p_idx);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("p_idx", vo.getP_idx());
		map.put("p_number", vo.getP_number());
		map.put("p_name", vo.getP_name());
		map.put("p_price", vo.getP_price());
		map.put("p_saleprice", vo.getP_saleprice());
		map.put("p_content", vo.getP_content());
		map.put("p_regdate", vo.getP_regdate());
		map.put("category_idx", vo.getCategory_idx());
		map.put("o_idx", vo.getO_idx());

		return map;
	}

	@RequestMapping("/product/delete.do")
	public String delete(int p_idx) {

		// 삭제할 화일명을 얻기위해 p_idx에 해당되는 PhotoVo정보얻어오기
		ProductVo vo = productDao.selectOne(p_idx);

		// 저장경로 구하기
		String web_path = "/upload/";
		String abs_path = application.getRealPath(web_path);

		// 삭제할 화일정보
		File f = new File(abs_path, vo.getP_name());
		f.delete();// 삭제

		int res = productDao.delete(p_idx);
		if (res == 0) {
		}

		return "redirect:list.do";
	}

	@RequestMapping("/product/modify_form.do")
	public String modify_form(int p_idx, Model model) {

		// 2.p_idx 에 해당되는 PhotoVo 1개 얻어오기
		ProductVo vo = productDao.selectOne(p_idx);

		// 3. <br> -> \n
		String p_content = vo.getP_content().replaceAll("<br>", "\n");
		vo.setP_content(p_content);

		// 4. request binding
		model.addAttribute("vo", vo);

		// model.addAttribute("p_idx", p_idx);

		return "product/product_modify_form";
	}

	@RequestMapping("/product/modify.do")
	public String modify(ProductVo vo) {

		String p_content = vo.getP_content().replaceAll("\n", "<br>");
		vo.setP_content(p_content);

		// 5.DB update
		int res = productDao.update(vo);
		if (res == 0) {
		}
		return "redirect:list.do";
	}

	@RequestMapping("/product/page.do")
	public String pagelist(ProductVo vo) {

		String p_content = vo.getP_content().replaceAll("\n", "<br>");
		vo.setP_content(p_content);

		return "redirect:list.do";
	}

	@RequestMapping(value = "/product/product_upload.do", produces = "application/json;charset=utf-8;")
	@ResponseBody
	public Map<String, Object> prouct_upload(int p_idx,
			@RequestParam MultipartFile product) throws IOException {

		// 1.저장경로구하기 : 웹경로->절대경로 구하기
		String web_path = "/upload/";
		String abs_path = request.getServletContext().getRealPath(web_path);

		// 6.p_idx에 해당되는 게시물정보 1건 얻어오기
		ProductVo vo = productDao.selectOne(p_idx);

		// 7.변경전(이전)화일을 삭제
		File del_f = new File(abs_path, vo.getP_image_l());
		del_f.delete();// 삭제

		String p_image_l = "no_file";

		if (product.isEmpty() == false) {// 업로드화일 존재하면
			// 임시화일이름
			p_image_l = product.getOriginalFilename();
			// 저장화일정보
			File f = new File(abs_path, p_image_l);

			if (f.exists()) {// 동일화일 존재하면

				long tm = System.currentTimeMillis();
				// 화일명 => 시간_화일명
				p_image_l = String.format("%d_%s", tm, p_image_l);
				f = new File(abs_path, p_image_l);
			}

			// 임시파일->f로 복사
			product.transferTo(f);
		}

		// 8.DB filename 수정
		vo.setP_image_l(p_image_l);
		int res = productDao.update_filename(vo);
		if (res == 0) {
		}

		// 결과전송
		// 전송데이터 포장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("p_image_l", p_image_l);

		return map;
	}

	@RequestMapping("/product/page_list.do")
	public String page_form(int p_idx, Model model) {

		// 2.p_idx 에 해당되는 PhotoVo 1개 얻어오기
		ProductVo vo = productDao.selectOne(p_idx);

		// 3. <br> -> \n
		String p_content = vo.getP_content().replaceAll("<br>", "\n");
		vo.setP_content(p_content);

		// 4. request binding
		model.addAttribute("vo", vo);

		// model.addAttribute("p_idx", p_idx);

		return "product/product_page_form";
	}

	@RequestMapping("/product/main_list.do")
	public String mainlist(@RequestParam(name = "category_idx", defaultValue = "0") int category_idx,
			Model model) {

		List<ProductVo> list = null;

		if (category_idx == 0) {
			list = productDao.selectList();
		} else {
			list = productDao.selectCategoryList(category_idx);
		}
		List<CategoryVo> category_list = categoryDao.selectList();

		// System.out.println(category_List.size());

		model.addAttribute("list", list);
		model.addAttribute("category_list", category_list);

		return "product/product_main_page";
	}

	@RequestMapping("/product/product_order.do")
	public String order_form() {

		return "product/product_order";
	}

}
