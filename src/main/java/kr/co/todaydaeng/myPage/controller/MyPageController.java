package kr.co.todaydaeng.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import kr.co.todaydaeng.member.model.vo.Member;
import kr.co.todaydaeng.myPage.model.service.MyPageService;
import kr.co.todaydaeng.myPage.model.vo.Dog;

@Controller
public class MyPageController {

	@Autowired
	private MyPageService mpService;

	/* 회원 정보 페이지 호출 */
	@RequestMapping(value = "/myPage/memberInfoPage.do", method = RequestMethod.GET)
	public String memberInfoPage(@SessionAttribute Member member) {

		if (member == null) {
			return "/resources/views/member/login.jsp";
		} else {
			return "myPage/memberInfoPage";
		}
	}

	/* 회원 정보 수정 전 PWD 확인 페이지 호출 */
	@RequestMapping(value = "/myPage/checkPwdPage.do", method = RequestMethod.GET)
	public String checkPwdPage() {

		return "myPage/checkPwdPage";
	}

	/* 회원 정보 수정 전 PWD 확인 로직 */
	@RequestMapping(value = "/myPage/checkPwd.do", method = RequestMethod.POST)
	public void checkPwd(@RequestParam String memberPwd, @SessionAttribute Member member, HttpServletResponse response)
			throws IOException {

		String memberId = member.getMemberId();

		System.out.println(memberPwd);

		HashMap<String, String> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("memberPwd", memberPwd);

		Member m = mpService.selectPwdCheck(map);

		if (m != null) {
			/* 세션 갱신 */
			member=m;
			response.getWriter().print(true);
		} else {
			response.getWriter().print(false);
		}

	}

	/* 회원정보 수정 페이지 호출 */
	@RequestMapping(value = "/myPage/updateMemberInfoPage.do", method = RequestMethod.GET)
	public String updateMemberInfoPage() {
		return "myPage/updateMemberInfoPage";

	}

	/* 회원 정보 수정 로직 */
	@RequestMapping(value = "/myPage/updateMemberInfo.do", method = RequestMethod.POST)
	public ModelAndView updateMemberInfo(Member m, @SessionAttribute Member member, @RequestParam String yy,
			@RequestParam String mm, @RequestParam String dd, ModelAndView mav) {

		String memberId = member.getMemberId();
		String birthdate = yy + mm + dd;

		m.setMemberId(memberId);
		m.setBirthdate(birthdate);

		System.out.println(m.getMemberId());
		System.out.println(m.getMemberNickname());
		System.out.println(m.getGender());
		System.out.println(m.getBirthdate());
		System.out.println(m.getEmail());
		System.out.println(m.getAddress());
		System.out.println(m.getDetailAddress());

		int result = mpService.updateMemberInfo(m);

		if (result > 0) {
			/* 세션 갱신 */
			member.setMemberNickname(m.getMemberNickname());
			member.setGender(m.getGender());
			member.setBirthdate(m.getBirthdate());
			member.setEmail(m.getEmail());
			member.setAddress(m.getAddress());
			member.setDetailAddress(m.getDetailAddress());

			mav.addObject("msg", "회원 정보 수정 성공");
			mav.addObject("location", "/myPage/memberInfoPage.do");
		} else {
			mav.addObject("msg", "회원 정보 수정 실패 - 지속적인 문제 발생시 관리자에게 문의해주세요.");
			mav.addObject("location", "/myPage/memberInfoPage.do");
		}
		mav.setViewName("common/msg_test");

		return mav;
	}

	/* 비밀 번호 변경 팝업 호출 */
	@RequestMapping(value = "/myPage/pwdChangePage.do", method = RequestMethod.GET)
	public String pwd_change_page() {
		return "myPage/pwdChangePage";
	}

	/* 비밀 번호 변경 로직 */
	@RequestMapping(value = "/myPage/updatePwdChange.do", method = RequestMethod.POST)
	public void updatePwdChange(@RequestParam String originalMemberPwd, @RequestParam String newMemberPwd,
			@SessionAttribute Member member, HttpServletResponse response) throws IOException {

		String memberId = member.getMemberId();

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberId", memberId);
		map.put("originalMemberPwd", originalMemberPwd);
		map.put("newMemberPwd", newMemberPwd);

		int result = mpService.updatePwdChange(map);

		if (result > 0) {
			/* 세션 비밀번호 갱신 */
			member.setMemberPwd(newMemberPwd);
			response.getWriter().print(true);
		} else {
			response.getWriter().print(false);
		}
	}
	
	/* 탈퇴 확인 페이지 호출 (PW 확인)*/
	@RequestMapping(value = "/myPage/withdrawCheckPage.do", method = RequestMethod.GET)
	public String withdrawCheckPage() {
		return "myPage/withdrawCheckPage";
	}
	
	/* 회원 탈퇴 로직 */
	@RequestMapping(value = "/myPage/withdrawCheck.do", method = RequestMethod.POST)
	public void withdrawCheck(@RequestParam String memberPwd, @SessionAttribute Member member,HttpServletRequest request , HttpServletResponse response) throws IOException {
		
		String memberId = member.getMemberId();

		System.out.println(memberPwd);

		HashMap<String, String> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("memberPwd", memberPwd);

		int result= mpService.withdrawCheck(map);

		if (result>0) {
			/* 세션 파기 */
			request.getSession().invalidate();
			
			response.getWriter().print(true);
		} else {
			response.getWriter().print(false);
		}
		
	}
	
	/* 반려견 정보 페이지 호출 */
	@RequestMapping(value = "/myPage/dogInfoPage.do", method = RequestMethod.GET)
	public ModelAndView dogInfoPage(@SessionAttribute Member member,ModelAndView mav) {
		
		int memberNo=member.getMemberNo();
		
		ArrayList<Dog> list = mpService.selectDogInfo(memberNo);
				
		mav.addObject("list", list);
		mav.setViewName("myPage/dogInfoPage");
		
		return mav;
	}

	
	
	
	
}
