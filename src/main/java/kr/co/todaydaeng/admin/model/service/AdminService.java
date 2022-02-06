package kr.co.todaydaeng.admin.model.service;

import kr.co.todaydaeng.admin.model.vo.AdminVO;

public interface AdminService {

	AdminVO adminLogin(String adminID, String adminPWD);

}
