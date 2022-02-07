package kr.co.todaydaeng.admin.model.service;

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
	public AdminVO adminLogin(String adminID, String adminPWD) {
		
		return aDAO.adminLogin(adminID, adminPWD);
	}
}
