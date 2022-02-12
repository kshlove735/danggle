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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ckfinder.connector.plugins.ImageResize;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.todaydaeng.board.model.service.BoardService;
import kr.co.todaydaeng.board.model.vo.Board;
import kr.co.todaydaeng.board.model.vo.BoardEx;
import kr.co.todaydaeng.board.model.vo.Notice;
import kr.co.todaydaeng.member.model.service.MemberService;
import kr.co.todaydaeng.member.model.vo.Member;
import kr.co.todaydaeng.myPage.model.service.MyPageService;
import kr.co.todaydaeng.myPage.model.vo.Dog;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@Autowired
	private MyPageService mpService;
	
	@Autowired
	private ServletContext context;
	
    //커뮤니티 게시판 목록
	@RequestMapping(value="/board/community.do",method=RequestMethod.GET)
	public ModelAndView community(ModelAndView mav,
									@RequestParam(defaultValue="MemberId") String searchOption, 
						            @RequestParam(defaultValue="") String keyword 	
									)throws Exception
	{	
//		int currentPage;
//
//		if (request.getParameter("currentPage") == null) {
//			currentPage = 1;
//		} else {
//			currentPage = Integer.parseInt(request.getParameter("currentPage"));
//		}
//
//		int boardNo = board.getMemberNo();
//		
//		HashMap<String, Object> map = bService.communityPaging(currentPage, boardNo);
//		mav.addObject("map", map);
//		mav.addObject("currentPage", currentPage);
		
		//memberId 있는 board
		ArrayList<BoardEx> boardList = bService.communityList(searchOption,keyword);
		ArrayList<Notice> noticeList = bService.noticeList(searchOption,keyword);
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
	
	//게시글 이미지 업로드
	@RequestMapping(value="/board/communityFile.do",method=RequestMethod.POST)
	public void communityFile(HttpServletRequest request,HttpServletResponse response,
			 			   @SessionAttribute Member member,
						   ModelAndView mav
			               ) throws Exception
	{	
		
		    String uploadPath="/resources/upload/board";
		    String uploadFilePath=context.getRealPath(uploadPath);
			System.out.println("파일 경로 : " + uploadFilePath);
			
			// 파일 사이즈 설정(50MB)
			int uploadFileSizeLimit=50*1024*1024;
			
			// 파일 이름 인코딩 설정
			String encType="UTF-8";
			
			// MultipartRequest 객체 생성
			MultipartRequest multi = new MultipartRequest(request, uploadFilePath + "/temp", uploadFileSizeLimit, encType, new DefaultFileRenamePolicy());
			
			//파일 이름
			String originalFileName = multi.getFilesystemName("upload");
			
			//시간값
			long currentTime = Calendar.getInstance().getTimeInMillis();
			
			//폴더에 저장될 파일 이름 지정
			String memberId = member.getMemberId();
			
			File file= new File(uploadFilePath+"\\temp\\"+originalFileName);
			
			String ext = originalFileName.substring(originalFileName.lastIndexOf('.') + 1); //파일 확장자
			File file2 = new File(uploadFilePath+"\\"+memberId+"_"+currentTime +"."+ ext);
			file.renameTo(file2);
			
			JsonObject json = new JsonObject();
			json.addProperty("url", "/resources/upload/board/" + file2.getName());
			json.addProperty("uploaded", 1);
			json.addProperty("fileName", originalFileName);
			new Gson().toJson(json, response.getWriter());

            
	}
	
	//게시글 작성
	@RequestMapping(value="/board/insertPost.do",method=RequestMethod.POST)
	public ModelAndView insertPost(HttpServletRequest request,
			               HttpSession session,
			               @RequestParam("subject") String subject,
						   @RequestParam("content") String content,
						   ModelAndView mav
			               ) throws Exception
	{
		System.out.println(subject);
		System.out.println(content);
	      Map<String,Object> map = new HashMap<String,Object>();   
	      
	     Member member = (Member)session.getAttribute("member");
	      if(member==null)
	      {
	    	  
	      }

	      map.put("memberNo", member.getMemberNo());
	      map.put("subject", subject);
	      map.put("content", content);
	     
	      mav.setViewName("board/community");
	      
	      bService.insertPost(map);
          return mav;	
	}
	
	//게시글 수정 전 PWD 확인 패이지 호출
	@RequestMapping(value = "/board/updateCheckPage.do", method = RequestMethod.GET)
	public ModelAndView checkPwdPage(HttpSession session, HttpServletResponse response, ModelAndView mav,  @RequestParam("boardNo") int boardNo) throws IOException
	{
		mav.setViewName("board/updateCheckPage");
		mav.addObject("boardNo", boardNo);
		return mav;
	}
	
	//게시글 수정시 비밀번호 확인
	@RequestMapping(value="/board/updateCheck.do",method=RequestMethod.POST)
	public void updateCheckPage(@RequestParam String memberPwd, @SessionAttribute Member member, ModelAndView mav, HttpServletResponse response)
			throws IOException {

		String memberId = member.getMemberId();

		System.out.println(memberPwd);

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberId", memberId);
		map.put("memberPwd", memberPwd);

		Member m = mpService.selectPwdCheck(map);

		if (m != null) {
			/* 세션 갱신 */
			member = m;
			response.getWriter().print(true);
		} else {
			response.getWriter().print(false);
		}
		
	}
	
	//게시글 수정 페이지 호출
	@RequestMapping(value="/board/updatePage.do",method=RequestMethod.GET)
	public ModelAndView updatePage(ModelAndView mav,  @RequestParam("boardNo") int boardNo, Model model) 
			throws Exception
	{	
		
		// 기존데이터 추가
		BoardEx be = bService.view(boardNo);
		model.addAttribute("view",be); 
		
		mav.setViewName("board/update");
		mav.addObject("boardNo", boardNo);
		return mav;
	}
	
	//게시글 수정 
		@RequestMapping(value="/board/update.do",method=RequestMethod.GET)
		public String postUpdate(BoardEx be,@RequestParam("boardNo") int boardNo,
							     HttpServletRequest request,HttpServletResponse response,
							     ModelAndView mav,
						 	     @SessionAttribute Member member,
						 	     Model model
				) throws Exception {

			String uploadPath="/resources/upload/board";
		    String uploadFilePath=context.getRealPath(uploadPath);
			System.out.println("파일 경로 : " + uploadFilePath);
			
			// 파일 사이즈 설정(50MB)
			int uploadFileSizeLimit=50*1024*1024;
			
			// 파일 이름 인코딩 설정
			String encType="UTF-8";
			
			// MultipartRequest 객체 생성
			MultipartRequest multi = new MultipartRequest(request, uploadFilePath + "/temp", uploadFileSizeLimit, encType, new DefaultFileRenamePolicy());
			
			//파일 이름
			String originalFileName = multi.getFilesystemName("upload");
			
			//시간값
			long currentTime = Calendar.getInstance().getTimeInMillis();
			
			//폴더에 저장될 파일 이름 지정
			String memberId = member.getMemberId();
			
			File file= new File(uploadFilePath+"\\temp\\"+originalFileName);
			
			String ext = originalFileName.substring(originalFileName.lastIndexOf('.') + 1); //파일 확장자
			File file2 = new File(uploadFilePath+"\\"+memberId+"_"+currentTime +"."+ ext);
			file.renameTo(file2);
			
			JsonObject json = new JsonObject();
			json.addProperty("url", "/resources/upload/board/" + file2.getName());
			json.addProperty("uploaded", 1);
			json.addProperty("fileName", originalFileName);
			new Gson().toJson(json, response.getWriter());
			
			 model.addAttribute("boardNo", boardNo);
			 bService.update(be);
			 return "/board/selectContent.do?boardNo=" + be.getBoardNo();
			 
		}
		
    //게시글 삭제
	@RequestMapping(value = "/board/deleteBoardPost.do", method = RequestMethod.GET)
	public void deleteBoardPost(@RequestParam int boardNo, HttpServletResponse response) throws IOException {
		
		int result = bService.deleteBoardPost(boardNo);

		if (result > 0) {
			response.getWriter().print(true);
		} else {
			response.getWriter().print(false);
		}

	}
	
	@RequestMapping(value="/board/communitySearch.do",method=RequestMethod.GET)
	public void getCommunitySearch(Model model,@RequestParam("boardNo") int boardNo) throws Exception
	{
				
	}

	
	@RequestMapping(value="/hospital/hospitalInfo.do",method=RequestMethod.GET)
	public void hospital() {	
	}
}





