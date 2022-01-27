package kr.co.todaydaeng.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.todaydaeng.model.dao.MemberDAO;
import kr.co.todaydaeng.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO mDAO;
	
	@Override
	public Member loginMember(Member member) {
		return mDAO.loginMember(member);
	}
}
