package kr.co.todaydaeng.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.todaydaeng.admin.model.service.AdminService;
import kr.co.todaydaeng.admin.model.service.ManageService;
import kr.co.todaydaeng.admin.model.vo.AdminVO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService aService;
	
	@Autowired
	private ManageService mService;

	@RequestMapping(value="/admin/adminIndex.do", method = RequestMethod.GET)
		public String adminIndex (HttpSession session) {
		//기존 댕댕에서의 세션을 초기화
		session.invalidate();
		
		//관리자 로그인 페이지로 리다이렉트		
		return "adminView/adminLogin";
		}
	
	
	@RequestMapping(value="/admin/adminLogin.do", method = RequestMethod.POST)
	public void selectAdminLogin(HttpSession session, HttpServletResponse response,
							@RequestParam String adminID, @RequestParam String adminPWD) throws IOException {
						
				//Request Param 인자의 유효성 검사 
				if (adminID == null || adminPWD == null) {
					response.getWriter().print(false);
					
				}else {		
					
					HashMap<String, String> map = new HashMap<String, String>();
					
					map.put("adminID",adminID);
					map.put("adminPWD",adminPWD);
								
				AdminVO adm = aService.selectAdminLogin(map);
				
				if (adm != null) {			
					session.setAttribute("adminVO", adm);
					response.getWriter().print(true);				
				}else {
					// return되는 정보가 없으면 false 반환, 로그인 페이지 그대로 유지
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
	
	@RequestMapping(value="/admin/adminAccount.do")
	public String adminAccount() {
		return "adminView/adminAccount";		
	}
	
	@RequestMapping(value="/admin/adminIDCheck.do", method = RequestMethod.POST)
	public void selectAdminIDCheck(@RequestParam String chkID, HttpServletResponse response) throws IOException {		
		
		//ID중복 확인값의 유효성 검사
		if (chkID == null || chkID.length() > 15) {
			response.getWriter().print("invalid");
		}else {
			String result = mService.selectAdminIDCheck(chkID);						
			
			if (result == null) {
				response.getWriter().print("pass");
			}else {
				response.getWriter().print("false");
			}
		}
	}
	
	@RequestMapping(value="/admin/insertAdminAccount.do", method = RequestMethod.POST)
	public void insertAdminAccount(AdminVO avo, HttpServletResponse response) throws IOException {
		String id = avo.getAdminID();
		String pwd = avo.getAdminPWD();
		String name = avo.getAdminName();
		String email = avo.getAdminEmail();
		
		//유효성 검사
		if ( id == null || pwd == null || name == null || email == null || name.length() <2 || name.length() > 5 || email.length() > 31 || !(email.contains("@")) || pwd.length() > 21 ) {
			response.getWriter().print("invalid");
		}else {
			int result = mService.insertAdminAccount(avo);
			
			if (result >0) {
				response.getWriter().print("pass");
			}else {
				response.getWriter().print("false");
			}
		}		
	}
	
	@RequestMapping(value="/admin/adminInfo.do")
	public String adminInfo() {
		return "adminView/adminInfo";		
	}

	@RequestMapping(value="/admin/adminEmailCheck.do", method=RequestMethod.POST)
	public void selectAdminEmailCheck(@RequestParam String chkMail, HttpServletResponse response) throws IOException {
		
		//email중복 확인값의 유효성 검사
		if (chkMail == null || chkMail.length() > 30 ) {
			response.getWriter().print("invalid");
		}else {
			String result = aService.selectAdminEmailCheck(chkMail);						
			
			if (result == null) {
				response.getWriter().print("pass");
			}else {
				response.getWriter().print("false");
			}
		}
	}
	
	@RequestMapping(value="/admin/updatePWDChange.do", method=RequestMethod.POST)
	public void updateAdminPWD(@RequestParam String adminID, @RequestParam String oldPWD, 
								@RequestParam String newPWD, HttpServletResponse response)  throws IOException {
		
		// 로그인 메소드를 호출하여 사용자 검증 후에 암호 변경 로직을 수행한다
		HashMap<String, String> map = new HashMap<String, String>();		
		map.put("adminID",adminID);
		map.put("adminPWD",oldPWD);

		AdminVO adm = aService.selectAdminLogin(map);
	
		if (adm == null)  {
			response.getWriter().print("invalid");
			
		}else {
		//사용자 검증-로그인 메소드를 통과했다면 암호 변경 로직을 수행
		HashMap mapPwd = new HashMap<String, String>();		
		mapPwd.put("adminID", adminID);		
		mapPwd.put("newPWD", newPWD);		
			int result = aService.updateAdminPWD(mapPwd);						
			
			if (result >0) {
				response.getWriter().print("true");
			}else {
				response.getWriter().print("false");
			}
		}	
	}	
	
	@RequestMapping(value="/admin/updateAdminAccount.do", method=RequestMethod.POST)
	public void updateAdminAccount(AdminVO avo, HttpServletResponse response, HttpSession session) throws IOException {						
		String name = avo.getAdminName();
		String email = avo.getAdminEmail();
		String adminID = avo.getAdminID();
		
		//유효성 검사
		if ( name == null || email == null || name.length() <2 || name.length() > 5 || email.length() > 31 || !(email.contains("@")) ) {
			response.getWriter().print("invalid");
		}else {
			int result = aService.updateAdminAccount(avo);
			
			if (result >0) {
				
				//업데이트 끝나면 select query 실행해서 session을 갱신
				AdminVO refresh = aService.selectAdminAccount(adminID);
				session.setAttribute("adminVO",refresh);				
				response.getWriter().print("pass");
			}else {
				response.getWriter().print("false");
			}
		}		
	}
	
	@RequestMapping(value="/admin/adminManage.do")
	public ModelAndView adminManage(ModelAndView mav) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<AdminVO> list = aService.selectAdminList();
		map.put("admin", list);
		
		int newbie = aService.selectAdminNew();
		map.put("count", newbie);

		mav.addObject("map",map);		
		mav.setViewName("adminView/adminManage");
		
		return mav;		
	}
	
	@RequestMapping(value="/admin/adminGradeChange.do", method=RequestMethod.POST)
	public void updateAdminGrade() {
		//파라미터 유효성 검사, null 확인 후 false리턴
		// mService로 전달
		// int 0은 false 1은 pass
	}
		

}
