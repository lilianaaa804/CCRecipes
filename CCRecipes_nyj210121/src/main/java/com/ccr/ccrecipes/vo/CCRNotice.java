package com.ccr.ccrecipes.vo;

import java.util.Date;

public class CCRNotice {

	private int notice_no;
	private int member_no;
	private String notice_title;
	private String notice_text;
	private String notice_readcount;
	private Date notice_date;
	public CCRNotice() {
		super();
	}
	public CCRNotice(int notice_no, int member_no, String notice_title, String notice_text, String notice_readcount,
			Date notice_date) {
		super();
		this.notice_no = notice_no;
		this.member_no = member_no;
		this.notice_title = notice_title;
		this.notice_text = notice_text;
		this.notice_readcount = notice_readcount;
		this.notice_date = notice_date;
	}
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_text() {
		return notice_text;
	}
	public void setNotice_text(String notice_text) {
		this.notice_text = notice_text;
	}
	public String getNotice_readcount() {
		return notice_readcount;
	}
	public void setNotice_readcount(String notice_readcount) {
		this.notice_readcount = notice_readcount;
	}
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	
	
}
