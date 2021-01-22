package com.ccr.ccrecipes.member.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccr.ccrecipes.member.mapper.FriendSQLMapper;
import com.ccr.ccrecipes.member.mapper.MemberSQLMapper;
import com.ccr.ccrecipes.vo.CCRMember;
import com.ccr.ccrecipes.vo.CCRFriendship;

@Service
public class FriendServiceImpl {

	@Autowired
	private FriendSQLMapper friendSQLMapper;

	@Autowired
	private MemberSQLMapper memberSQLMapper;

	public ArrayList<CCRMember> getFriendsList(CCRMember sessionUser) {
		ArrayList<CCRMember> friendsList = new ArrayList<CCRMember>();

		ArrayList<CCRFriendship> friendshipVoList = new ArrayList<CCRFriendship>();

		int sessionUserno = sessionUser.getMember_no();
		System.out.println("sessionuserno : " + sessionUserno);

//		if (search_word == null) {
		friendshipVoList = friendSQLMapper.selectAllFriends(sessionUserno);
//		} else {
		// this query is wrong
//			friendshipVoList = friendSQLMapper.selectFriendsByName(sessionUserno, search_word);
//		}

		System.out.println("selectAllFriends complete " + friendshipVoList.size());

		for (CCRFriendship vo : friendshipVoList) {
			int user_one_no = vo.getUser_one_no();

			System.out.println(user_one_no);

			int user_two_no = vo.getUser_two_no();

			System.out.println(user_two_no);

			if (user_one_no == sessionUserno) {
				CCRMember friend = memberSQLMapper.selectByNo(user_two_no);

				friendsList.add(friend);
			} else if (user_two_no == sessionUserno) {
				CCRMember friend = memberSQLMapper.selectByNo(user_one_no);

				System.out.println(friend.getMember_nickname());

				friendsList.add(friend);
			}

		}

		return friendsList;
	}

	public ArrayList<CCRMember> getPendingRequests(CCRMember sessionUser) {
		ArrayList<CCRMember> pendingRequests = new ArrayList<CCRMember>();

		int sessionUserno = sessionUser.getMember_no();

		ArrayList<CCRFriendship> friendshipVoList = friendSQLMapper.getPendingRequests(sessionUserno);

		for (CCRFriendship vo : friendshipVoList) {
			int user_one_no = vo.getUser_one_no();
			int user_two_no = vo.getUser_two_no();

			if (user_one_no == sessionUserno) {
				CCRMember friend = memberSQLMapper.selectByNo(user_two_no);

				pendingRequests.add(friend);
			} else if (user_two_no == sessionUserno) {
				CCRMember friend = memberSQLMapper.selectByNo(user_one_no);

				pendingRequests.add(friend);
			}

		}

		return pendingRequests;
	}

	public ArrayList<CCRMember> getFriendRequests(CCRMember sessionUser) {
		System.out.println("getFriendRequests");

		ArrayList<CCRMember> friendRequests = new ArrayList<CCRMember>();

		int sessionUserno = sessionUser.getMember_no();

		ArrayList<CCRFriendship> friendshipVoList = friendSQLMapper.getFriendRequests(sessionUserno);

		for (CCRFriendship vo : friendshipVoList) {
			int user_one_no = vo.getUser_one_no();
			int user_two_no = vo.getUser_two_no();

			if (user_one_no == sessionUserno) {
				CCRMember friend = memberSQLMapper.selectByNo(user_two_no);

				friendRequests.add(friend);
			} else if (user_two_no == sessionUserno) {
				CCRMember friend = memberSQLMapper.selectByNo(user_one_no);

				friendRequests.add(friend);
			}

		}
		return friendRequests;
	}

