package kr.co.todaydaeng.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.todaydaeng.admin.model.vo.AdminVO;
import kr.co.todaydaeng.member.model.vo.Member;

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

	public int updateAdminGrade(HashMap<String, Object> map) {
		return sqlSession.update("admin.updateAdminGrade", map);
	}

	public ArrayList<AdminVO> selectAdminSearch(HashMap<String, String> findMap) {
		List<AdminVO> adm = new ArrayList<AdminVO>();
		adm = sqlSession.selectList("admin.selectAdminSearch", findMap);
		return (ArrayList<AdminVO>) adm;
	}


	public ArrayList<Member> selectAdminList(HashMap<String, Integer> pageNum) {
		
		
		List<Member> mvo = new ArrayList<Member>();
		mvo = sqlSession.selectList("admin.selectMemberList", pageNum);
		return (ArrayList<Member>) mvo;
	}

	public int selectMemberCount() {
		return sqlSession.selectOne("admin.selectMemberCount");
	}

}
