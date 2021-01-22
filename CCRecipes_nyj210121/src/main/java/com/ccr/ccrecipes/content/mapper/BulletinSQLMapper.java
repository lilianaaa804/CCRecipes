package com.ccr.ccrecipes.content.mapper;

import java.util.ArrayList;

import com.ccr.ccrecipes.vo.CCRBulletin;

public interface BulletinSQLMapper {

	// 키생성
	public int createKey();

	// 글쓰기...
	public void insert(CCRBulletin vo);

	// 전체 출력..
	public ArrayList<CCRBulletin> selectAll(int page_num);

	// 제목 검색...
	public ArrayList<CCRBulletin> selectByTitle(String search_word);

	// 내용 검색
	public ArrayList<CCRBulletin> selectByContent(String search_word);

	// 작성자 검색
	public ArrayList<CCRBulletin> selectByWriter(String search_word);

	// 글보기...
	public CCRBulletin selectByNo(int no);

	// 글 삭제
	public void deleteByNo(int no);

	// 글 수정
	public void update(CCRBulletin vo);

	// 조회수 증가
	public void increaseReadCount(int no);

	// 페이지 개수
	public int getPageCount();

}
