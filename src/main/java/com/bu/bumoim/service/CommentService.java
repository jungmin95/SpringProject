package com.bu.bumoim.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bu.bumoim.domain.Comment;



public interface CommentService {
 

    public void galCommentInsert(Comment comment);
	
	public List<Comment> galCommentList(int photo_number);
	
	public void galUpdateComment(Comment comment);
	
	public void galDeleteAllComment(int photo_number);
	
	public void galDeleteComment(int comment_number);
	
	public int getPhotoNumber(int comment_number);
	
	public void boardCommentInsert(Comment comment);
		
	public List<Comment> boardCommentList(int groupList_number);
	
	public void boardUpdateComment(Comment comment);
		
	public void boardDeleteAllComment(int groupList_number);
		
	public void boardDeleteComment(int comment_number);
	
//------------------------------------------------------
	public void groupCommentInsert(Comment comment);
	
	public List<Comment> groupCommentList(int groupList_number);
	
	public void groupUpdateComment(Comment comment);
		
	public void groupDeleteAllComment(int board_number);
		
	public void groupDeleteComment(int comment_number);
	
	
}

