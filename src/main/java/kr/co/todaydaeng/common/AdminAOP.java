package kr.co.todaydaeng.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class AdminAOP {
	
	@Autowired
	private SHA256Util encrypt;
	
	@Pointcut("execution(* kr.or.iei.admin.model.service.*serviceImpl.selectAdminLogin(..) )")
	public void adminLoginPointcut() {}
	
	@Before ("adminLoginPointcut()")			
	public void adminLoginEncrypt (JoinPoint jp) throws Exception {

		System.out.println(jp.getArgs()[0].toString() );
		System.out.println(jp.getArgs()[1].toString() );
		
		String adminID = (String) jp.getArgs()[0]; 
		String adminPWD = (String) jp.getArgs()[1];
		
		String EncryptPWD = encrypt.encryptionData(adminPWD, adminID);
		
		//String adminPWD = EncryptPWD;
		
	}

}
