package kr.co.todaydaeng.board.model.service;

import java.util.ArrayList;

import kr.co.todaydaeng.board.model.vo.Board;
import kr.co.todaydaeng.board.model.vo.BoardEx;
import kr.co.todaydaeng.board.model.vo.Notice;

public interface BoardService {

	ArrayList<BoardEx> communityList();
	
	ArrayList<Notice> noticeList();

}
