package com.ccr.ccrecipes.member.mapper;

import java.util.ArrayList;

import com.ccr.ccrecipes.vo.CCRMember;
import com.ccr.ccrecipes.vo.CCRQnA;

public interface MemberSQLMapper {

	public void insert(CCRMember vo);

	public CCRMember selectByIdAndPw(CCRMember vo);

	public CCRMember selectByNo(int member_no);

	public ArrayList<CCRMember> selectAll();

	public void deleteByNo(int member_no);

	public void updateByNo(CCRMember vo);

	public ArrayList<CCRQnA> selectByWriter(String search_name);

	public ArrayList<CCRMember> selectByEmail(String search_word);

	public ArrayList<CCRMember> selectByNickname(String search_word);

	public ArrayList<CCRMember> selectByRank(String search_word);

	public ArrayList<CCRMember> selectByMemberNo(String search_word);

}
