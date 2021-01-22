package com.ccr.ccrecipes.vo;

import java.util.Date;

public class CCRQnA {
	
	private int qna_no;
	private int member_no;
	private String qna_title;
	private String qna_text;
	private int qna_views;
	private Date qna_date;
	
	public CCRQnA() {
		super();
	}

	public CCRQnA(int qna_no, int member_no, String qna_title, String qna_text, int qna_views, Date qna_date) {
		super();
		this.qna_no = qna_no;
		this.member_no = member_no;
		this.qna_title = qna_title;
		this.qna_text = qna_text;
		this.qna_views = qna_views;
		this.qna_date = qna_date;
	}

	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_text() {
		return qna_text;
	}

	public void setQna_text(String qna_text) {
		this.qna_text = qna_text;
	}

	public int getQna_views() {
		return qna_views;
	}

	public void setQna_views(int qna_views) {
		this.qna_views = qna_views;
	}

	public Date getQna_date() {
		return qna_date;
	}

	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}
	
	
	
	
}
