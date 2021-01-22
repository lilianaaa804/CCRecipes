package com.ccr.ccrecipes.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ccr.ccrecipes.member.service.ManagerServiceImpl;
import com.ccr.ccrecipes.member.service.MemberServiceImpl;
import com.ccr.ccrecipes.content.service.QnAServiceImpl;

@Controller
@RequestMapping("/manager/*")
public class ManagerController {

	@Autowired
	private QnAServiceImpl qnaService;

	@Autowired
	private ManagerServiceImpl managerService;

	//
	@Autowired
	private MemberServiceImpl memberService;

	@RequestMapping("member/member_list.do")
	public String managerPage(Model model, HttpServletRequest request) {

		String referer = request.getHeader("referer");
		if (referer != null) {
			ArrayList<HashMap<String, Object>> memberList = new ArrayList<HashMap<String, Object>>();
			memberList = managerService.getMemberList();

			model.addAttribute("memberList", memberList);

			System.out.println("멤버 관리 페이지 실행");

			return "manager/member/member_list";

		} else {
			return "redirect:../wrong_access.do";
		}
	}

	@RequestMapping("member/withdrawn_member_list.do")
	public String withdrawnMemberBoard(Model model, HttpServletRequest request) {

		String referer = request.getHeader("referer");
		if (referer != null) {
			ArrayList<HashMap<String, Object>> memberList = new ArrayList<HashMap<String, Object>>();
			memberList = managerService.getMemberList();

			model.addAttribute("memberList", memberList);

			System.out.println("탈퇴한 회원 리스트");
			return "manager/member/withdrawn_member_list";

		} else {
			return "redirect:../wrong_access.do";
		}
	}

	@RequestMapping("board/notice_list.do")
	public String notice() {

		System.out.println("관리자페이지 공지사항 목록");
		return "manager/board/notice_list";
	}

	@RequestMapping("board/qna_list.do")
	public String qnaBoard(Model model) {

		// QNA 게시판에 있는 글 불러오기
		ArrayList<HashMap<String, Object>> qnaList = new ArrayList<HashMap<String, Object>>();
		qnaList = qnaService.getQnAList();

		model.addAttribute("qnaList", qnaList);

		System.out.println("관리자페이지에서 Q&A 목록 실행");
		return "manager/board/qna_list";
	}

	@RequestMapping("board/free_board.do")
	public String freeBoard() {

		System.out.println("관리자페이지에서 자유게시판 실행");
		return "manager/board/free_board";
	}

	@RequestMapping("class/class_list.do")
	public String classBoard() {

		System.out.println("관리자페이지에서 자유게시판 실행");
		return "manager/class/class_list";
	}

	@RequestMapping("class/teacher_list.do")
	public String teacherList() {

		System.out.println("관리자페이지에서 선생님 목록 ");
		return "manager/class/teacher_list";
	}

//	@RequestMapping("class/class_member_list.do")
//	public String classMemberList() {
//		
//		System.out.println("관리자페이지에서 클래스회원목록출력");
//		return "manager/class/class_member_list";
//	}

	@RequestMapping("service/coin_order.do")
	public String coinOrderList() {
		System.out.println("관리자페이지에서 코인 구매 목록");
		return "manager/service/coin_order";
	}

	@RequestMapping("service/report_list.do")
	public String reportList() {

		System.out.println("관리자페이지에서 코인 구매 목록");
		return "manager/service/report_list";
	}

	@RequestMapping("member/member_serach.do")
	public String memberSearch(Model model, String search_word, String member_search) {

		System.out.println("검색어 : " + search_word);
		ArrayList<HashMap<String, Object>> map = memberService.getSelectedMemberList(search_word, member_search);
		model.addAttribute("resultList", map);

		System.out.println(member_search + " : member_search");

		System.out.println("관리자 페이지 Q&A 검색 기능 실행");
		return "manager/member/member_search_board";
	}

	// 관리자 페이지에서 qna 검색창
	@RequestMapping("board/qna_serach.do")
	public String qnaSearch(Model model, String search_word, String qna_search) {

		System.out.println("검색어 : " + search_word);
		ArrayList<HashMap<String, Object>> map = new ArrayList<HashMap<String, Object>>();

		map = qnaService.getSelectedQnAList(search_word, qna_search);

//		qnaBoard.getSelectedMemberList(search_word, member_search);
		model.addAttribute("resultList", map);

		System.out.println(qna_search + " : qna_search");

		System.out.println("관리자 페이지 Q&A 검색 기능 실행");
		return "manager/board/qna_search_list";
	}

	@RequestMapping("megazine/editor_list.do")
	public String editorList() {

		System.out.println("관리자페이지에서 에디터 목록");
		return "manager/megazine/editor_list";
	}

	@RequestMapping("megazine/megazine_list.do")
	public String megazineList() {

		System.out.println("관리자페이지에서 매거진 목록");
		return "manager/megazine/megazine_list";
	}

	@RequestMapping("statistic/member_join.do")
	public String memberJoinStatistic() {

		return "manager/statistic/member_join";
	}

	@RequestMapping("statistic/views.do")
	public String views() {

		return "manager/statistic/views";
	}

	@RequestMapping("board/qna_content.do")
	public String qnaContentByManager(Model model, int qna_no) {
		System.out.println(qna_no + " : qna_no");

		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println("map = qnaService.getQnaContent(qna_no) 실행 중입니다.... ");
		map = qnaService.getQnAContent(qna_no);
		System.out.println("실행완료");
		model.addAttribute("resultList", map);

		System.out.println("관리자페이지에서 Q&a 본문 실행");

		// 댓글창 출력
		ArrayList<HashMap<String, Object>> commentList = new ArrayList<HashMap<String, Object>>();
		commentList = qnaService.getQnACommentList(qna_no);
		model.addAttribute("commentList", commentList);

		return "manager/board/qna_content";
	}

	// 관리자페이지 잘못된 접근
	@RequestMapping("wrong_access.do")
	public String wrongAcess() {
		System.out.println("잘못된 접근");
		return "manager/wrong_access";
	}
}
