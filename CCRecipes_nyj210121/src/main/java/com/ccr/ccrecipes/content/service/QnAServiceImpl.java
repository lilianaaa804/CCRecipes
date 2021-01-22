package com.ccr.ccrecipes.content.service;

import java.util.ArrayList;
import java.util.HashMap;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccr.ccrecipes.member.mapper.MemberSQLMapper;
import com.ccr.ccrecipes.content.mapper.QnASQLMapper;
import com.ccr.ccrecipes.vo.CCRMember;
import com.ccr.ccrecipes.vo.CCRQnAComment;
import com.ccr.ccrecipes.vo.CCRQnA;
import com.ccr.ccrecipes.vo.CCRQnALike;

@Service
public class QnAServiceImpl {

	@Autowired
	private QnASQLMapper qnaSQLMapper;

	public void writingProcess(CCRQnA vo) {

		qnaSQLMapper.insert(vo);

	}

	@Autowired
	private MemberSQLMapper memberSQLMapper;

	// 게시물 목록 리스트 출력 (미리보기)

	public ArrayList<HashMap<String, Object>> getQnAList() {

		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>();

		ArrayList<CCRQnA> qnaList = qnaSQLMapper.selectAll();

		for (CCRQnA qnaContentVo : qnaList) {

			int member_no = qnaContentVo.getMember_no();

			HashMap<String, Object> map = new HashMap<>();
			CCRMember ccrMember = memberSQLMapper.selectByNo(member_no);
			map.put("ccrMember", ccrMember);
			map.put("qnaContentVo", qnaContentVo);

			resultList.add(map);
		}

		return resultList;

	}

	// 게시물 자체 클릭했을 때 내부에 게시물 내용이 출력되게
	public HashMap<String, Object> getQnAContent(int qna_no) {

		qnaSQLMapper.increaseViews(qna_no);

		// 컨텐츠 번호로 컨텐츠에 대한 정보 꺼내오기
		CCRQnA qnaContentVo = qnaSQLMapper.selectByNo(qna_no);
		// 해당 컨텐츠의 member_no 변수를 꺼내오기
		int member_no = qnaContentVo.getMember_no();
		CCRMember ccrMemberVo = memberSQLMapper.selectByNo(member_no);

		// 해당 글에 대한 멤버 정보와 컨텐츠 정보를 HashMap map에 넣기
		HashMap<String, Object> map = new HashMap<String,Object>();
		map.put("ccMemberVo", ccrMemberVo);
		map.put("qnaContentVo", qnaContentVo);

		return map;
	}

	public void deleteProcess(int qna_no) {
		qnaSQLMapper.delete(qna_no);
	}

	public void updateContent(CCRQnA vo) {
		qnaSQLMapper.updateQna(vo);
	}

//	public int getPageCount() {
//		return qnaSQLMapper.getPageCount();
//	}

//	public ArrayList<HashMap<String, Object>> getSelectedQnaList(String search_word) {
//		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
//		
//		ArrayList<QnaContent> qnaList = qnaSQLMapper.selectByWord(search_word);
//		
//		for(QnaContent selectedQna : qnaList) {
//			
//			HashMap<String, Object> map = new HashMap<String, Object>();
//			map.put("selectedQna", selectedQna);
//			
//			resultList.add(map);
//		}
//		
//		return resultList;
//	}

	public ArrayList<HashMap<String, Object>> getSelectedQnAList(String search_word, String qna_search) {

		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>();

		ArrayList<CCRQnA> qnaList = new ArrayList<CCRQnA>();

		if (qna_search.equals("search_title_qna")) {

			qnaList = qnaSQLMapper.selectByTitle(search_word);

		} else if (qna_search.equals("search_text_qna")) {

			qnaList = qnaSQLMapper.selectByText(search_word);

		} else if (qna_search.equals("search_writer_qna")) {

			qnaList = qnaSQLMapper.selectByWriter(search_word);

		} else if (qna_search.equals("search_email_qna")) {

			qnaList = qnaSQLMapper.selectByEmail(search_word);

		} else if (qna_search.equals("search_member_no_qna")) {

			qnaList = qnaSQLMapper.selectByMemberNo(search_word);

		} else {
			System.out.println("아무것도 안 실행");
		}

		for (CCRQnA qnaContentVo : qnaList) {

			HashMap<String, Object> map = new HashMap<>();
			int member_no = qnaContentVo.getMember_no();
			System.out.println("member_no : " + member_no);

			CCRMember ccrMember = memberSQLMapper.selectByNo(member_no);

			map.put("qnaContentVo", qnaContentVo);
			map.put("ccrMember", ccrMember);
			// 해당 값 : null > System.out.println(map.get(qnaContentVo));
			resultList.add(map);
		}
		System.out.println(resultList);
		return resultList;

	}

	public void clickLike(int member_no, int qna_no, CCRQnALike vo) {

		vo.setMember_no(member_no);
		vo.setQna_no(qna_no);

		System.out.println("-----------------------");
		System.out.println("서비스에서 qna_no : " + qna_no);
		System.out.println("서비스에서 member_no : " + member_no);

		String no = qnaSQLMapper.selectByQnaNoAndMemberNo(vo);
		if (no.equals("0")) {
			System.out.println("쿼리 개수가 0개");
			qnaSQLMapper.insertLike(vo);
		} else {
			System.out.println("널 값이 아님 쿼리는 1개일 것임");
			System.out.println(no);
		}

		// qnaSQLMapper.insertLike(vo);

		System.out.println("좋아요 insert service 실행");
		System.out.println("---------	--------------");

	}

	public void qnaCommentProcess(CCRQnAComment vo) {

		qnaSQLMapper.insertQna(vo);
	}

	public ArrayList<HashMap<String, Object>> getQnACommentList(int qna_no) {

		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>();

		ArrayList<CCRQnAComment> commentList = qnaSQLMapper.selectByQnaNo(qna_no);

		for (CCRQnAComment qnaCommentVo : commentList) {
			int member_no = qnaCommentVo.getMember_no();
			// System.out.println("member_no 값 : " + member_no);
			HashMap<String, Object> map = new HashMap<String, Object>();
			CCRMember ccrMember = memberSQLMapper.selectByNo(member_no);
			// System.out.println(ccrMember + " ccrMember 란?");
			map.put("ccrMember", ccrMember);
			map.put("qnaCommentVo", qnaCommentVo);

			resultList.add(map);

		}

		return resultList;
	}

}
