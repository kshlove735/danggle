package kr.co.todaydaeng.admin.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.todaydaeng.admin.model.vo.AdminVO;

@Repository
public class AdminDAO {
	
	//sqlSessionTemplate 임포트	
	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession; 

	public AdminVO selectAdminLogin(HashMap<String, String> map) {				
		return sqlSession.selectOne("admin.selectAdminLogin",map);
	}

	public String selectAdminIDCheck(String chkID) {
		return sqlSession.selectOne("admin.selectAdminIDCheck",chkID);
				
	}

	public int insertAdminAccount(AdminVO avo) {
		return sqlSession.insert("admin.insertAdminAccount",avo);
				
	}

}
