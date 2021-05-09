package com.company.manager.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.company.manager.user.userVO;
import com.company.manager.user.service.impl.manUserMapper;
import com.company.manager.utils.ManPageMaker;
import com.company.manager.utils.ManSearchCriteria;
import com.company.mentor.service.MentorVO;
import com.company.mentor.service.impl.MentorMapper;


@Controller
public class manUserController {
	
	@Autowired manUserMapper manusermapper;
	@Autowired MentorMapper mentormapper;
	
	// 게시판 목록 조회(페이징)
		@RequestMapping("/userList")
		public String list(Model model, @ModelAttribute("scri") ManSearchCriteria scri) {

			model.addAttribute("viewAll", manusermapper.userList(scri));

			ManPageMaker pageMaker = new ManPageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(manusermapper.userCount(scri));

			model.addAttribute("pageMaker", pageMaker);

			return "/manager/user"; 
		}
		
		
	// 검색
	@RequestMapping("/ManSearchService")
	public String searchService(Model model, @RequestParam(value="searchKeyword", required=false) String searchKeyword) {
		List<userVO> list = manusermapper.searchUser(searchKeyword);
		model.addAttribute("list", list);
		return "/manager/user";
	
	}
	
	//회원 단건 조회
	@ResponseBody
	@RequestMapping("/getUserList")
	public List<userVO> getUserList(userVO vo) {
		return manusermapper.getUserList(vo);
	
	}
		
	//회원 수정 처리
	@RequestMapping("/updateUserProc")
	public String updateUserProc(userVO vo) {
		System.out.println("vo:"+ vo);
		manusermapper.updateUserProc(vo);
		return "redirect:/userList";
	}
	
	//회원 삭제
	@ResponseBody
	@RequestMapping("/deleteUser")
	public String deleteUser(userVO vo) {
		manusermapper.deleteUser(vo);
		return "redirect:/userList";
		
	}
	
	//회원 승급
	
	@RequestMapping(value={"/authUser","/authMento"})
	public String authUser(userVO vo,MentorVO mvo) {
		manusermapper.authUser(vo);
		mentormapper.authMento(mvo);
		return "manager/user";

	}
	
	//회원 강등
	
	@RequestMapping(value={"/authDownUser", "authDownMentor"})
	public String authDownUser(userVO vo, MentorVO mvo) {
		manusermapper.authDownUser(vo);
		mentormapper.authDownMento(mvo);
		return "manager/user";

	}
	//mentor 신청 대기자 수
	@ResponseBody
	@RequestMapping("/mentorSys")
	public List<Map<String,Object>> mentorSys(){
		return manusermapper.mentorSys();
	}
	
	
}