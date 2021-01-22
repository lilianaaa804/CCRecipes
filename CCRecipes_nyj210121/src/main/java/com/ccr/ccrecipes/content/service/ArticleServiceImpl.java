package com.ccr.ccrecipes.content.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.web.servlet.ModelAndView;

import com.ccr.ccrecipes.content.mapper.ArticleSQLMapper;
import com.ccr.ccrecipes.member.mapper.MemberSQLMapper;
import com.ccr.ccrecipes.vo.CCRArticle;
import com.ccr.ccrecipes.vo.CCRArticleFavorited;
import com.ccr.ccrecipes.vo.CCRArticleImage;
import com.ccr.ccrecipes.vo.CCRArticleLike;
import com.ccr.ccrecipes.vo.CCRMember;

@Service
public class ArticleServiceImpl {
	
	@Autowired
	private ArticleSQLMapper articleSQLMapper;
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	//찜 클릭
	public void clickFavorited(CCRArticleFavorited param) {
		//vo.setArticle_no(article_no);
		//vo.setMember_no(member_no);
		
		
		int no = articleSQLMapper.checkFavorited(param);
		if(no == 0) {
			articleSQLMapper.insertFavorited(param);
		}else {
			articleSQLMapper.deleteFavorited(param);
		}
		
	}
	
	public int checkFavorited(CCRArticleFavorited param) {
		return articleSQLMapper.checkFavorited(param);
	}
	
	public int getArticleLikeCount(int article_no) {
		return articleSQLMapper.countLikes(article_no);
	}
	
	//좋아요 클릭
	public int countArticleLike(int article_no, int member_no, CCRArticleLike vo) {
		
		ModelAndView mav = new ModelAndView();
		vo.setMember_no(member_no);
		vo.setArticle_no(article_no);
		
		int no = articleSQLMapper.selectAtcNoAndmembNo(vo);
		int likes;
		System.out.println("no값:" + no);
		if(no == 0) {
			articleSQLMapper.insertLikes(vo);
		}else {
			articleSQLMapper.deleteLikes(vo);
		}
		
		likes = articleSQLMapper.countLikes(article_no);
		
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("likes", likes);
		
		resultList.add(map);
		mav.addObject("resultList", resultList);
		System.out.println(likes+"likes map 에 put");
		return likes;
	}
	
	//페이징
	public int getArticleCount() {
		return articleSQLMapper.getArticleCount();
	}
	
	//글 수정
	public void updateArticle(CCRArticle vo) {
		articleSQLMapper.update(vo);
	}
	//글 삭제
	public void deleteArticle(int articleNo) {
		articleSQLMapper.delete(articleNo);
	}
	
	//article 글 조회
	public HashMap<String,Object> readArticle(int articleNo){
		
		//조회수 증가
		articleSQLMapper.views(articleNo);
		
		CCRArticle article = articleSQLMapper.selectByNo(articleNo);
		
		String str = article.getArticle_text();
		str = StringEscapeUtils.escapeHtml4(str);
		str = str.replaceAll("\n", "<br>");
		article.setArticle_text(str);
		
		int member_no = article.getMember_no();
		CCRMember ccrMember = memberSQLMapper.selectByNo(member_no);
		
		
		ArrayList<CCRArticleImage> imageList = 
				articleSQLMapper.selectByArticleNo(articleNo);
		System.out.println(imageList +"mapper 불러오기");
		HashMap<String, Object> map = new HashMap<String,Object>();
		map.put("ccrMember", ccrMember);
		map.put("article", article);
		map.put("imageList", imageList);
		System.out.println(map +" map.put 실행");
		
		return map;
		
	}
	
	//article 글 목록 출력+검색+썸네일
	public ArrayList<HashMap<String,Object>> getArticleList(String search_word, String search_type, int page_num){
		
		ArrayList<HashMap<String,Object>> resultList = new ArrayList<HashMap<String,Object>>();
		ArrayList<CCRArticle> articleList = null;
		
		if(search_word == null || search_type == null) {
			articleList = articleSQLMapper.selectAll(page_num);
		}else {
			if(search_type.equals("title")) {
				articleList = articleSQLMapper.selectByTitle(search_word);
			}else if(search_type.equals("text")) {
				articleList = articleSQLMapper.selectByText(search_word);
			}else if(search_type.equals("member")) {
				articleList = articleSQLMapper.selectByMember(search_word);
			}else {
				articleList = articleSQLMapper.selectAll(page_num);
			}
		}
		
		for(CCRArticle article: articleList) {
			int member_no = article.getMember_no();
			CCRMember ccrMember = memberSQLMapper.selectByNo(member_no);
			int article_no = article.getArticle_no();
			CCRArticleImage articleImage = articleSQLMapper.selectThumbnail(article_no);
			System.out.println(article_no+"글번호 불러오기");
			
			
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("ccrMember", ccrMember);
			map.put("article", article);
			map.put("articleImage", articleImage);
			resultList.add(map);
			System.out.println(resultList + "resultList 확인");
		}
		return resultList;
	}
	
	//article 글쓰기 
	public void writeArticle(CCRArticle vo, ArrayList<CCRArticleImage> imageList){
		
		int articlePK = articleSQLMapper.createKey();
		
		System.out.println(articlePK);
		
		vo.setArticle_no(articlePK);
		
		articleSQLMapper.insert(vo);
		
		
		for(CCRArticleImage image : imageList) {
			image.setArticle_no(articlePK);
			articleSQLMapper.insertImage(image);
		}
		
		System.out.println("end of writearticle service");
		
	}
	
}
