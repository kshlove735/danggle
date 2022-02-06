package kr.co.todaydaeng.admin.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.todaydaeng.admin.model.service.AdminService;
import kr.co.todaydaeng.admin.model.vo.AdminVO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService aService;

	@RequestMapping(value="/admin/adminIndex.do", method = RequestMethod.GET)
		public String adminIndex (HttpSession session) {
		//기존 댕댕에서의 세션을 초기화
		session.invalidate();
		
		//관리자 로그인 페이지로 리다이렉트		
		return "adminView/adminLogin";
		}
	
	
	@RequestMapping(value="/admin/adminLogin.do", method = RequestMethod.POST)
	public void adminLogin(HttpSession session, HttpServletResponse response,
							@RequestParam String adminID, @RequestParam String adminPWD) throws IOException {
						
				//Request Param 인자의 유효성 검사 
				if (adminID == null || adminPWD == null) {
					response.getWriter().print(false);
					
				}else {		
				//form에서 온 request 정보로 관리자 필드와 일치하면 true 반환, ajax가 관리자 메인으로 리다이렉트
				AdminVO adm = aService.adminLogin(adminID, adminPWD);
				
				//return된 관리자 VO에서 임시조치된 관리자로 확인된 경우? → adminGrade 값이 C인 경우 처리??
				
				if (adm != null) {			
					session.setAttribute("AdminVO", adm);
					response.getWriter().print(true);				
				}else {
					// session 정보가 불일치 하면 false 반환, 로그인 페이지 그대로 유지
					response.getWriter().print(false);
				}	
		
			}
	}
	
	@RequestMapping(value="/admin/adminLogout.do", method = RequestMethod.GET)
	public String adminLogout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/admin/adminMain.do", method = RequestMethod.GET)
	public String adminMain() {
		return "adminView/adminMain";
	}
	
}
