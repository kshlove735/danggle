package kr.co.todaydaeng.board.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.todaydaeng.board.model.dao.BoardDAO;
import kr.co.todaydaeng.board.model.vo.Board;
import kr.co.todaydaeng.board.model.vo.BoardEx;
import kr.co.todaydaeng.board.model.vo.Notice;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDAO bDAO;
	
	@Override
	public ArrayList<BoardEx> communityList() {
		
		return bDAO.communityList();
	}

	@Override
	public ArrayList<Notice> noticeList() {

		return bDAO.noticeList();
		
	}

	@Override
	public BoardEx view(int boardNo) throws Exception {
		
		return bDAO.view(boardNo);
	}

	@Override
	public int insertPost(Map<String, Object> map) {

		return bDAO.insertPost(map);
		
	}

}
