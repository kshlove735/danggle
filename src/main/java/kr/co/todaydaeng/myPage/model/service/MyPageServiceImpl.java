package kr.co.todaydaeng.myPage.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.todaydaeng.member.model.vo.Member;
import kr.co.todaydaeng.myPage.model.dao.MyPageDAO;
import kr.co.todaydaeng.myPage.model.vo.Dog;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageDAO mpDAO;

	@Override
	public Member selectPwdCheck(HashMap<String, String> map) {
		
		return mpDAO.selectPwdCheck(map);

	}

	@Override
	public int updateMemberInfo(Member m) {
		return mpDAO.updateMemberInfo(m);
	}

	@Override
	public int updatePwdChange(HashMap<String, String> map) {
		return mpDAO.updatePwdChange(map);
	}

	@Override
	public int withdrawCheck(HashMap<String, String> map) {
		return mpDAO.withdrawCheck(map);
	}

	@Override
	public ArrayList<Dog> selectDogInfo(int memberNo) {
		return mpDAO.selectDogInfo(memberNo);
	}
}
