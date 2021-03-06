package com.bu.bumoim.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bu.bumoim.domain.Board;
import com.bu.bumoim.domain.Comment;
import com.bu.bumoim.domain.Gallery;
import com.bu.bumoim.service.CommentService;
import com.bu.bumoim.service.GalleryService;


@Controller
public class CommentController {
	
	@Autowired
	private CommentService commentService;

	private Logger logger = Logger.getLogger(getClass());
	
	
	@RequestMapping(value="/commentInsert.do")
	public String commentInsert(int num, Comment comment) {
		
	
		comment.setPhoto_number(num);
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>> photo_number: " + comment.getPhoto_number());
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>> comment_id: " + comment.getComment_id());
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>> content: " + comment.getComment_content());
		commentService.galCommentInsert(comment);
		
		return "redirect:galleryDetail.do?num=" + comment.getPhoto_number();
	}
	
	@RequestMapping(value="/commentDelete.do")
	public String commentDelete(int comment_number, int num) {
		
		commentService.galDeleteComment(comment_number);
		
		return "redirect:galleryDetail.do?num=" + num +"&comment_number" + comment_number;
	}
	
	@RequestMapping(value="/boardcommentInsert.do")
	public String boardcommentInsert(int groupList_number, int board_number, Comment comment, Board board) {
		
	
		comment.setBoard_number(board_number);
//		comment.setgroupList_number(groupList_number);
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>> groupList_number: " + comment.getgroupList_number());
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>> comment_id: " + comment.getComment_id());
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>> content: " + comment.getComment_content());
		commentService.boardCommentInsert(comment);
		
		return "redirect:boardDetail.do?groupList_number=" + groupList_number +"&board_number="+ board_number;
	}
	
	@RequestMapping(value="/boardcommentDelete.do")
	public String boardcommentDelete(Comment comment, int comment_number, int board_number, int groupList_number) {
		
		commentService.boardDeleteComment(comment_number);
		
		return "redirect:boardDetail.do?groupList_number=" + groupList_number +"&board_number="+ board_number + "&comment_number=" + comment_number;
	}

}
