package com.ccr.ccrecipes.vo;

public class CCRFriendship {
	private int user_one_no;
	private int user_two_no;
	private int friendship_status;
	private int action_user_no;

	public CCRFriendship() {
		super();
	}

	public CCRFriendship(int user_one_no, int user_two_no, int friendship_status, int action_user_no) {
		super();
		this.user_one_no = user_one_no;
		this.user_two_no = user_two_no;
		this.friendship_status = friendship_status;
		this.action_user_no = action_user_no;
	}

	public int getUser_one_no() {
		return user_one_no;
	}

	public void setUser_one_no(int user_one_no) {
		this.user_one_no = user_one_no;
	}

	public int getUser_two_no() {
		return user_two_no;
	}

	public void setUser_two_no(int user_two_no) {
		this.user_two_no = user_two_no;
	}

	public int getFriendship_status() {
		return friendship_status;
	}

	public void setFriendship_status(int friendship_status) {
		this.friendship_status = friendship_status;
	}

	public int getAction_user_no() {
		return action_user_no;
	}

	public void setAction_user_no(int action_user_no) {
		this.action_user_no = action_user_no;
	}

}
