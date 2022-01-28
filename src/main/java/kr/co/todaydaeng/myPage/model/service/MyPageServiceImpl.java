package kr.co.todaydaeng.myPage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.todaydaeng.myPage.model.dao.MyPageDAO;

@Service
public class MyPageServiceImpl implements MyPageService{

	
	@Autowired
	private MyPageDAO mpDAO;
}
