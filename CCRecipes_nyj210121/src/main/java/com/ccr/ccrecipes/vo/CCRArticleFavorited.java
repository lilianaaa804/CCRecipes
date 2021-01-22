package com.ccr.ccrecipes.vo;

import java.util.Date;

public class CCRArticleFavorited {
	private int favorited_no;
	private int member_no;
	private int article_no;
	private Date favorited_date;
	public CCRArticleFavorited() {
		super();
	}
	public CCRArticleFavorited(int favorited_no, int member_no, int article_no, Date favorited_date) {
		super();
		this.favorited_no = favorited_no;
		this.member_no = member_no;
		this.article_no = article_no;
		this.favorited_date = favorited_date;
	}
	public int getFavorited_no() {
		return favorited_no;
	}
	public void setFavorited_no(int favorited_no) {
		this.favorited_no = favorited_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getArticle_no() {
		return article_no;
	}
	public void setArticle_no(int article_no) {
		this.article_no = article_no;
	}
	public Date getFavorited_date() {
		return favorited_date;
	}
	public void setFavorited_date(Date favorited_date) {
		this.favorited_date = favorited_date;
	}
	
	
}
