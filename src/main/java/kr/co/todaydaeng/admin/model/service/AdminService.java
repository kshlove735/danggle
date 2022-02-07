package kr.co.todaydaeng.admin.model.service;

import kr.co.todaydaeng.admin.model.vo.AdminVO;

public interface AdminService {

	AdminVO selectAdminLogin(String adminID, String adminPWD);

}
