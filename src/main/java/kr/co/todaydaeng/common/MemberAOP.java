package kr.co.todaydaeng.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.todaydaeng.member.model.vo.Member;

@Aspect
@Component
public class MemberAOP {
	
	@Autowired
	private SHA256Util enc;
		
	@Pointcut("execution(kr.co.todaydaeng.member.model.vo.Member kr.co.todaydaeng.member.model.service.MemberServiceImpl.loginMember(..))")
	public void loginMemberPointCut() {
		
	}
	
	@Before("loginMemberPointCut()")
	public void loginMemberPwdEncryption(JoinPoint jp) throws Exception{
		Member m = (Member)jp.getArgs()[0];
		String userPwd = m.getMemberPwd();
		String userId = m.getMemberId();
		
		String encryptPwd = enc.encryptionData(userPwd, userId);
		System.out.println(encryptPwd);
		m.setMemberPwd(encryptPwd);
	}
	
	
	@Pointcut("execution(int kr.co.todaydaeng.member.model.service.MemberServiceImpl.joinMember(..))")
	public void joinMemberPointCut() {
	}
	
	@Before("joinMemberPointCut()")
	public void joinMemberPwdEncryption(JoinPoint jp) throws Exception{
		Member m = (Member)jp.getArgs()[0];
		String userPwd = m.getMemberPwd();
		String userId = m.getMemberId();
		
		String encryptPwd = enc.encryptionData(userPwd, userId);
		System.out.println(encryptPwd);
		m.setMemberPwd(encryptPwd);
	}
}
