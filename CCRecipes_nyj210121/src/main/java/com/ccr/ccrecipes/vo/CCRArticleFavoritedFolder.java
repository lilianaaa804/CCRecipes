package com.ccr.ccrecipes.vo;

public class CCRArticleFavoritedFolder {
	private int folder_no;
	private int member_no;
	private String folder_name;
	public CCRArticleFavoritedFolder() {
		super();
	}
	public CCRArticleFavoritedFolder(int folder_no, int member_no, String folder_name) {
		super();
		this.folder_no = folder_no;
		this.member_no = member_no;
		this.folder_name = folder_name;
	}
	public int getFolder_no() {
		return folder_no;
	}
	public void setFolder_no(int folder_no) {
		this.folder_no = folder_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getFolder_name() {
		return folder_name;
	}
	public void setFolder_name(String folder_name) {
		this.folder_name = folder_name;
	}
	
	
}
