package com.ccr.ccrecipes.content.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccr.ccrecipes.content.mapper.BulletinSQLMapper;
import com.ccr.ccrecipes.member.mapper.MemberSQLMapper;
import com.ccr.ccrecipes.vo.CCRBulletin;
import com.ccr.ccrecipes.vo.CCRMember;
import com.ccr.ccrecipes.content.mapper.BulletinImageSQLMapper;
import com.ccr.ccrecipes.content.mapper.BulletinRepleSQLMapper;
import com.ccr.ccrecipes.vo.CCRBulletinImage;
import com.ccr.ccrecipes.vo.CCRBulletinReple;

@Service
public class BulletinServiceImpl {

	@Autowired
	private BulletinSQLMapper bulletinSQLMapper;

	@Autowired
	private MemberSQLMapper memberSQLMapper;

	@Autowired
	private BulletinImageSQLMapper bulletinImageSQLMapper;

	@Autowired
	private BulletinRepleSQLMapper bulletinRepleSQLMapper;

	public void writeContent(CCRBulletin vo, ArrayList<CCRBulletinImage> imageVoList) {
		System.out.println("writeContent");

		int contentPk = bulletinSQLMapper.createKey();
		vo.setBulletin_no(contentPk);

//		System.out.println(vo.getMember_no());
//		System.out.println(vo.getBulletin_no());
//		System.out.println(vo.getBulletin_title());
//		System.out.println(vo.getBulletin_content());

		for (CCRBulletinImage imageVo : imageVoList) {
			imageVo.setBulletin_no(contentPk);
			bulletinImageSQLMapper.insert(imageVo);
		}

		bulletinSQLMapper.insert(vo);

	}

	public ArrayList<HashMap<String, Object>> getContentList(String search_word, String search_type, int page_num) {
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>();

		ArrayList<CCRBulletin> contentList = null;

		if (search_word == null || search_type == null) {
			contentList = bulletinSQLMapper.selectAll(page_num);
		} else {
			if (search_type.equals("title")) {
				contentList = bulletinSQLMapper.selectByTitle(search_word);
			} else if (search_type.equals("content")) {
				contentList = bulletinSQLMapper.selectByContent(search_word);
			} else if (search_type.equals("writer")) {
				contentList = bulletinSQLMapper.selectByWriter(search_word);
			} else {
				contentList = bulletinSQLMapper.selectAll(page_num);
			}
		}

		for (CCRBulletin CCRBulletin : contentList) {
			int member_no = CCRBulletin.getMember_no();

			CCRMember CCRMember = memberSQLMapper.selectByNo(member_no);

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("CCRMember", CCRMember);
			map.put("CCRBulletin", CCRBulletin);

			resultList.add(map);
		}

		return resultList;
	}

	public HashMap<String, Object> getContent(int bulletin_no) {

		// 조회수 증가 쿼리 실행..
		bulletinSQLMapper.increaseReadCount(bulletin_no);

		// 출력 데이터 받아 오기...
		CCRBulletin contentVo = bulletinSQLMapper.selectByNo(bulletin_no);

		String str = contentVo.getBulletin_content();
		str = StringEscapeUtils.escapeHtml4(str);
		str = str.replaceAll("\n", "<br>");
		contentVo.setBulletin_content(str);
		// 게시판에 글쓰기할때 엔터를 br로바꿔주는거

		int member_no = contentVo.getMember_no();
		CCRMember CCRMember = memberSQLMapper.selectByNo(member_no);

		ArrayList<CCRBulletinImage> imageVoList = bulletinImageSQLMapper.selectByContentNo(bulletin_no);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("CCRMember", CCRMember);
		map.put("contentVo", contentVo);
		map.put("imageVoList", imageVoList);

		return map;
	}

	public void deleteContent(int bulletin_no) {
		bulletinSQLMapper.deleteByNo(bulletin_no);
	}

	public void updateContent(CCRBulletin vo) {
		bulletinSQLMapper.update(vo);
	}

	public int getPageCount() {
		return bulletinSQLMapper.getPageCount();
	}

	public void writeReple(CCRBulletinReple vo) {
		bulletinRepleSQLMapper.insert(vo);
	}

	public ArrayList<HashMap<String, Object>> getRepleList(int bulletin_no) {

		ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String, Object>>();

		ArrayList<CCRBulletinReple> repleVoList = bulletinRepleSQLMapper.selectByContentNo(bulletin_no);

		for (CCRBulletinReple repleVo : repleVoList) {

			CCRMember CCRMember = memberSQLMapper.selectByNo(repleVo.getMember_no());
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("CCRMember", CCRMember);
			map.put("repleVo", repleVo);

			result.add(map); // result는 맵을 담을 arrayList
		}

		return result;

	}

	public ArrayList<HashMap<String, Object>> getRatioCount(int bulletin_no) {

		return bulletinRepleSQLMapper.selectRatioCount(bulletin_no);
	}

}
