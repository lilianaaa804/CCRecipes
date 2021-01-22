package com.ccr.ccrecipes.vo;

import java.util.Date;

public class CCRMember {

	private int member_no;
	private String member_email;
	private String member_pw;
	private String member_nickname;
	private int member_coin;
	private String member_pfp;
	private String member_bio;
	private int member_rank;
	private Date member_joindate;
	
	public CCRMember() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CCRMember(int member_no, String member_email, String member_pw, String member_nickname, int member_coin,
			String member_pfp, String member_bio, int member_rank, Date member_joindate) {
		super();
		this.member_no = member_no;
		this.member_email = member_email;
		this.member_pw = member_pw;
		this.member_nickname = member_nickname;
		this.member_coin = member_coin;
		this.member_pfp = member_pfp;
		this.member_bio = member_bio;
		this.member_rank = member_rank;
		this.member_joindate = member_joindate;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_nickname() {
		return member_nickname;
	}

	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}

	public int getMember_coin() {
		return member_coin;
	}

	public void setMember_coin(int member_coin) {
		this.member_coin = member_coin;
	}

	public String getMember_pfp() {
		return member_pfp;
	}

	public void setMember_pfp(String member_pfp) {
		this.member_pfp = member_pfp;
	}

	public String getMember_bio() {
		return member_bio;
	}

	public void setMember_bio(String member_bio) {
		this.member_bio = member_bio;
	}

	public int getMember_rank() {
		return member_rank;
	}

	public void setMember_rank(int member_rank) {
		this.member_rank = member_rank;
	}

	public Date getMember_joindate() {
		return member_joindate;
	}

	public void setMember_joindate(Date member_joindate) {
		this.member_joindate = member_joindate;
	}
	
	
	
	
	
	
}
