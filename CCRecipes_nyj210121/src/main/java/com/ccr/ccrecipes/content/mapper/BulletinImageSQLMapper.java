package com.ccr.ccrecipes.content.mapper;

import java.util.ArrayList;

import com.ccr.ccrecipes.vo.CCRBulletinImage;

public interface BulletinImageSQLMapper {
	
	public void insert(CCRBulletinImage vo);
	
	public ArrayList<CCRBulletinImage> selectByContentNo(int bulletin_no);	
}
