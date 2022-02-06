package kr.co.todaydaeng.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.todaydaeng.member.model.dao.MemberDAO;
import kr.co.todaydaeng.member.model.vo.EmailAuthHist;
import kr.co.todaydaeng.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO mDAO;
	
	@Override
	public int joinMember(Member member) {
		return mDAO.joinMember(member);
	}
	
	@Override
	public int memberIdCheck(String memberId) {
		return mDAO.memberIdCheck(memberId);
	}
	
	@Override
	public Member loginMember(Member member) {
		return mDAO.loginMember(member);
	}
	
	@Override
	public Member memberEmailCheck(String email) {
		return mDAO.memberEmailCheck(email);
	}
	
	@Override
	public int insertAuthNo(EmailAuthHist emailAuthHist) {
		return mDAO.insertAuthNo(emailAuthHist);
	}
}
