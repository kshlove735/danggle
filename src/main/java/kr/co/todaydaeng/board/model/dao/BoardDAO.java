package kr.co.todaydaeng.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.todaydaeng.board.model.vo.Board;
import kr.co.todaydaeng.board.model.vo.BoardEx;
import kr.co.todaydaeng.board.model.vo.Notice;
import kr.co.todaydaeng.myPage.model.vo.Dog;

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

	public BoardEx view(int boardNo) throws Exception {
		 
		 return sqlSession.selectOne("board.view", boardNo);
		}

	public int insertPost(Map<String, Object> map) {

		return sqlSession.insert("board.insertPost",map);
		
	}
 
	public int update(BoardEx be) {

		return sqlSession.update("board.update", be);
	}
	
	public String getPageNavi(int naviContPerPage, int currentPage, int recordCountPerPage, int boardNo) {

		int recordTotalCount =totalCount(boardNo);
		
		int pageTotalCount=(int)Math.ceil(recordTotalCount/(double)recordCountPerPage);
		
		int startNavi=(((currentPage-1)/naviContPerPage)*naviContPerPage)+1;
		int endNavi=startNavi+(naviContPerPage-1);
		
		if(endNavi>pageTotalCount) {
			endNavi=pageTotalCount;
		}
		
		//pageNavi 모양 만들기
		StringBuffer sb = new StringBuffer();
		
		if(startNavi !=1) {
			sb.append("<a href='/board/community.do?currentPage="+(startNavi-1)+"'> < Prev </a>");
		}
		
		for(int i =startNavi; i<=endNavi;i++) {
			//현재 페이지이면 Bold로 표시
			if(i==currentPage) {
				sb.append("<a href='/board/community.do?currentPage="+i+"'><b style='font-size:1.2em;'>"+i+"</b></a> ");
			}else {
				sb.append("<a href='/board/community.do?currentPage="+i+"'>"+i+"</a> ");
			}
		}
		
		if(endNavi!=pageTotalCount) {
			sb.append("<a href='/board/community.do?currentPage="+(endNavi+1)+"'> Next > </a>");
		}
		
		return sb.toString();
	}
	
		private int totalCount(int boardNo) {
		
		return Integer.parseInt(sqlSession.selectOne("board.selectTotalCount", boardNo));
	}

		public int deleteBoardPost(int boardNo) {

			return sqlSession.update("board.deleteBoardPost", boardNo);
		}

//		public ArrayList<BoardEx> communityAllList(int currentPage, int recordCountPerPage, int boardNo) {
//			
//			int start=currentPage*recordCountPerPage-(recordCountPerPage-1);
//			int end= currentPage*recordCountPerPage;
//			
//			HashMap<String, Object>map = new HashMap<>();
//			map.put("boardNo", boardNo);
//			map.put("start", start);
//			map.put("end", end);
//			
//			return new ArrayList<BoardEx>(sqlSession.selectList("board.communityAllList", map));
//	}

		

}
