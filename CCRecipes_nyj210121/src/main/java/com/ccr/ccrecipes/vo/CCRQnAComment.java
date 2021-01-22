package com.ccr.ccrecipes.vo;

import java.sql.Date;

public class CCRQnAComment {
	
	private int qna_comment_no;
	private int qna_no;
	private int member_no;
	private String qna_comment_text;
	private Date qna_comment_date;
	
	public CCRQnAComment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CCRQnAComment(int qna_comment_no, int qna_no, int member_no, String qna_comment_text, Date qna_comment_date) {
		super();
		this.qna_comment_no = qna_comment_no;
		this.qna_no = qna_no;
		this.member_no = member_no;
		this.qna_comment_text = qna_comment_text;
		this.qna_comment_date = qna_comment_date;
	}

	public int getQna_comment_no() {
		return qna_comment_no;
	}

	public void setQna_comment_no(int qna_comment_no) {
		this.qna_comment_no = qna_comment_no;
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

	public String getQna_comment_text() {
		return qna_comment_text;
	}

	public void setQna_comment_text(String qna_comment_text) {
		this.qna_comment_text = qna_comment_text;
	}

	public Date getQna_comment_date() {
		return qna_comment_date;
	}

	public void setQna_comment_date(Date qna_comment_date) {
		this.qna_comment_date = qna_comment_date;
	}
	
	
	
}
