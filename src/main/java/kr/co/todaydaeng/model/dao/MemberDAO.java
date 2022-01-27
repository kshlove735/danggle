package kr.co.todaydaeng.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.todaydaeng.model.vo.Member;

@Repository
public class MemberDAO {
	@Autowired
	@Qualifier(value = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	//로그인
	public Member loginMember(Member member) {
		return sqlSession.selectOne("member.loginMember",member);
	}
	

}
