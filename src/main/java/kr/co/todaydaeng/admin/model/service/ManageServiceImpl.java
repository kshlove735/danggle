package kr.co.todaydaeng.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.todaydaeng.admin.model.dao.AdminDAO;
import kr.co.todaydaeng.admin.model.vo.AdminVO;

@Service
public class ManageServiceImpl implements ManageService {

	@Autowired
	private AdminDAO aDAO;

	@Override
	public String selectAdminIDCheck(String chkID) {
		return aDAO.selectAdminIDCheck(chkID);
		
	}

	@Override
	public int insertAdminAccount(AdminVO avo) {
		return aDAO.insertAdminAccount(avo);
	}
	
	
}
