package com.ccr.ccrecipes.content.mapper;

import java.util.ArrayList;

import com.ccr.ccrecipes.vo.CCRQnAComment;
import com.ccr.ccrecipes.vo.CCRQnA;
import com.ccr.ccrecipes.vo.CCRQnALike;

public interface QnASQLMapper {

	//qna mapper
//	public int getPageCount();
	
	public void insert(CCRQnA vo);
	
	public ArrayList<CCRQnA> selectAll();
	
	public void increaseViews(int qna_no);
	
	public CCRQnA selectByNo(int qna_no);
	
	public void delete(int qna_no);
	
	public void updateQna(CCRQnA vo);
	
//	public ArrayList<QnaContent> selectByWord(String search_word);
	
 	public ArrayList<CCRQnA> selectByTitle(String search_word);
//	
  	public ArrayList<CCRQnA> selectByText(String search_word);
//
	public ArrayList<CCRQnA> selectByWriter(String search_word);
//
	public ArrayList<CCRQnA> selectByEmail(String search_word);
	
	public ArrayList<CCRQnA> selectByMemberNo(String search_word);
	
	public ArrayList<CCRQnA> selectByRank(String search_word);
	
	public void insertLike(CCRQnALike vo);
	
	public void deleteLike(CCRQnALike vo);
	
	public String selectByQnaNoAndMemberNo(CCRQnALike vo);
	
	//commnetmapper

	public void insertQna(CCRQnAComment vo);

	public ArrayList<CCRQnAComment> selectByQnaNo(int qna_no);
	
	//
}
