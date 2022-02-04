package kr.co.todaydaeng.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.todaydaeng.member.model.dao.MemberDAO;
import kr.co.todaydaeng.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO mDAO;
	
	@Override
	public int joinMember(Member member) {
		return mDAO.joinMember(member);
	}
}
