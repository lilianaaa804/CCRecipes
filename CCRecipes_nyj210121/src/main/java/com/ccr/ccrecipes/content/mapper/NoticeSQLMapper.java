package com.ccr.ccrecipes.content.mapper;

import java.util.ArrayList;

import com.ccr.ccrecipes.vo.CCRNotice;

public interface NoticeSQLMapper {
	
	//공지사항 입력
	public void insert(CCRNotice vo);
	
	//공지사항 전체출력
	public ArrayList<CCRNotice> selectAll(int page_num);
	
	//글보기 
	public CCRNotice selectByNo(int no);
	
	//글삭제
	public void deleteByNo(int no);
	
	//글수정
	public void update(CCRNotice vo);

	//조회수증가
	public void increaseReadCount(int no);
	
	//제목검색
	public ArrayList<CCRNotice> selectByTitle(String search_word);
	
	//페이지 수 
	public int getPageCount();
}
