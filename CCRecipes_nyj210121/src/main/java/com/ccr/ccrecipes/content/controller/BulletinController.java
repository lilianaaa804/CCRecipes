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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ccr.ccrecipes.content.service.BulletinServiceImpl;
import com.ccr.ccrecipes.vo.CCRArticleImage;
import com.ccr.ccrecipes.vo.CCRBulletin;
import com.ccr.ccrecipes.vo.CCRMember;
import com.ccr.ccrecipes.vo.CCRBulletinImage;

@Controller
@RequestMapping("/bulletin/*")
public class BulletinController {
	@Autowired
	private BulletinServiceImpl bulletinService;

	@RequestMapping("bulletin_page.do")
	public String freeBoardPage(Model model, String search_word, String search_type,
			@RequestParam(value = "page_num", defaultValue = "1") int page_num) {

		ArrayList<HashMap<String, Object>> resultList = bulletinService.getContentList(search_word, search_type,
				page_num);

		int pageCount = bulletinService.getPageCount();

		int currentPage = page_num;
		int beginPage = ((currentPage - 1) / 5) * 5 + 1;
		int endPage = ((currentPage - 1) / 5 + 1) * (5);

		if (endPage > pageCount) {
			endPage = pageCount;
		}

		model.addAttribute("resultList", resultList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageCount", pageCount);

		return "/bulletin/bulletin_page";
	}

	@RequestMapping("write_bulletin_page.do")
	public String writeContentPage() {

		return "/bulletin/write_bulletin_page";
	}

	@RequestMapping("write_bulletin_process.do")
	public String writeContentProcess(HttpSession session, String bulletin_title, String bulletin_content,
			MultipartFile[] files) {
		System.out.println("writeContentProcess");

		CCRMember sessionUser = (CCRMember) session.getAttribute("sessionUser"); //로그인된사람
		int member_no = sessionUser.getMember_no();

		CCRBulletin newpost = new CCRBulletin();
		newpost.setBulletin_title(bulletin_title);
		newpost.setBulletin_content(bulletin_content);
		newpost.setMember_no(member_no);

		ArrayList<CCRBulletinImage> imageVoList = new ArrayList<CCRBulletinImage>();
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

			CCRBulletinImage image = new CCRBulletinImage();

			String link = "/upload/" + todayFolder + "/" + randomName;
			image.setImage_link(link);

			imageVoList.add(image);
		}

		bulletinService.writeContent(newpost, imageVoList);

		return "redirect:./bulletin_page.do";
	}

	@RequestMapping("read_bulletin_page.do")
	public String readContentPage(Model model, int bulletin_no) {

		HashMap<String, Object> map = bulletinService.getContent(bulletin_no);

		model.addAttribute("result", map);

		return "/bulletin/read_bulletin_page";
	}

	@RequestMapping("delete_bulletin_process.do")
	public String deleteContentProcess(int bulletin_no) {

		bulletinService.deleteContent(bulletin_no);

		return "redirect:./bulletin_page.do";
	}

	@RequestMapping("update_bulletin_page.do")
	public String updateContentPage(Model model, int bulletin_no) {

		HashMap<String, Object> map = bulletinService.getContent(bulletin_no);

		model.addAttribute("result", map);

		return "/bulletin/update_bulletin_page";
	}

	@RequestMapping("update_bulletin_process.do")
	public String updateContentProcess(CCRBulletin param) {

		bulletinService.updateContent(param);

		return "redirect:./bulletin_page.do";
	}

}
