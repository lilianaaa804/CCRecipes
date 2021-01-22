package com.ccr.ccrecipes.content.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ccr.ccrecipes.content.service.ArticleServiceImpl;
import com.ccr.ccrecipes.vo.CCRArticle;
import com.ccr.ccrecipes.vo.CCRArticleFavorited;
import com.ccr.ccrecipes.vo.CCRArticleImage;
import com.ccr.ccrecipes.vo.CCRArticleLike;
import com.ccr.ccrecipes.vo.CCRMember;

@Controller
@RequestMapping("/article/*")
public class ArticleController {
	@Autowired
	private ArticleServiceImpl articleService;
	
	@RequestMapping(method=RequestMethod.GET, value="article_favorited_process.do")
	public ModelAndView clickFavoritedProcess(HttpSession session, int article_no) {
		CCRMember sessionUser = (CCRMember)session.getAttribute("sessionUser");
		CCRArticleFavorited param = new CCRArticleFavorited();
		param.setArticle_no(article_no);
		param.setMember_no(sessionUser.getMember_no());

		ModelAndView mav = new ModelAndView("redirect:./article_read_page.do?article_no="+article_no);
		articleService.clickFavorited(param);
		return mav;
	}
	
	
	@RequestMapping(method=RequestMethod.GET, value="article_like_process.do")
	public String articleLikeProcess(int article_no, int member_no) {
		CCRArticleLike param = new CCRArticleLike();
		param.setArticle_no(article_no);
		param.setMember_no(member_no);

		articleService.countArticleLike(param);
		
		return "redirect:./article_read_page.do?article_no="+article_no;
	}
	
	
	@RequestMapping(method=RequestMethod.GET, value="article_update.do")
	public ModelAndView updateArticle(int article_no) {
		ModelAndView mav = new ModelAndView("/article/article_update");
		HashMap<String, Object> map = articleService.readArticle(article_no);
		mav.addObject("result", map);

		System.out.println("매거진 글 수정 페이지 실행");
		return mav;
	}

	@RequestMapping("article_update_process.do")
	public String updateProcessArticle(CCRArticle param) {
		articleService.updateArticle(param);

		System.out.println("매거진 글 수정 프로세스 실행");
		return "redirect:./article_main.do";
	}

	@RequestMapping("article_delete_process.do")
	public String deleteArticle(int article_no) {
		articleService.deleteArticle(article_no);

		System.out.println("매거진 글 삭제 프로세스 실행");
		return "redirect:./article_main.do";
	}

	@RequestMapping(method=RequestMethod.GET, value="article_read.do")
	public ModelAndView readArticle(HttpSession session, int article_no) {
		CCRMember sessionUser = (CCRMember)session.getAttribute("sessionUser");
		CCRArticleFavorited param = new CCRArticleFavorited();
		param.setArticle_no(article_no);
		param.setMember_no(sessionUser.getMember_no());

		HashMap<String, Object> map = articleService.readArticle(article_no);
		int favorited = articleService.checkFavorited(param);
		int likeCount = articleService.getArticleLikeCount(article_no);

		ModelAndView mav = new ModelAndView("/article/article_read");
		mav.addObject("result", map);
		mav.addObject("favorited", favorited);
		mav.addObject("likeCount", likeCount);
		System.out.println(likeCount);

		return mav;
	}

	@RequestMapping(method=RequestMethod.GET, value="article_main.do")
	public ModelAndView articleMain(String search_word, String search_type,
			@RequestParam(value = "page_num", defaultValue = "1") int page_num) {
		
		ModelAndView mav = new ModelAndView("/article/article_main");
		ArrayList<HashMap<String, Object>> resultList = articleService.getArticleList(search_word, search_type,
				page_num);

		int pageCount = articleService.getArticleCount();

		int currentPage = page_num;
		int beginPage = ((currentPage - 1) / 5) * 5 + 1;
		int endPage = ((currentPage - 1) / 5 + 1) * 5;

		if (endPage > pageCount) {
			endPage = pageCount;
		}

		mav.addObject("resultList", resultList);
		mav.addObject("currentPage", currentPage);
		mav.addObject("beginPage", beginPage);
		mav.addObject("endPage", endPage);
		mav.addObject("pageCount", pageCount);

		System.out.println("매거진 메인페이지 실행");
		return mav;
	}

	@RequestMapping("article_write.do")
	public String writeArticle() {
		System.out.println("매거진 글쓰기 페이지 실행");
		return "/article/article_write";
	}

	@RequestMapping("article_write_process.do")
	public String writeArticleProcess(HttpSession session, String article_title, String article_text, MultipartFile[] files) {

		System.out.println("writeArticleProcess");
		ArrayList<CCRArticleImage> imageList = new ArrayList<CCRArticleImage>();
		// 업로드
		for (MultipartFile file : files) {
			if (file.getSize() <= 0) {
				continue;
			}
			// 날짜별 폴더 만들기
			String uploadRootFolderName = "Users\\user\\Desktop\\articleimageupload";
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String todayFolder = sdf.format(today);

			String uploadFolderName = uploadRootFolderName + todayFolder;

			File uploadFolder = new File(uploadFolderName);

			if (!uploadFolder.exists()) {
				uploadFolder.mkdirs();
			}

			String originalFileName = file.getOriginalFilename();

			String randomName = UUID.randomUUID().toString();
			long currentTime = System.currentTimeMillis();

			randomName = randomName + "_" + currentTime;

			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));

			randomName += ext;

			try {
				file.transferTo(new File(uploadFolderName + "/" + randomName));
			} catch (Exception e) {
				e.printStackTrace();
			}

			CCRArticleImage image = new CCRArticleImage();

			String link = "/upload/" + todayFolder + "/" + randomName;
			image.setArticleimg_link(link);

			imageList.add(image);
		}

		
		System.out.println("before setting memberno");
		CCRMember sessionUser = (CCRMember) session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();
		
		CCRArticle article = new CCRArticle();
		article.setArticle_title(article_title);
		article.setArticle_text(article_text);
		article.setMember_no(member_no);

		articleService.writeArticle(article, imageList);
		System.out.println("매거진 글쓰기 프로세스 실행");
		System.out.println("getArticle_no" + article.getArticle_no());
		System.out.println("getArticle_title" + article.getArticle_title());
		System.out.println("getArticle_text" + article.getArticle_text());

		return "redirect:./article_main.do";
	}
}
