package com.ccr.ccrecipes.content.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ccr.ccrecipes.content.service.NoticeServiceImpl;
import com.ccr.ccrecipes.vo.CCRMember;
import com.ccr.ccrecipes.vo.CCRNotice;

@Controller
@RequestMapping("/content/*")
public class NoticeController {

	@Autowired
	private NoticeServiceImpl noticeService;

	// 페이지 이동
	@RequestMapping("main_page.do")
	public String mainPage() {

		System.out.println("메인 페이지 실행");

		return "/main_page";
	}

	@RequestMapping("qna_board.do")
	public String qngBoard() {
		System.out.println("Q&A 게시판 실행");

		return "content/qna_board";
	}

	
	//공지사항 이희원 
	// 공지사항페이지
	@RequestMapping("notice_page.do")
	public String noticePage(Model model,String search_word , @RequestParam(value="page_num",defaultValue = "1") int page_num) {

		ArrayList<HashMap<String, Object>> noticeResultList = noticeService.getNoticeList(search_word,page_num);
		int pageCount=noticeService.getPageCount();
		
		int currentPage=page_num;
		int beginPage=((currentPage-1)/5)*5 + 1;
		int endPage=((currentPage-1)/5 + 1)*(5);
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		model.addAttribute("noticeResultList", noticeResultList);
		model.addAttribute("currentPage" , currentPage);
		model.addAttribute("beginPage" , beginPage);
		model.addAttribute("endPage" , endPage);
		model.addAttribute("pageCount", pageCount);
		
		return "content/notice_page";

	}

	// 공지사항 작성 페이지
	@RequestMapping("write_notice_page.do")
	public String writeNoticePage() {

		return "content/write_notice_page";
	}

	// 공지사항 작성 프로세스
	@RequestMapping("write_notice_process.do")
	public String writeNoticeProcess(CCRNotice param, HttpSession session) {

		CCRMember sessionUser = (CCRMember) session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();
		param.setMember_no(member_no);

		noticeService.writeNotice(param);
		return "redirect:./notice_page.do";
	}

	// 공지사항보기
	@RequestMapping("read_notice_page.do")
	public String readNotice(int notice_no, Model model) {

		HashMap<String, Object> map = noticeService.getNotice(notice_no);
		model.addAttribute("noticeResult", map);

		return "content/read_notice_page";
	}

	// 공지사항 삭제
	@RequestMapping("delete_notice_process.do")
	public String deleteNoticeProcess(int notice_no) {
		
		noticeService.deleteNotice(notice_no);
		
		return"redirect:./notice_page.do";
	}
	
	// 공지사항 수정
	@RequestMapping("update_notice_page.do")
	public String updateNoticePage(Model model,int notice_no) {
		HashMap<String, Object> map= noticeService.getNotice(notice_no);
		model.addAttribute("noticeResult", map);
		
		
		return"content/update_notice_page";
	}
	
	// 공지사항 수정프로세스
	@RequestMapping("update_notice_process.do")
	public String updateNoticeProcess(CCRNotice vo) {
		
		noticeService.updateNotice(vo);
		
		return"redirect:./notice_page.do";
	}
	
	
	
	
	
	

}
