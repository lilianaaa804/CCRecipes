package com.ccr.ccrecipes.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ccr.ccrecipes.member.service.FriendServiceImpl;
import com.ccr.ccrecipes.member.service.MemberServiceImpl;
import com.ccr.ccrecipes.vo.CCRMember;


@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@Autowired
	private FriendServiceImpl friendService;
	
	// 페이지 실행
	
	@RequestMapping("login_page.do")
	public String loginPage() {
		
		System.out.println("로그인 페이지 실행");
		
		return "member/login_page";
	}
	
	
	@RequestMapping("join_page.do")
	public String joinPage() {
		
		System.out.println("회원가입 페이지 실행");
		
		return "member/join_page";
	}
	
	
	
	// 페이지 프로세스
	@RequestMapping("join_process.do")
	public String joinProcess(CCRMember credentials, String member_email_id, String member_email_server) {
		
		String memberEmail = member_email_id + "@"+ member_email_server;
		credentials.setMember_email(memberEmail);
		
		memberService.joinMember(credentials);
		System.out.println("회원가입 프로세스 .. ");
		
		return "member/join_complete";
	}
	

	
	
	@RequestMapping("login_process.do")
	public String loginProcess(CCRMember vo, HttpSession session) {
			//session이라는 저장공간을 불러옴 리퀘스트랑 세션이랑 저장하는 시간이 다름
		System.out.println("로그인 프로세스");
		CCRMember sessionUser = memberService.login(vo);
		
		if(sessionUser != null) {
			session.setAttribute("sessionUser",sessionUser);
			System.out.println("로그인 성공");
			return "redirect:../content/main_page.do";
		} else {
			System.out.println("로그인 실패");
			return "member/login_page";
		}
		
	}
	
	@RequestMapping("user.do")
	public String viewUser(HttpSession session, Model model, int member_no) {
		CCRMember sessionUser = (CCRMember) session.getAttribute("sessionUser");

		Integer friendStatus = friendService.friendCheck(sessionUser, member_no);
		System.out.println(friendStatus);

		if (friendStatus == null) {
			CCRMember viewingUser = memberService.viewUser(member_no);

			model.addAttribute("friendStatus", friendStatus);
			model.addAttribute("viewingUser", viewingUser);

			return "/myPage/user";
		} else {
			if (friendStatus != 3) {
				CCRMember viewingUser = memberService.viewUser(member_no);

				model.addAttribute("friendStatus", friendStatus);
				model.addAttribute("viewingUser", viewingUser);

				return "/myPage/user";
			} else {
				return "/myPage/error";
			}
		}

	}
	
	@RequestMapping("update_member_process.do")
	public String updateMember(CCRMember vo) {
		
		memberService.updateMember(vo);
	
		System.out.println("관리자 페이지에서 멤버 정보 업데이트");
		
		return "redirect:../manager/member/member_list.do";

	}
	
	
}
