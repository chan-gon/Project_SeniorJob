package com.company.portfolio.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.portfolio.service.PortfolioVO;
import com.company.portfolio.service.impl.PortfolioMapper;

@Controller
public class PortfolioController {
	
	@Autowired PortfolioMapper portmapper;
	// 포트폴리오 조회
	@RequestMapping("/portfolio")
	public String portfolio() {
		return "resume/portfolio";		  
	}
	// 등록폼
	@RequestMapping("/insertPortForm")
	public String insertPortForm(PortfolioVO vo) {
		return "resume/resumeInsert";
	}
	
	//등록
	@RequestMapping("/insertPort")
	public String insertPort(PortfolioVO vo) {
		portmapper.insertPort(vo);
		return "resume/resumeList";
	}
	
	// 수정폼
	@RequestMapping("/updatePortForm")
	public String updatePortForm(PortfolioVO vo) {
		return "resume/resumeUpdate";
	}
	
	//수정
	@RequestMapping("/updatePort")
	public String updatePort(PortfolioVO vo) {
		portmapper.updatePort(vo);
		return "resume/resumeList";
	}
	
	//단건조회
	@RequestMapping("/getPort")
	public String getPort(Model model, PortfolioVO vo) {
		model.addAttribute("portVO", portmapper.getPort(vo));
		return "";
	}
}
