package kr.co.todaydaeng.myPage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

import kr.co.todaydaeng.member.model.vo.Member;
import kr.co.todaydaeng.myPage.model.service.MyPageService;
import kr.co.todaydaeng.myPage.model.vo.Dog;

@Repository
public class MyPageDAO {

	@Autowired
	@Qualifier(value = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	public Member selectPwdCheck(HashMap<String, String> map) {

		return sqlSession.selectOne("myPage.selectPwdCheck", map);

	}

	public int updateMemberInfo(Member m) {
		
		return sqlSession.update("myPage.updateMemberInfo", m);
	}

	public int updatePwdChange(HashMap<String, String> map) {
		
		return sqlSession.update("myPage.updatePwdChange", map);
	}

	public int withdrawCheck(HashMap<String, String> map) {
		return sqlSession.update("myPage.withdrawCheck", map);
	}

	public ArrayList<Dog> selectDogInfo(int memberNo) {
		return new ArrayList<Dog>(sqlSession.selectList("myPage.selectDogInfo",memberNo));
	}

}
