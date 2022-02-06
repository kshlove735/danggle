package kr.co.todaydaeng.board.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.todaydaeng.board.model.vo.Board;
import kr.co.todaydaeng.board.model.vo.BoardEx;
import kr.co.todaydaeng.board.model.vo.Notice;

@Repository
public class BoardDAO {
	
	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	public ArrayList<BoardEx> communityList() {
		
		return new ArrayList<BoardEx>(sqlSession.selectList("board.communityListEx"));
	}
	
	public ArrayList<Notice> noticeList() {
		
		return new ArrayList<Notice>(sqlSession.selectList("board.noticeList"));
	}
	

}
