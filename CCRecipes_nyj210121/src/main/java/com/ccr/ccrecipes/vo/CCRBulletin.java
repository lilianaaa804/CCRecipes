package com.ccr.ccrecipes.vo;

import java.sql.Date;

public class CCRBulletin {

   private int bulletin_no;
   private int member_no;
   private String bulletin_title ;
   private String bulletin_content ;
   private int bulletin_readcount ;
   private Date bulletin_writedate;
public CCRBulletin() {
	super();
}
public CCRBulletin(int bulletin_no, int member_no, String bulletin_title, String bulletin_content,
		int bulletin_readcount, Date bulletin_writedate) {
	super();
	this.bulletin_no = bulletin_no;
	this.member_no = member_no;
	this.bulletin_title = bulletin_title;
	this.bulletin_content = bulletin_content;
	this.bulletin_readcount = bulletin_readcount;
	this.bulletin_writedate = bulletin_writedate;
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
public String getBulletin_title() {
	return bulletin_title;
}
public void setBulletin_title(String bulletin_title) {
	this.bulletin_title = bulletin_title;
}
public String getBulletin_content() {
	return bulletin_content;
}
public void setBulletin_content(String bulletin_content) {
	this.bulletin_content = bulletin_content;
}
public int getBulletin_readcount() {
	return bulletin_readcount;
}
public void setBulletin_readcount(int bulletin_readcount) {
	this.bulletin_readcount = bulletin_readcount;
}
public Date getBulletin_writedate() {
	return bulletin_writedate;
}
public void setBulletin_writedate(Date bulletin_writedate) {
	this.bulletin_writedate = bulletin_writedate;
}
   
   
}