package kr.co.todaydaeng.myPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.todaydaeng.myPage.model.service.MyPageService;

@Controller
public class MyPageController {

	
	@Autowired
	private MyPageService mpService;
	
}
