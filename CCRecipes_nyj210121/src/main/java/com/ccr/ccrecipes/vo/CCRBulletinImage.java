package com.ccr.ccrecipes.vo;


public class CCRBulletinImage {
	private int image_no;
	private int bulletin_no;
	private String image_link;
	public CCRBulletinImage() {
		super();
	}
	public CCRBulletinImage(int image_no, int bulletin_no, String image_link) {
		super();
		this.image_no = image_no;
		this.bulletin_no = bulletin_no;
		this.image_link = image_link;
	}
	public int getImage_no() {
		return image_no;
	}
	public void setImage_no(int image_no) {
		this.image_no = image_no;
	}
	public int getBulletin_no() {
		return bulletin_no;
	}
	public void setBulletin_no(int bulletin_no) {
		this.bulletin_no = bulletin_no;
	}
	public String getImage_link() {
		return image_link;
	}
	public void setImage_link(String image_link) {
		this.image_link = image_link;
	}
	
}

