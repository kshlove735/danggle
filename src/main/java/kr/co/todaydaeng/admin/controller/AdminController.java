package kr.co.todaydaeng.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.todaydaeng.admin.model.service.AdminService;

@Controller
public class AdminController {

	@RequestMapping(value="/admin/adminIndex.do")
		public String adminIndex (HttpSession session) {
		//기존 댕댕에서의 세션을 초기화
		session.invalidate();
		
		//관리자 로그인 페이지로 리다이렉트		
		return "adminView/adminLogin";
		}
	
	
}
