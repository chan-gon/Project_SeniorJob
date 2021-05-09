package com.company.self_info.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.self_info.service.Self_InfoVO;
import com.company.self_info.service.impl.Self_InfoMapper;

@Controller
public class Self_InfoController {
	
	@Autowired Self_InfoMapper selfmapper;
	
	// 자기소개서 전체조회
	@RequestMapping("/getSearchSelfList")
	public String getSearchSelfList(Model model, Self_InfoVO vo) {
		model.addAttribute("slist", selfmapper.getSearchSelfList());
		return "resume/selfInfo";		  
	}
	//등록폼
	@RequestMapping("/insertSelfForm")
	public String insertSelfForm() {
		return "resume/selfInfo";		  
	}
	
	//등록
	@RequestMapping("/insertSelf")
	public String insertSelf(Self_InfoVO vo) {
		selfmapper.insertSelf(vo);
		return "resume/resumeUpdate";		  
	}
	
	//수정폼
	@RequestMapping("/updateSelfForm")
	public String updateSelfForm(Model model, Self_InfoVO vo) {
		model.addAttribute("selfvo", selfmapper.getSelf(vo));
		return "resume/resumeUpdate";		  
	}
	
	//수정
	@RequestMapping("/updateSelf")
	public String updateSelf(Self_InfoVO vo) {
		selfmapper.updateSelf(vo);
		return "resume/resumeList";		  
	}

	//삭제
	@RequestMapping("/deleteSelf")
	public String deleteSelf(Self_InfoVO vo) {
		selfmapper.deleteSelf(vo);
		return "";		  
	}
	
	//단건 조회
	@RequestMapping("/getSelf")
	public String getSelf(Model model, Self_InfoVO vo) {
		model.addAttribute("selfvo", selfmapper.getSelf(vo));
		return "resume/resumeList";		  
	}
}
