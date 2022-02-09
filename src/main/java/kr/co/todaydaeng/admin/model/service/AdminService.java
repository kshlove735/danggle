package kr.co.todaydaeng.admin.model.service;

import java.util.HashMap;

import kr.co.todaydaeng.admin.model.vo.AdminVO;

public interface AdminService {

	AdminVO selectAdminLogin(HashMap<String, String> map);

	String selectAdminIDCheck(String chkID);

	int insertAdminAccount(AdminVO avo);

}
