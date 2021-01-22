package com.ccr.ccrecipes.vo;

import java.util.Date;

public class CCRBulletinReple {

	private int reple_no;
	private int bulletin_no;
	private int member_no;
	private String reple_content;
	private Date reple_writedate;
	public CCRBulletinReple() {
		super();
	}
	public CCRBulletinReple(int reple_no, int bulletin_no, int member_no, String reple_content, Date reple_writedate) {
		super();
		this.reple_no = reple_no;
		this.bulletin_no = bulletin_no;
		this.member_no = member_no;
		this.reple_content = reple_content;
		this.reple_writedate = reple_writedate;
	}
	public int getReple_no() {
		return reple_no;
	}
	public void setReple_no(int reple_no) {
		this.reple_no = reple_no;
	}
	public int getBulletin_no() {
		return bulletin_no;
	}
	public void setBulletin_no(int bulletin_no) {
		this.bulletin_no = bulletin_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getReple_content() {
		return reple_content;
	}
	public void setReple_content(String reple_content) {
		this.reple_content = reple_content;
	}
	public Date getReple_writedate() {
		return reple_writedate;
	}
	public void setReple_writedate(Date reple_writedate) {
		this.reple_writedate = reple_writedate;
	}
	
	
}





