package com.ccr.ccrecipes.content.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.ccr.ccrecipes.vo.CCRBulletinReple;

public interface BulletinRepleSQLMapper {
	
	public void insert(CCRBulletinReple vo);
	
	public ArrayList<CCRBulletinReple> selectByContentNo(int bulletin_no);
	
	public ArrayList<HashMap<String,Object>> selectRatioCount(int bulletin_no);
	
	
}

