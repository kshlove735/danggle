package kr.co.todaydaeng.admin.model.service;

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
	public String selectAdminIDCheck(String chkID) {
		return aDAO.selectAdminIDCheck(chkID);
		
	}

	@Override
	public int insertAdminAccount(AdminVO avo) {
		return aDAO.insertAdminAccount(avo);
	}
}
