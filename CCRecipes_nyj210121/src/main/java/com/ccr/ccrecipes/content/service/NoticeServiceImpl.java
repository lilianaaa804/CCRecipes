package com.ccr.ccrecipes.content.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccr.ccrecipes.content.mapper.NoticeSQLMapper;
import com.ccr.ccrecipes.member.mapper.MemberSQLMapper;
import com.ccr.ccrecipes.vo.CCRMember;
import com.ccr.ccrecipes.vo.CCRNotice;

@Service
public class NoticeServiceImpl {

	@Autowired
	private MemberSQLMapper memberSQLMapper;

	@Autowired
	private NoticeSQLMapper noticeSQLMapper;

	// 공지사항리스트
	public ArrayList<HashMap<String, Object>> getNoticeList(String search_word,int page_num) {
		ArrayList<HashMap<String, Object>> noticeResultList = new ArrayList<HashMap<String, Object>>();

		ArrayList<CCRNotice> noticeList = null;
		if(search_word==null) {
			noticeList = noticeSQLMapper.selectAll(page_num);
		}else{
			noticeList = noticeSQLMapper.selectByTitle(search_word);
		}
		
		

		for (CCRNotice ccrNotice : noticeList) {
			int member_no = ccrNotice.getMember_no();
			CCRMember ccrMember = memberSQLMapper.selectByNo(member_no);

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("ccrMember", ccrMember);
			map.put("ccrNotice", ccrNotice);

			noticeResultList.add(map);

		}
		return noticeResultList;
	}

	// 공지사항 작성
	public void writeNotice(CCRNotice vo) {

		noticeSQLMapper.insert(vo);
	}

	// 공지사항 보기
	public HashMap<String, Object> getNotice(int notice_no) {

		noticeSQLMapper.increaseReadCount(notice_no);

		CCRNotice ccrNotice = noticeSQLMapper.selectByNo(notice_no);
		int member_no = ccrNotice.getMember_no();
		CCRMember ccrMember = memberSQLMapper.selectByNo(member_no);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ccrMember", ccrMember);
		map.put("ccrNotice", ccrNotice);

		return map;

	}

	// 공지사항 삭제
	public void deleteNotice(int notice_no) {

		noticeSQLMapper.deleteByNo(notice_no);
	}

	// 공지사항 수정
	public void updateNotice(CCRNotice vo) {

		noticeSQLMapper.update(vo);
	}
	//페이지수 
	public int getPageCount() {
		return noticeSQLMapper.getPageCount();
	}
}
