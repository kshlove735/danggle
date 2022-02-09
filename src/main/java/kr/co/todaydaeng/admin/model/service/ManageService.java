package kr.co.todaydaeng.admin.model.service;

import kr.co.todaydaeng.admin.model.vo.AdminVO;

public interface ManageService {

	String selectAdminIDCheck(String chkID);

	int insertAdminAccount(AdminVO avo);
}
