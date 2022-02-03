package kr.co.todaydaeng.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.todaydaeng.member.model.vo.Member;

@Repository
public class MemberDAO {
	
	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	//회원가입
	public int joinMember(Member member) {
		return sqlSession.insert("member.insertMember",member);
	}
	
}
