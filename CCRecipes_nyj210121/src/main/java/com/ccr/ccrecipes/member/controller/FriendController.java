package com.ccr.ccrecipes.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ccr.ccrecipes.member.service.FriendServiceImpl;
import com.ccr.ccrecipes.vo.CCRMember;

@Controller
//@RequestMapping("/member/")
public class FriendController {

	@Autowired
	private FriendServiceImpl friendService;
	
	
	@RequestMapping("friends.do")
	public String myFriends(HttpServletRequest request, HttpSession session, Model model) {

		String referer = request.getHeader("Referer");
//		String referer = "friends.do";
		System.out.println("[test]" + referer);
		model.addAttribute("referer", referer);
		
		
		CCRMember sessionUser = (CCRMember) session.getAttribute("sessionUser");

		ArrayList<CCRMember> friendslist = friendService.getFriendsList(sessionUser);
		
		ArrayList<CCRMember> pendingRequests = friendService.getPendingRequests(sessionUser);
		
		ArrayList<CCRMember> friendRequests = friendService.getFriendRequests(sessionUser);
		
		ArrayList<CCRMember> blockedUsers = friendService.getBlockedUsers(sessionUser);

		model.addAttribute("friendslist", friendslist);
		model.addAttribute("pendingRequests", pendingRequests);
		model.addAttribute("friendRequests", friendRequests);
		model.addAttribute("blockedUsers", blockedUsers);

		return "/myPage/friends";
	}
	
	@RequestMapping("sendFriendRequest.do")
	public String sendFriendRequest(HttpSession session, int member_no, String redirect_url) {
		
		CCRMember sessionUser = (CCRMember) session.getAttribute("sessionUser");
		
		friendService.sendFriendRequest(sessionUser, member_no);
		
		if(redirect_url != null && !redirect_url.equals("")) {
			return "redirect:" + redirect_url;
		}else {
			return "redirect:/";
		}
	}
	
	@RequestMapping("cancelFriendRequest.do")
	public String cancelFriendRequest(HttpSession session, int member_no, String redirect_url) {
		CCRMember sessionUser = (CCRMember) session.getAttribute("sessionUser");

		friendService.cancelFriendRequest(sessionUser, member_no);
		
		if(redirect_url != null && !redirect_url.equals("")) {
			return "redirect:" + redirect_url;
		}else {
			return "redirect:/";
		}
	}
	
	@RequestMapping("acceptFriendRequest.do")
	public String acceptFriendRequest(HttpSession session, int member_no, String redirect_url) {
		CCRMember sessionUser = (CCRMember) session.getAttribute("sessionUser");

		friendService.acceptFriendRequest(sessionUser, member_no);
		
		if(redirect_url != null && !redirect_url.equals("")) {
			return "redirect:" + redirect_url;
		}else {
			return "redirect:/";
		}
	}

	@RequestMapping("delcineFriendRequest.do")
	public String delcineFriendRequest(HttpSession session, int member_no, String redirect_url) {
		CCRMember sessionUser = (CCRMember) session.getAttribute("sessionUser");

		friendService.deleteFriend(sessionUser, member_no);
		
		if(redirect_url != null && !redirect_url.equals("")) {
			return "redirect:" + redirect_url;
		}else {
			return "redirect:/";
		}
	}

	@RequestMapping("blockFriendRequest.do")
	public String blockFriendRequest(HttpSession session, int member_no, String redirect_url) {
		CCRMember sessionUser = (CCRMember) session.getAttribute("sessionUser");

		friendService.blockFriend(sessionUser, member_no);
		
		if(redirect_url != null && !redirect_url.equals("")) {
			return "redirect:" + redirect_url;
		}else {
			return "redirect:/";
		}
	}

	@RequestMapping("deletefriend.do")
	public String deleteFriend(HttpSession session, int member_no, String redirect_url) {
		CCRMember sessionUser = (CCRMember) session.getAttribute("sessionUser");

		friendService.deleteFriend(sessionUser, member_no);
		
		if(redirect_url != null && !redirect_url.equals("")) {
			return "redirect:" + redirect_url;
		}else {
			return "redirect:/";
		}
	}

	@RequestMapping("blockfriend.do")
	public String blockFriend(HttpSession session, int member_no, String redirect_url) {
		CCRMember sessionUser = (CCRMember) session.getAttribute("sessionUser");

		friendService.blockFriend(sessionUser, member_no);
		
		if(redirect_url != null && !redirect_url.equals("")) {
			return "redirect:" + redirect_url;
		}else {
			return "redirect:/";
		}
	}

	@RequestMapping("blockUser.do")
	public String blockUser(HttpSession session, int member_no, String redirect_url) {
		CCRMember sessionUser = (CCRMember) session.getAttribute("sessionUser");
		
		friendService.blockUser(sessionUser, member_no);
		
		if(redirect_url != null && !redirect_url.equals("")) {
			return "redirect:" + redirect_url;
		}else {
			return "redirect:/";
		}
	}

	@RequestMapping("unblockUser.do")
	public String unblockUser(HttpSession session, int member_no, String redirect_url) {
		CCRMember sessionUser = (CCRMember) session.getAttribute("sessionUser");
		
		friendService.unblockUser(sessionUser, member_no);
		
		if(redirect_url != null && !redirect_url.equals("")) {
			return "redirect:" + redirect_url;
		}else {
			return "redirect:/";
		}
	}
}
