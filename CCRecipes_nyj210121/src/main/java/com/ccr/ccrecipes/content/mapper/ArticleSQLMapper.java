package com.ccr.ccrecipes.content.mapper;

import java.util.ArrayList;

import com.ccr.ccrecipes.vo.CCRArticle;
import com.ccr.ccrecipes.vo.CCRArticleFavorited;
import com.ccr.ccrecipes.vo.CCRArticleImage;
import com.ccr.ccrecipes.vo.CCRArticleLike;

public interface ArticleSQLMapper {

	// article 글쓰기
	public void insert(CCRArticle vo);

	// article 목록 출력
	public ArrayList<CCRArticle> selectAll(int page_num);

	// article 글 보기
	public CCRArticle selectByNo(int no);

	// 글 삭제
	public void delete(int no);

	// 글 수정
	public void update(CCRArticle vo);

	// article 키 생성
	public int createKey();

	// article 조회수
	public void views(int no);

	// 페이지 개수
	public int getArticleCount();

	// 제목 검색
	public ArrayList<CCRArticle> selectByTitle(String search_word);

	// 내용 검색
	public ArrayList<CCRArticle> selectByText(String search_word);

	// 작성자 검색
	public ArrayList<CCRArticle> selectByMember(String search_word);

	// articleimagemapper
	public void insertImage(CCRArticleImage vo);

	public ArrayList<CCRArticleImage> selectByArticleNo(int article_no);

	public CCRArticleImage selectThumbnail(int article_no);
	
	//좋아요 insert
	public void insertLikes(CCRArticleLike vo);
	//좋아요 delete
	public void deleteLikes(CCRArticleLike vo);
	//좋아요한 멤버 뽑아오기
	public int selectAtcNoAndmembNo(CCRArticleLike vo);
	//좋아요한 수 
	public int countLikes(int article_no);
	
	//찜하기
	public void insertFavorited(CCRArticleFavorited vo);
	//찜취소
	public void deleteFavorited(CCRArticleFavorited vo);
	//찜목록 전체 뽑아오기
	public ArrayList<CCRArticleFavorited> selectFavorited();
	//이미 찜한 사람 뽑아오기
	public int alreadyFavorited(CCRArticleFavorited vo);

	public int checkFavorited(CCRArticleFavorited param);
	

}
