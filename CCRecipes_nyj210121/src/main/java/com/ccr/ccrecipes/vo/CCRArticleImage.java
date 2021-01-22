package com.ccr.ccrecipes.vo;

public class CCRArticleImage {
	private int articleimg_no;
	private int article_no;
	private String articleimg_link;
	
	public CCRArticleImage() {
		super();
	}
	public CCRArticleImage(int articleimg_no, int article_no, String articleimg_link) {
		super();
		this.articleimg_no = articleimg_no;
		this.article_no = article_no;
		this.articleimg_link = articleimg_link;
	}
	public int getArticleimg_no() {
		return articleimg_no;
	}
	public void setArticleimg_no(int articleimg_no) {
		this.articleimg_no = articleimg_no;
	}
	public int getArticle_no() {
		return article_no;
	}
	public void setArticle_no(int article_no) {
		this.article_no = article_no;
	}
	public String getArticleimg_link() {
		return articleimg_link;
	}
	public void setArticleimg_link(String articleimg_link) {
		this.articleimg_link = articleimg_link;
	}
	
	
}
