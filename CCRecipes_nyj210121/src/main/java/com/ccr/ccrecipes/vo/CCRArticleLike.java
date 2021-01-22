package com.ccr.ccrecipes.vo;

public class CCRArticleLike {
	private int article_no;
	private int member_no;
	public CCRArticleLike() {
		super();
	}
	public CCRArticleLike(int article_no, int member_no) {
		super();
		this.article_no = article_no;
		this.member_no = member_no;
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
	
	
}
