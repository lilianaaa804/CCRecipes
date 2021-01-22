package com.ccr.ccrecipes.member.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccr.ccrecipes.member.mapper.MemberSQLMapper;
import com.ccr.ccrecipes.vo.CCRMember;

@Service
public class MemberServiceImpl {

	@Autowired
	private MemberSQLMapper memberSQLMapper;

	public void joinMember(CCRMember vo) {

		memberSQLMapper.insert(vo);

	}

	public CCRMember login(CCRMember vo) {

		CCRMember result = memberSQLMapper.selectByIdAndPw(vo);

		return result;
	}

	//
	public CCRMember viewUser(int member_no) {

		CCRMember result = memberSQLMapper.selectByNo(member_no);

		return result;
	}
	
	//
	public void deleteMember(int member_no) {
		memberSQLMapper.deleteByNo(member_no);

	}

	public void updateMember(CCRMember vo) {
		memberSQLMapper.updateByNo(vo);
	}

	public HashMap<String, Object> getMember(int member_no) {

		CCRMember memberVo = memberSQLMapper.selectByNo(member_no);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberVo", memberVo);

		return map;
	}

	public ArrayList<HashMap<String, Object>> getSelectedMemberList(String search_word, String member_search) {

		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>();

		ArrayList<CCRMember> memberList = new ArrayList<CCRMember>();

		if (member_search.equals("search_email_member")) {
			memberList = memberSQLMapper.selectByEmail(search_word);

		} else if (member_search.equals("search_nickname_member")) {
			memberList = memberSQLMapper.selectByNickname(search_word);

		} else if (member_search.equals("search_rank_member")) {
			memberList = memberSQLMapper.selectByRank(search_word);

			ArrayList<Integer> memberNo = new ArrayList<Integer>();

			for (CCRMember memberVo : memberList) {
				String member_nickname = memberVo.getMember_nickname();
				int member_no = memberVo.getMember_no();
				System.out.println("멤버 닉네임 : 	" + member_nickname);
				System.out.println(search_word + "를 아이디에 담고 있는 멤버들의 멤버 번호는 : " + member_no);

				memberNo.add(member_no);
				// qnaList.add(qnaSQLMapper.selectByMemberNo(member_no));
			}
			System.out.println("memberNo : " + memberNo);

		}

		for (CCRMember ccrMemberVo : memberList) {

			HashMap<String, Object> map = new HashMap<>();
			map.put("ccrMemberVo", ccrMemberVo);

			resultList.add(map);
		}

		return resultList;

	}
}
