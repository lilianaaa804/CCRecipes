package com.ccr.ccrecipes.member.mapper;

import java.util.ArrayList;

import com.ccr.ccrecipes.vo.CCRFriendship;

public interface FriendSQLMapper {

	public ArrayList<CCRFriendship> selectAllFriends(int sessionUserno);

//	public ArrayList<Friendship> selectFriendsByName(int sessionUserno, String search_word);

	public ArrayList<CCRFriendship> getPendingRequests(int sessionUserno);

	public ArrayList<CCRFriendship> getFriendRequests(int sessionUserno);

	public ArrayList<CCRFriendship> getBlockedUsers(int sessionUserno);

	public Integer friendCheck(CCRFriendship dummy);

	public void sendFriendRequest(CCRFriendship dummy);

	public void cancelFriendRequest(CCRFriendship dummy);

	public void acceptFriendRequest(CCRFriendship dummy);

	public void deleteFriend(CCRFriendship dummy);

	public void blockFriend(CCRFriendship dummy);

	public void blockUser(CCRFriendship dummy);

	public void unblockUser(CCRFriendship dummy);

}
