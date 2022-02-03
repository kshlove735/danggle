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
	
	//회원가입 id 중복 확인
	public int memberIdCheck(String memberId) {
		return sqlSession.selectOne("member.selectId",memberId)!=null?1:0;
	}
}
