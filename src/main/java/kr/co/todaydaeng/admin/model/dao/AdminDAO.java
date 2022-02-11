package kr.co.todaydaeng.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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

	public String selectAdminEmailCheck(String chkMail) {
		return sqlSession.selectOne("admin.selectAdminEmailCheck",chkMail);
	}

	public int updateAdminPWD(HashMap<String, String> mapPwd) {
		return sqlSession.update("admin.updateAdminPWD",mapPwd);
	}

	public AdminVO selectAdminAccount(String adminID) {
		return sqlSession.selectOne("admin.selectAdminAccount",adminID);
	}

	public int updateAdminAccount(AdminVO avo) {
		return sqlSession.update("admin.updateAdminAccount", avo);
	}

	public ArrayList<AdminVO> selectAdminList() {
		
		//arrayList로 바로 casting이 되질 않아서 List객체에 저장했다가 형변환해서 리턴
		List<AdminVO> adm = new ArrayList<AdminVO>();		
		adm = sqlSession.selectList("admin.selectAdminList");
		
		return (ArrayList<AdminVO>) adm;	
		
	}

	public int selectAdminNew() {
		return sqlSession.selectOne("admin.selectAdminNew");
	}

}
