package kr.co.todaydaeng.admin.model.service;

import java.util.HashMap;

import kr.co.todaydaeng.admin.model.vo.AdminVO;

public interface AdminService {

	AdminVO selectAdminLogin(HashMap<String, String> map);

	String selectAdminEmailCheck(String chkMail);

	int updateAdminAccount(AdminVO avo);

	int updateAdminPWD(HashMap<String, String> mapPwd);



}
