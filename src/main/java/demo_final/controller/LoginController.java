package demo_final.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;

import demo_final.dao.MemberDao;
import demo_final.vo.MemberVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {

	@Autowired
	MemberDao memberDao;

	@Autowired
	HttpSession session;

	@Autowired
	HttpServletRequest request;

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/member/login_form.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {

		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		System.out.println("----------------------------------------------------------");
		System.out.println(naverAuthUrl);
		System.out.println("----------------------------------------------------------");

		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);

		// 네이버
		model.addAttribute("url", naverAuthUrl);

		return "member/member_login_form";
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state)
			throws IOException {

		System.out.println("여기는 callback");

		OAuth2AccessToken oauthToken;

		oauthToken = naverLoginBO.getAccessToken(session, code, state);

		// Access Token세션에 저장
		String access_token = oauthToken.getAccessToken(); // 토큰
		String str_result = access_token.replaceAll("\\\"", "");
		session.setAttribute("access_token", str_result);

		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터

		/**
		 * apiResult json 구조
		 * {"resultcode":"00",
		 * "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/

		// 2. String형식인 apiResult를 json형태로 바꿈
		// JSONParser parser = new JSONParser();
		// Object obj = parser.parse(apiResult);

		// JSONObject jsonObj = (JSONObject) obj;

		// System.out.println(jsonObj);
		// // 3. 데이터 파싱
		// // Top레벨 단계 _response 파싱
		// JSONObject response_obj = (JSONObject) jsonObj.get("response");
		// // response의 nickname값 파싱
		// String nickname = (String) response_obj.get("nickname");

		// System.out.println(nickname);

		System.out.println(apiResult);

		JSONObject jsonObject = new JSONObject(apiResult);
		JSONObject responseJson = jsonObject.getJSONObject("response");

		String name = responseJson.getString("name");
		String email = responseJson.getString("email");
		String mobile = responseJson.getString("mobile");

		// System.out.println(name);
		// System.out.println(email);
		// System.out.println(mobile);

		return loginSuccess(email, name, mobile, model);

		// email과 동일한 유저 : Member검색 user

		// // 기존 회원 유저 로그인 값 불러오기
		// MemberVo user = (MemberVo) session.getAttribute("user");

		// System.out.println("user");

		// // 네이버 로그인시 기존 DB에 mem_n_email 없거나 다른 경우
		// if ((user == null) || (user.getMem_n_email() == null) ||
		// (user.getMem_n_email() != email)) {

		// return "redirect:../member/n_email_insert_form.do";

		// // 네이버 로그인시 기존 DB의 mem_n_email과 같은 경우
		// } else {

		// return "redirect:/loginSuccess.do";

		// }

	}

	public String loginSuccess(String mem_email, String mem_name, String mem_tel, Model model) {

		// mem_n_email = session.getAttribute("mem_n_email").toString();
		// mem_name = session.getAttribute("mem_name").toString();
		// mem_tel = session.getAttribute("mem_tel").toString();

		MemberVo user = memberDao.selectOneNaverEmail(mem_email);

		if (user == null) {

			model.addAttribute("mem_email", mem_email);
			model.addAttribute("mem_name", mem_name);
			model.addAttribute("mem_tel", mem_tel);

			return "member/member_naver_insert_form";

		}

		session.setAttribute("user", user);

		return "main/main";

	}

	// 로그아웃
	@RequestMapping(value = "/logout1", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout1(HttpSession session) throws IOException {
		System.out.println("여기는 logout");
		// session.invalidate();
		session.removeAttribute("user");

		return "redirect:/";
	}

	// -----------------------------------------------------------------------------------------------------------------------------------
	@GetMapping("/logout") // token = access_token임
	public String logout(Model model) {

		String token = (String) session.getAttribute("access_token");

		String apiUrl = "https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=" + naverLoginBO.getClientId()
				+ "&client_secret=" + naverLoginBO.getClientSecret() + "&access_token=" + token
				+ "&service_provider=NAVER";

		try {

			String res = requestToServer(apiUrl);

			session.removeAttribute("user");
			session.invalidate();

		} catch (IOException e) {

			e.printStackTrace();
		}

		return "redirect:/";
	}

	private String requestToServer(String apiURL) throws IOException {
		return requestToServer(apiURL, null);
	}

	private String requestToServer(String apiURL, String headerStr) throws IOException {
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		System.out.println("header Str: " + headerStr);
		if (headerStr != null && !headerStr.equals("")) {
			con.setRequestProperty("Authorization", headerStr);
		}
		int responseCode = con.getResponseCode();
		BufferedReader br;
		System.out.println("responseCode=" + responseCode);
		if (responseCode == 200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else { // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		StringBuffer res = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {
			res.append(inputLine);
		}
		br.close();
		if (responseCode == 200) {
			String new_res = res.toString().replaceAll("&#39;", "");
			return new_res;
		} else {
			return null;
		}
	}

}
