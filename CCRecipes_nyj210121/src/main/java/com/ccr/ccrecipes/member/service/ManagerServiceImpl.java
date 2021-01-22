package com.ccr.ccrecipes.member.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccr.ccrecipes.member.mapper.MemberSQLMapper;
import com.ccr.ccrecipes.vo.CCRMember;

@Service
public class ManagerServiceImpl {
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	//이해! 관리자 페이지 > 회원정보 보기
	public ArrayList<HashMap<String, Object>> getMemberList(){ 
		
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<CCRMember> memberList = memberSQLMapper.selectAll();
		for(CCRMember ccrMemberVo : memberList) {
			
			//int member_no = ccrMemberVo.getMember_no();
			
			//CCRMember ccrMember = memberSQLMapper.selectByNo(member_no);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("ccrMemberVo", ccrMemberVo);
			
			resultList.add(map);
			
		}
		
		return resultList;	
	
	}
	
	
	
	
	
	
}
