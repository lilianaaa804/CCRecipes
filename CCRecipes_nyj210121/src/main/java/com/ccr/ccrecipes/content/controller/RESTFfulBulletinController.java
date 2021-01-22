package com.ccr.ccrecipes.content.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ccr.ccrecipes.content.service.BulletinServiceImpl;
import com.ccr.ccrecipes.vo.CCRMember;
import com.ccr.ccrecipes.vo.CCRBulletinReple;



@Controller
@RequestMapping("/content/*")
@ResponseBody //포워딩을안한다 - 리턴타입이 특이해진다
public class RESTFfulBulletinController {
	
//@controller할때 리턴타입은 항상 포워딩or리다이렉트위해 스트링으로했지만
//레스트컨트롤러는 말 그대로 나머지는 내맘대로 설계가능
	@Autowired
	private BulletinServiceImpl bulletinService;
	
	
	@RequestMapping("get_reple_list.do")
	public ArrayList<HashMap<String, Object>> getRepleList(int bulletin_no){
		ArrayList<HashMap<String, Object>> result=
				bulletinService.getRepleList(bulletin_no);
		
		return result;
	}
	@RequestMapping("write_reple_process.do")
	public void writeRepleProcess(CCRBulletinReple param, HttpSession session) {
		System.out.println("1");
		int member_no =((CCRMember)session.getAttribute("sessionUser")).getMember_no();
		System.out.println("2");
		param.setMember_no(member_no);
		System.out.println("3");
		bulletinService.writeReple(param);
		
	}
	@RequestMapping("test_json.do")
	public HashMap<String,Object> testJSON() {
		System.out.println("[test json]");
		
		HashMap<String, Object> map= new HashMap<String, Object>();
		ArrayList<CCRMember> list = new ArrayList<CCRMember>();
		list.add(new CCRMember());
		list.add(new CCRMember());
		
		map.put("AAA",1);
		map.put("BBB",1.12);
		map.put("CCC","gggg");
		map.put("DDD",false);
		map.put("EEE","true");
		map.put("QQQ",list);
		map.put("TTT",new CCRBulletinReple());
		
		return map;
		//제이슨 문법 {'a':1,'b':'2' , ,}=객체... 해쉬맵과같이 키와 값
		//[]배열..
		//[{},{}]=
		//HASH맵도 객체
	}
	
}
