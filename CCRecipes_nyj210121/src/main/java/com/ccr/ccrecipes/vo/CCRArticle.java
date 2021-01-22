package com.ccr.ccrecipes.vo;

import java.util.Date;

public class CCRArticle {
	
	private int article_no;
	private int member_no;
	private String article_title;
	private String article_text;
	private int article_views;
	private Date article_date;
	public CCRArticle() {
		super();
	}
	public CCRArticle(int article_no, int member_no, String article_title, String article_text, int article_views,
			Date article_date) {
		super();
		this.article_no = article_no;
		this.member_no = member_no;
		this.article_title = article_title;
		this.article_text = article_text;
		this.article_views = article_views;
		this.article_date = article_date;
	}
	public int getArticle_no() {
		return article_no;
	}
	public void setArticle_no(int article_no) {
		this.article_no = article_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getArticle_title() {
		return article_title;
	}
	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}
	public String getArticle_text() {
		return article_text;
	}
	public void setArticle_text(String article_text) {
		this.article_text = article_text;
	}
	public int getArticle_views() {
		return article_views;
	}
	public void setArticle_views(int article_views) {
		this.article_views = article_views;
	}
	public Date getArticle_date() {
		return article_date;
	}
	public void setArticle_date(Date article_date) {
		this.article_date = article_date;
	}
	
}
