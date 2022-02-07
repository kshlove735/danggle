package kr.co.todaydaeng.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.todaydaeng.board.model.service.BoardService;
import kr.co.todaydaeng.board.model.vo.Board;
import kr.co.todaydaeng.board.model.vo.BoardEx;
import kr.co.todaydaeng.board.model.vo.Notice;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	

	@RequestMapping(value="/board/community.do",method=RequestMethod.GET)
	public ModelAndView community(ModelAndView mav) 
	{	
		//memberId 있는 board
		ArrayList<BoardEx> boardList = bService.communityList();
		ArrayList<Notice> noticeList = bService.noticeList();
		mav.addObject("boardlist", boardList);
		mav.addObject("noticelist", noticeList);
		mav.setViewName("board/community");
		return mav;
	}
	
	@RequestMapping(value="/board/write.do",method=RequestMethod.POST)
	public void write() {	
	}
	
	@RequestMapping(value="/board/update.do",method=RequestMethod.POST)
	public void update() {	
	}
	
	@RequestMapping(value="/hospital/hospitalInfo.do",method=RequestMethod.GET)
	public void hospital() {	
	}
}
