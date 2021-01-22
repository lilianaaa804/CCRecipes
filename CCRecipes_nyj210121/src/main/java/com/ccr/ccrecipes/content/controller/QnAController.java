package com.ccr.ccrecipes.content.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ccr.ccrecipes.content.service.*;
import com.ccr.ccrecipes.vo.*;

@Controller
@RequestMapping("/qna/*")
public class QnAController {

	@Autowired
	private QnAServiceImpl qnaService;

	@RequestMapping("qna_board.do")
	public String qnaBoard(Model model) {

		ArrayList<HashMap<String, Object>> resultList = qnaService.getQnAList();

//		int pageCount = qnaService.getPageCount();
//		
//		int currentPage = page_num;
//		int beginPage = ((currentPage-1)/5)*5 + 1;
//		int endPage = ((currentPage-1)/5 + 1)*(5);		
//		
//		if(endPage > pageCount) {
//			endPage = pageCount;
//		}
//		

		model.addAttribute("resultList", resultList);
//		model.addAttribute("currentPage" , currentPage);
//		model.addAttribute("beginPage" , beginPage);
//		model.addAttribute("endPage" , endPage);
//		model.addAttribute("pageCount", pageCount);
//		model.addAttribute("resultList", resultList);

		System.out.println("Q&A 게시판 실행");

		return "qna/qna_board";
	}

	// Q&A 게시판 글쓰기
	@RequestMapping("qna_writing_page.do")
	public String qnaWritingPage() {

		System.out.println("Q&A 글쓰기 페이지 실행");
		return "qna/qna_writing_page";
	}

	// Q&A 게시판 글쓰기 프로세스

	@RequestMapping("qna_writing_process.do")
	public String qnaWritingProcess(HttpSession session, CCRQnA vo) {

		CCRMember ccrMember = (CCRMember) session.getAttribute("sessionUser");
		int member_no = ccrMember.getMember_no();

		vo.setMember_no(member_no);

		qnaService.writingProcess(vo);

		System.out.println("Q&A 글쓰기 등록");

		return "redirect:./qna_board.do";
	}

	// Q&A 게시글 클릭
	@RequestMapping("qna_read_page.do")
	public String qnaReadPage(Model model, int qna_no) {

		System.out.println("qna 게시물 no , qna_no = : " + qna_no);

		System.out.println("글보기 페이지");
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println("map = qnaService.getQnAContent(qna_no) 실행 중입니다.... ");
		map = qnaService.getQnAContent(qna_no);
		System.out.println("실행완료");
		model.addAttribute("resultList", map);
//		
//		//댓글 부분 출력
		// 댓글창 출력
		ArrayList<HashMap<String, Object>> commentList = new ArrayList<HashMap<String, Object>>();
		commentList = qnaService.getQnACommentList(qna_no);
		model.addAttribute("commentList", commentList);
//		System.out.println("Q&A 게시글 클릭");

		// comment 부분 출력 수정!!!! 나중에 Q&A에서 설정 ??
		/*
		 * ArrayList<HashMap<String, Object>> resultList =
		 * commentService.getCommentList(content_no);
		 * 
		 * model.addAttribute("resultList", resultList);
		 * 
		 */
		return "qna/qna_read_page";
	}

	// Q&A 게시물 삭제

	@RequestMapping("qna_delete_process.do")
	public String deleteProcess(int qna_no, HttpServletRequest request) {

		qnaService.deleteProcess(qna_no);

		System.out.println("Q&A 게시물 삭제");

		String referer = request.getHeader("referer");
		System.out.println(referer);
		String address = "http://localhost:8181/ccrecipes/manager/board/qna_list.do";
		if (referer.equals(address)) {
			return "redirect:../manager/board/qna_list.do";
		} else {
			return "redirect:./qna_board.do";
		}
	}

	// Q&A 게시물 수정

	@RequestMapping("qna_update_page.do")
	public String updatePage(Model model, int qna_no) {

		System.out.println("qna_no 값 ! : " + qna_no);
		// 두 줄을 넣어주지 않으면, jsp update page에서 기존의 게시글을 불러올 수 없다.
		HashMap<String, Object> map = qnaService.getQnAContent(qna_no);

		System.out.println(map);

		model.addAttribute("resultList", map);

		System.out.println("게시글 업데이트 페이지");
		return "qna/qna_update_page";
	}

	@RequestMapping("qna_update_process.do")
	public String updateProcess(CCRQnA vo) {

		qnaService.updateContent(vo);
		System.out.println("업데이트 프로세스..");
		return "redirect:./qna_board.do";
	}

	// 검색 기능
	@RequestMapping("qna_serach.do")
	public String qnaSearch(Model model, String search_word, String qna_search) {

		System.out.println("검색어 : " + search_word);
		ArrayList<HashMap<String, Object>> map = new ArrayList<HashMap<String, Object>>();
		map = qnaService.getSelectedQnAList(search_word, qna_search);
		model.addAttribute("resultList", map);

		System.out.println(qna_search + " : qna_search");

		System.out.println("검색 기능 실행");
		return "qna/qna_search_board";
	}

	@RequestMapping("qna_like_process.do")
	public String qnaLikeProcess(int qna_no, int member_no, CCRQnALike vo) {

		System.out.println("--------------------------------------");
		System.out.println("좋아오 클릭");
		System.out.println("컨트롤러 qna_no : " + qna_no);

		System.out.println("좋아요를 누른 사람의 member_no :" + member_no);
		System.out.println("--------------------------------------");
		qnaService.clickLike(qna_no, member_no, vo);

		// int member_no = (int)session.ge tAttribute("member_no");
		// System.out.println("컨트롤러에서 member_no : " + member_no);
		// CCRMember memberVo = (CCRMember)session.getAttribute("sessionUser");
		// int member_no = memberVo.getMember_no();
		// qnaService.insertLike(qna_no, member_no);
		return "redirect:./qna_read_page.do?qna_no=" + qna_no;
	}

	@RequestMapping("manager/board/qna_comment_process.do")
	public String qnaCommentProcess(CCRQnAComment vo) {
		System.out.println(vo.getQna_no() + "게시글 번호");
		System.out.println(vo.getQna_comment_text());
		System.out.println("관리자페이지에서 q&a 게시판에 댓글 작성");
		System.out.println("멤버 번호!!! : " + vo.getMember_no());
		qnaService.qnaCommentProcess(vo);

		return "redirect:./qna_content.do?qna_no=" + vo.getQna_no();
	}
}
