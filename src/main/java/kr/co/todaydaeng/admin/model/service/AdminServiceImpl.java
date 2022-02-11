package kr.co.todaydaeng.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.todaydaeng.admin.model.dao.AdminDAO;
import kr.co.todaydaeng.admin.model.vo.AdminVO;
import kr.co.todaydaeng.member.model.dao.MemberDAO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO aDAO;

	@Override
	public AdminVO selectAdminLogin(HashMap<String, String> map) {		
		return aDAO.selectAdminLogin(map);
	}

	@Override
	public String selectAdminEmailCheck(String chkMail) {
		return aDAO.selectAdminEmailCheck(chkMail);
	}

	@Override
	public int updateAdminAccount(AdminVO avo) {
		return aDAO.updateAdminAccount(avo);
	}

	@Override
	public int updateAdminPWD(HashMap<String, String> mapPwd) {
		return aDAO.updateAdminPWD(mapPwd);
	}

	@Override
	public AdminVO selectAdminAccount(String adminID) {
		return aDAO.selectAdminAccount(adminID);
	}

	@Override
	public ArrayList<AdminVO> selectAdminList() {
		return aDAO.selectAdminList();
	}

	@Override
	public int selectAdminNew() {
		return aDAO.selectAdminNew();
	}


}
