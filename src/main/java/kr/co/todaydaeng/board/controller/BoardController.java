package kr.co.todaydaeng.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.todaydaeng.board.model.service.BoardService;
import kr.co.todaydaeng.board.model.vo.Board;
import kr.co.todaydaeng.board.model.vo.BoardEx;
import kr.co.todaydaeng.board.model.vo.Notice;
import kr.co.todaydaeng.member.model.vo.Member;
import kr.co.todaydaeng.myPage.model.vo.Dog;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@Autowired
	private ServletContext context;
	
    //커뮤니티 게시판 목록
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
	
	//게시글 보기
	@RequestMapping(value="/board/selectContent.do",method=RequestMethod.GET)
	public void getView(@RequestParam("boardNo") int boardNo,Model model) throws Exception
	{
		BoardEx be = bService.view(boardNo);
		model.addAttribute("view",be);
	}
	
	//게시글 작성 폼 접근(로그인시 가능)
	@RequestMapping(value="/board/post.do",method=RequestMethod.GET)
	public String post(HttpSession session, HttpServletResponse response) throws Exception{
        
        Member memberId = (Member)session.getAttribute("member");
        session.setAttribute("memberId", memberId);
        //로그인 확인
        if (memberId == null) {
            
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter write = response.getWriter();
            write.println("<script>alert('게시글 작성은 로그인한 회원만 가능합니다.');</script>");
            write.flush();
            
            return "index";
            
        } else {
            //로그인이 되어있다면
            return "board/write";
        }
        
    }
	
	@RequestMapping(value="/board/communityFile.do",method=RequestMethod.POST)
	public void insertPost(HttpServletRequest request,
			 			   @SessionAttribute Member member,
						   ModelAndView mav
			               ) throws Exception
	{	
		
		    String uploadPath="/resources/boardUpload/communityImage/";
		    String uploadFilePath=context.getRealPath(uploadPath);
			System.out.println("파일 경로 : " + uploadFilePath);
			
			// 파일 사이즈 설정(50MB)
			int uploadFileSizeLimit=50*1024*1024;
			
			// 파일 이름 인코딩 설정
			String encType="UTF-8";
			
			// MultipartRequest 객체 생성
			MultipartRequest multi = new MultipartRequest(request, uploadFilePath, uploadFileSizeLimit, encType, new DefaultFileRenamePolicy());
			
			//파일 이름
			String originalFileName = multi.getFilesystemName("file");
			
			//시간값
			long currentTime = Calendar.getInstance().getTimeInMillis();
			
			//폴더에 저장될 파일 이름 지정
			String memberId = member.getMemberId();
			
			File file= new File(uploadFilePath+"\\"+originalFileName);
			file.renameTo(new File(uploadFilePath+"\\"+memberId+"_"+currentTime));
			String communityImage = memberId+"_"+originalFileName;
            
	}
	
	@RequestMapping(value="/board/insertPost.do",method=RequestMethod.POST)
	public ModelAndView insertPost(HttpServletRequest request,
			               @RequestParam("subject") String subject,
						   @RequestParam("content") String content,
						   ModelAndView mav
			               ) throws Exception
	{
		System.out.println(subject);
		System.out.println(content);
	      Map<String,Object> map = new HashMap<String,Object>();      
	      map.put("subject", subject);
	      map.put("content", content);
	     
	      mav.setViewName("board/community");
	      
	      bService.insertPost(map);
          return mav;	
	}
	
	@RequestMapping(value="/board/update.do",method=RequestMethod.POST)
	public void update() {	
		
	}
	
	@RequestMapping(value="/hospital/hospitalInfo.do",method=RequestMethod.GET)
	public void hospital() {	
	}
}





