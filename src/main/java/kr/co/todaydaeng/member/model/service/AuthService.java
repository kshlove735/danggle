package kr.co.todaydaeng.member.model.service;

import java.util.HashMap;

import kr.co.todaydaeng.member.model.vo.Member;

public interface AuthService {
	//액세스 토큰 요청
	public String getAccessToken(String authorize_code);
	
	//회원정보 요청
	public HashMap<String, Object> getUserInfo(String access_Token);
	
	//이미 존재하는 소셜 사용자인지 확인
	public Member selectSocialId(String socialId);

	//카카오 가입 (첫 사용자)
	public int kakaoJoin(Member member);
}
