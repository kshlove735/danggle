package kr.co.todaydaeng.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.todaydaeng.member.model.service.MemberService;
import kr.co.todaydaeng.member.model.vo.EmailAuthHist;
import kr.co.todaydaeng.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	
	@Autowired
	private ServletContext context;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value = "/member/joinMember.do", method = RequestMethod.POST)
	public String joinMember(HttpServletRequest request) throws IOException {
		// 파일이 업로드되는 경로
		String uploadPath = "/resources/upload/memberProfile/";	
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

		// DB에 insert할 이름
		String memberProfile = memberId+"_"+originalFileName;

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
	
	
	@RequestMapping(value = "/findId/sendEmailCode.do", method = RequestMethod.POST)
	public void sendEmailCode(String email, HttpServletResponse response) throws IOException {
		Member m = mService.memberEmailCheck(email);
		if (m != null) {
			//난수 생성
			Random rd = new Random();
			String key = Integer.toString(rd.nextInt(888888) + 111111);
			
			//이메일 정보
			String setfrom = "admin@todaydaeng.co.kr";
			String tomail = email; //받는 사람 
			String title = "[오늘의 댕댕] 아이디찾기 인증번호를 알려드립니다."; 
			String content = "아이디 찾기를 위한 인증번호 입니다." + "[인증번호 : " + key + "]";
			
			//인증번호 정보 db에 저장
			EmailAuthHist emailAuthHist = new EmailAuthHist();
			emailAuthHist.setMemberNo(m.getMemberNo());
			emailAuthHist.setEmail(email);
			emailAuthHist.setRandomNo(key);
			mService.insertAuthNo(emailAuthHist);
			
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo(tomail); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content); // 메일 내용

				mailSender.send(message);
			} catch (Exception e) {
				System.out.println(e);
			}
			response.getWriter().print(true);
		} else {
			response.getWriter().print(false);
		}
	}
	
}