	public ArrayList<CCRMember> getBlockedUsers(CCRMember sessionUser) {
		System.out.println("getBlockedUsers");

		ArrayList<CCRMember> blockedUsers = new ArrayList<CCRMember>();

		int sessionUserno = sessionUser.getMember_no();

		ArrayList<CCRFriendship> friendshipVoList = friendSQLMapper.getBlockedUsers(sessionUserno);

		for (CCRFriendship vo : friendshipVoList) {
			int user_one_no = vo.getUser_one_no();
			int user_two_no = vo.getUser_two_no();

			if (user_one_no == sessionUserno) {
				CCRMember blockedUser = memberSQLMapper.selectByNo(user_two_no);

				blockedUsers.add(blockedUser);
			} else if (user_two_no == sessionUserno) {
				CCRMember blockedUser = memberSQLMapper.selectByNo(user_one_no);

				blockedUsers.add(blockedUser);
			}

		}
		return blockedUsers;
	}

	public Integer friendCheck(CCRMember sessionUser, int member_no) {
		System.out.println("friendCheck");

		int sessionUserno = sessionUser.getMember_no();
		System.out.println("sessionUserno" + sessionUserno);
		System.out.println("member_no" + member_no);

		CCRFriendship dummy = new CCRFriendship();
		dummy.setUser_one_no(sessionUserno);
		dummy.setUser_two_no(member_no);

		// setdefault as 2 which would only be used when veiwing self profile
		Integer friendStatus = 2;
		System.out.println("friendStatus" + friendStatus);

		if (sessionUserno != member_no) {
			System.out.println("before sqlcheckfriend");
			friendStatus = friendSQLMapper.friendCheck(dummy);
			System.out.println("after sqlcheckfriend" + friendStatus);
		}
		return friendStatus;
	}

	public void sendFriendRequest(CCRMember sessionUser, int member_no) {
		System.out.println("sendFriendRequest");

		int sessionUserno = sessionUser.getMember_no();

		CCRFriendship dummy = new CCRFriendship();
		dummy.setUser_one_no(sessionUserno);
		dummy.setUser_two_no(member_no);

		friendSQLMapper.sendFriendRequest(dummy);
	}

	public void cancelFriendRequest(CCRMember sessionUser, int member_no) {
		System.out.println("cancelFriendRequest");

		int sessionUserno = sessionUser.getMember_no();

		CCRFriendship dummy = new CCRFriendship();
		dummy.setUser_one_no(sessionUserno);
		dummy.setUser_two_no(member_no);

		friendSQLMapper.cancelFriendRequest(dummy);
	}

	public void acceptFriendRequest(CCRMember sessionUser, int member_no) {
		System.out.println("acceptFriendRequest");

		int sessionUserno = sessionUser.getMember_no();

		CCRFriendship dummy = new CCRFriendship();
		dummy.setUser_one_no(sessionUserno);
		dummy.setUser_two_no(member_no);

		friendSQLMapper.acceptFriendRequest(dummy);
	}

	public void deleteFriend(CCRMember sessionUser, int member_no) {
		System.out.println("deleteFriend");

		int sessionUserno = sessionUser.getMember_no();

		CCRFriendship dummy = new CCRFriendship();
		dummy.setUser_one_no(sessionUserno);
		dummy.setUser_two_no(member_no);

		friendSQLMapper.deleteFriend(dummy);
	}

	public void blockFriend(CCRMember sessionUser, int member_no) {
		System.out.println("blockFriend");

		int sessionUserno = sessionUser.getMember_no();

		CCRFriendship dummy = new CCRFriendship();
		dummy.setUser_one_no(sessionUserno);
		dummy.setUser_two_no(member_no);

		friendSQLMapper.blockFriend(dummy);
	}

	public void blockUser(CCRMember sessionUser, int member_no) {
		System.out.println("blockUser");

		int sessionUserno = sessionUser.getMember_no();

		CCRFriendship dummy = new CCRFriendship();
		dummy.setUser_one_no(sessionUserno);
		dummy.setUser_two_no(member_no);

		friendSQLMapper.blockUser(dummy);
	}

	public void unblockUser(CCRMember sessionUser, int member_no) {
		System.out.println("unblockUser");

		int sessionUserno = sessionUser.getMember_no();

		CCRFriendship dummy = new CCRFriendship();
		dummy.setUser_one_no(sessionUserno);
		dummy.setUser_two_no(member_no);

		friendSQLMapper.unblockUser(dummy);
	}

}
