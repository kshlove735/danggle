package kr.co.todaydaeng.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.todaydaeng.model.service.MemberService;
import kr.co.todaydaeng.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	
	@RequestMapping(value = "/member/loginMember.do", method = RequestMethod.POST)
	public String loginMember(Member member, HttpServletRequest request, Model model) {
		Member m = mService.loginMember(member);
		if (m != null) {
			switch (m.getMemberStatus()) {
			case 0:
				HttpSession session = request.getSession();
				System.out.println(member);
				System.out.println(m);
				session.setAttribute("member", m);
				return "main";
			case 1:
				model.addAttribute("member", m);
				return "dormantMember";
			default:
				return "common/errorPage";
			}
		} else {
			model.addAttribute("msg", "아이디와 비밀번호를 재확인 해주세요.");
			model.addAttribute("location", "/member/loginMember.do");
			return "common/msg";
		}
	}
	
}
