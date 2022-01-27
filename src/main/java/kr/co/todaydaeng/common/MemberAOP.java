package kr.co.todaydaeng.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.todaydaeng.model.vo.Member;

@Aspect
@Component
public class MemberAOP {
	@Autowired
	private SHA256Util enc;
	
	//로그인시 비밀번호 암호화
	@Pointcut("execution(kr.co.todaydaeng.model.vo.Member kr.co.todaydaeng.model.service.MemberServiceImpl.loginMember(..))")
	public void loginMemberPointCut() {
	}
	
	@Before("loginMemberPointCut()")
	public void loginMemberPwdEncryption(JoinPoint jp) throws Exception{
		Member m = (Member)jp.getArgs()[0];
		String memberPwd = m.getMemberPwd();
		String memberId = m.getMemberId();
		
		String encryptPwd = enc.encryptionData(memberPwd, memberId);
		System.out.println("로그인/비번확인시 암호화 : " + encryptPwd);
		m.setMemberPwd(encryptPwd);
	}
}
