package com.bu.bumoim.domain;

import java.sql.Date;

public class Board {
	//
	private int row_number;
	private int board_number;
	private String board_title;
	private String board_content;
	private String board_writer;
	private String board_photo;
	private Date board_date;
	private int board_count;
	private int groupList_number;

	
	public Board() {
	
	}
	
	public Board(String board_photo, String board_title, String board_content, Date board_date, String board_writer) {
		this.board_photo = board_photo;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_date = board_date;
		this.board_writer = board_writer;
	}
	public Board(String board_photo, String board_title, String board_content, Date board_date, String board_writer, int board_number) {
		this.board_photo = board_photo;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_date = board_date;
		this.board_writer = board_writer;
		this.board_number = board_number;
	}
	
	public int getboard_number() {
		return board_number;
	}
	public void setboard_number(int board_number) {
		this.board_number = board_number;
	}
	
	public String getboard_title() {
		return board_title;
	}
	
	public void setboard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getboard_content() {
		return board_content;
	}
	
	public void setboard_content(String board_content) {
		this.board_content = board_content;
	}
	
	public String getboard_writer() {
		return board_writer;
	}
	
	public void setboard_writer(String board_writer) {
		this.board_writer = board_writer;
	}
	
	public String getboard_photo() {
		return board_photo;
	}
	
	public void setboard_photo(String board_photo) {
		this.board_photo = board_photo;
	}
	
	public Date getboard_date() {
		return board_date;
	}
	
	public void setboard_date(Date board_date) {
		this.board_date = board_date;
	}
	
	public int getgroupList_number() {
		return groupList_number;
	}
	
	public void setgroupList_number(int groupList_number) {
		this.groupList_number = groupList_number;
	}

	public int getboard_count() {
		return board_count;
	}

	public void setboard_count(int board_count) {
		this.board_count = board_count;
	}

	public int getRow_number() {
		return row_number;
	}

	public void setRow_number(int row_number) {
		this.row_number = row_number;
	}











}
