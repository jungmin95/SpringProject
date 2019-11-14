package com.bu.bumoim.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bu.bumoim.domain.Board;
import com.bu.bumoim.domain.Comment;
import com.bu.bumoim.paging.Criteria;
import com.bu.bumoim.paging.PageMaker;
import com.bu.bumoim.service.BoardService;
import com.bu.bumoim.service.CommentService;

@Controller
public class BoardController<ActionForward> {

	private Logger logger = Logger.getLogger(getClass());
	@Autowired
	private BoardService boardservice;
	@Autowired
	private CommentService commentService;
	
	@Resource(name = "uploadPath")
	String uploadPath;
	private ModelAndView mav;
	
	@RequestMapping(value="/boardList.do")
	public ModelAndView list(Board board, @ModelAttribute("cri") Criteria cri, HttpServletRequest request) {
		
		List<Board> list = boardservice.selectBoardList(cri);
//		List<Board> lists = boardservice.selectgetCount(board_number);
		ModelAndView mav = new ModelAndView("board/List");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(100);
		
		
		mav.addObject("Board", list);
		mav.addObject("pageMaker", pageMaker);
		
		
		return mav;
	}
	
	/**Write*/
	@RequestMapping(value="/boardWrite.do", method=RequestMethod.GET)
    public String boardwrite_view(Model model, int groupList_number){
		model.addAttribute("groupList_number", groupList_number);
        return "board/Write";
    }
	
	@RequestMapping(value="/boardWrite.do", method=RequestMethod.POST)
	public String board_Write(Board board, HttpServletRequest req, Model model, int groupList_number) {
		
		board = fileUpload(req,board);
		board.setgroupList_number(groupList_number);
		logger.info("3333333333333333333333333333333333333333333333333");
		logger.info("그룹 넘버 =========" + groupList_number);
		logger.info("3333333333333333333333333333333333333333333333333");
		
		boardservice.insertBoard(board);
		model.addAttribute("groupList_number", groupList_number);
		return "redirect:/group/groupInfo.do?groupList_number=" + groupList_number + "#board";
	}
  
	
	@RequestMapping(value="/boardDetail.do", method=RequestMethod.GET) 
	public ModelAndView board_detail(int board_number, HttpSession session, HttpServletRequest request,HttpServletResponse response, Board board_detail ) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		List<Comment> comment = commentService.boardCommentList(board_number);
		logger.info("넘버: " + board_number);
		Board board = boardservice.detailBoard(board_number);
		logger.info("보드남바: " + board.getboard_number());
		
		mav.setViewName("board/Detail");
		mav.addObject("Board", board);
		mav.addObject("commentList",comment);
		
		return mav;
	}
    

	@RequestMapping(value ="/boardUpdate.do", method= RequestMethod.GET)
	public String board_update(HttpSession session, int board_number, Model model) throws Exception {
		

			model.addAttribute("Board", boardservice.detailBoard(board_number));
			
			return "board/Update";
	}
	
	@RequestMapping(value ="/boardModify.do", method= RequestMethod.POST)
	public String board_modify(Board board) throws Exception {
		
		
		boardservice.updateBoard(board);
		
		return "redirect:/boardDetail.do?board_number="+ board.getboard_number();
	}
	
	
	
	@RequestMapping(value="/boardDelete.do", method=RequestMethod.GET)
	public String board_delete(HttpSession session, int board_number) throws Exception {
		
		int deleteResult = boardservice.deleteBoard(board_number);
		
		if (deleteResult == -1) {
			logger.info("Insert~~~~~~~~~~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11~~~~~~");
		}else {
			logger.info("FAIL~~~~~~~~~~~~~~~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!~~~~~~~~~~");
		}
		
		return "redirect:/boardList.do";
	}
	
	public Board fileUpload(HttpServletRequest req, Board board) {
		try {
			MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req;
			Iterator iter = mhsr.getFileNames();
			MultipartFile uploadFile = null;

			// create directory
			File dir = new File(uploadPath);
			if (!dir.isDirectory()) {
				dir.mkdirs();
			}
			while (iter.hasNext()) {
				String fieldName = (String) iter.next(); // �궡�슜�쓣 媛��졇���꽌
				uploadFile = mhsr.getFile(fieldName);
				String origName;
				origName = new String(uploadFile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); // �븳湲�爰좎쭚 諛⑹�

				if ("".equals(origName)) {
					continue;
				}

				String ext = origName.substring(origName.lastIndexOf('.')); // �솗�옣�옄
				String saveFileName = getUuid() + ext;

				File serverFile = new File(uploadPath + File.separator + saveFileName);
				uploadFile.transferTo(serverFile);
				logger.info("path: " + uploadFile);
				logger.info("fileName: " + uploadFile.getOriginalFilename());

				board = new Board(saveFileName, board.getboard_title(), board.getboard_content(), board.getboard_date(), board.getboard_writer());
				
			
			}

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}

		return board;
		
	}
	
	private static String getUuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	@RequestMapping(value="/FileDownloadAction.do")
	public ActionForward execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        // 다운로드할 파일명을 가져온다.
        String fileName = request.getParameter("file_name");
 
        // 파일이 있는 절대경로를 가져온다.
        // 현재 업로드된 파일은 UploadFolder 폴더에 있다.
        String folder = request.getSession().getServletContext().getRealPath("upload");
        // 파일의 절대경로를 만든다.
        String filePath = folder + "/" + fileName;
 
        try {
            File file = new File(filePath);
            byte b[] = new byte[(int) file.length()];
            
            // page의 ContentType등을 동적으로 바꾸기 위해 초기화시킴
            response.reset();
            response.setContentType("application/octet-stream");
            
            // 한글 인코딩
            String encoding = new String(fileName.getBytes("euc-kr"),"8859_1");
            
            // 파일 링크를 클릭했을 때 다운로드 저장 화면이 출력되게 처리하는 부분
            response.setHeader("Content-Disposition", "attachment;filename="+ encoding);
            response.setHeader("Content-Length", String.valueOf(file.length()));
            
            if (file.isFile()) // 파일이 있을경우
            {
                FileInputStream fileInputStream = new FileInputStream(file);
                ServletOutputStream servletOutputStream = response.getOutputStream();
                
                //  파일을 읽어서 클라이언트쪽으로 저장한다.
                int readNum = 0;
                while ( (readNum = fileInputStream.read(b)) != -1) {
                    servletOutputStream.write(b, 0, readNum);
                }
                
                servletOutputStream.close();
                fileInputStream.close();
            }
            
        } catch (Exception e) {
            System.out.println("Download Exception : " + e.getMessage());
        }
 
        return null;
    }
	   
}
