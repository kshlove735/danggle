package kr.co.todaydaeng.member.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.todaydaeng.member.model.service.MemberService;
import kr.co.todaydaeng.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	
	@Autowired
	private ServletContext context;
	
	@RequestMapping(value = "/member/joinMember.do", method = RequestMethod.POST)
	public String joinMember(HttpServletRequest request) throws IOException {
		// 파일이 업로드되는 경로
		String uploadPath = "/WEB-INF/upload/memberProfile/";	
		String uploadFilePath = context.getRealPath(uploadPath);
		System.out.println("파일 경로 확인 : " + uploadFilePath);
		
		// 파일 사이즈 설정 (50MB)
		int uploadFileSizeLimit = 50 * 1024 * 1024;

		// 파일 이름 인코딩 설정
		String encType = "UTF-8";

		// MultipartRequest 객체 생성
		// 필요한 정보 : request, uploadFilePath, uploadFileSizeLimit, encType,
		// DefaultFileRenamePolicy
		MultipartRequest multi = new MultipartRequest(request, uploadFilePath, uploadFileSizeLimit, encType,
				new DefaultFileRenamePolicy());

		String memberId = multi.getParameter("memberId");
		String memberPwd = multi.getParameter("memberPwd");
		String email = multi.getParameter("email");
		String nickname = multi.getParameter("nickname");
		String gender = multi.getParameter("gender");
		String birthdate = multi.getParameter("birthdate");
		String address = multi.getParameter("address");
		String addressDetail = multi.getParameter("addressDetail");

		// 첨부한 파일 이름
		String originalFileName = multi.getFilesystemName("profileFile");

		// 폴더에 저장 및 파일 이름 변경 (아이디_파일명)
		File file = new File(uploadFilePath + "\\" + originalFileName);
		file.renameTo(new File(uploadFilePath + "\\" + memberId + "_" + originalFileName));

		// DB에 insert할 최종 경로 값
		File reNameFile = new File(uploadFilePath + "\\" + memberId + "\\" + originalFileName);
		String memberProfile = reNameFile.getPath();

		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberPwd(memberPwd);
		member.setEmail(email);
		member.setNickname(nickname);
		member.setGender(gender);
		member.setBirthdate(birthdate);
		member.setAddress(address);
		member.setAddressDetail(addressDetail);
		member.setMemberProfile(memberProfile);

		int result = mService.joinMember(member);
		if (result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			return "welcomeJoin";
		} else {
			return "joinFail";
		}
	}
	
	
	@RequestMapping(value = "/member/memberIdCheck.do")
	public void memberIdCheck(@RequestParam String memberId, HttpServletResponse response) throws IOException {
		int result = mService.memberIdCheck(memberId);
		if (result > 0)
			response.getWriter().print(true);
		else
			response.getWriter().print(false);
	}
	
	@RequestMapping(value = "/member/loginMember.do", method = RequestMethod.POST)
	public String loginMember(Member member, HttpServletRequest request, Model model) {
		Member m = mService.loginMember(member);
		if (m != null) {
			switch (m.getMemberStatus()) {
			case '0':
				HttpSession session = request.getSession();
				session.setAttribute("member", m);
				return "redirect:/";
			case '1':
				model.addAttribute("member", m);
				return "dormantMember";
			default:
				return "common/errorPage";
			}
		} else {
			model.addAttribute("msg", "아이디와 비밀번호를 재확인 해주세요.");
			model.addAttribute("location", "/resources/staticViews/member/login.jsp");
			return "common/msg";
		}
	}
}
