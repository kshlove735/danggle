package kr.co.todaydaeng.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import kr.co.todaydaeng.board.model.vo.BoardEx;
import kr.co.todaydaeng.board.model.vo.Notice;

public interface BoardService {

	ArrayList<BoardEx> communityList(String searchOption, String keyword);
	
	ArrayList<Notice> noticeList(String searchOption, String keyword);

	public BoardEx view(int boardNo) throws Exception;

	int insertPost(Map<String, Object> map) throws Exception;

	int update(BoardEx be) throws Exception;

	int deleteBoardPost(int boardNo);

	//HashMap<String, Object> communityPaging(int currentPage, int boardNo);

}
