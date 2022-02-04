package kr.co.todaydaeng.member.model.service;

import kr.co.todaydaeng.member.model.vo.Member;

public interface MemberService {
	//회원가입
	int joinMember(Member member);

	//id 중복 확인
	int memberIdCheck(String userId);
	
	//로그인
	Member loginMember(Member member);
}
