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

	public AdminVO adminLogin(String adminID, String adminPWD) {
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		map.put("adminID",adminID);
		map.put("adminPWD", adminPWD);
		
		return sqlSession.selectOne("admin.adminLogin",map);
	}

}
