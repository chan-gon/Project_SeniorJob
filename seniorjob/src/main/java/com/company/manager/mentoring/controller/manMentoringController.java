package com.company.manager.mentoring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.manager.mentoring.manMentoringVO;
import com.company.manager.mentoring.service.impl.manMentoringMapper;
import com.company.manager.utils.ManPageMaker;
import com.company.manager.utils.ManSearchCriteria;

@Controller
public class manMentoringController {

	@Autowired manMentoringMapper manmentoringmapper ; 
	
	//멘토링 리스트 조회
	@RequestMapping("/mentoringList")
	public String list(Model model, @ModelAttribute("scri") ManSearchCriteria scri) {

		model.addAttribute("menViewAll", manmentoringmapper.mentoringList(scri));

		ManPageMaker pageMaker = new ManPageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(manmentoringmapper.mentoringCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "/manager/mentoring"; 
	}
	
	//멘토링 검색
	@RequestMapping("/MenSearchService")
	public String searchService(Model model, @RequestParam(value="searchKeyword", required=false) String searchKeyword) {
		List<manMentoringVO> list = manmentoringmapper.searchMentoring(searchKeyword);
		model.addAttribute("list", list);
		return "/manager/mentoring";
	}
	
	//멘토링 상세(단건)조회
	@ResponseBody
	@RequestMapping("/getManMentoringList")
	public List<manMentoringVO> getMentoringList(manMentoringVO vo) {
		return manmentoringmapper.getManMentoringList(vo);
	}
	
	//멘토링 삭제
	@ResponseBody
	@RequestMapping("/deleteManMentoring")
	public String deleteMentoring(manMentoringVO vo) {
		manmentoringmapper.deleteManMentoring(vo);
		return "redirect:/mentoringList";
	}
}
