package com.company.inquire_answer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.inquire.service.Inquire_AnswerVO;
import com.company.inquire_answer.service.impl.Inquire_AnswerMapper;

@Controller
public class Inquire_AnswerController {
@Autowired Inquire_AnswerMapper inquire_AnswerMapper;
	
	@RequestMapping("/getInquire_AnswerList")	//답변 리스트
	public String getInquireList(Model model) {
		model.addAttribute("list", inquire_AnswerMapper.getInquire_AnswerList());
		return "/inquire_answer/getInquire_AnswerList";
	}
	@RequestMapping("/insertInquire_Answer") //답변 등록 폼
	public String insertInquire(Inquire_AnswerVO vo) {
		return "/inquire_answer/insertInquire_Answer";
	}
	@RequestMapping("/insertInquire_AnswerProc") //답변 등록
	public String insertInquireProc(Inquire_AnswerVO vo) {
		inquire_AnswerMapper.insertInquire_Answer(vo);
		return "redirect:/getInquire_AnswerList";
	}
	@RequestMapping("/updateInquire_Answer")	//답변 수정폼
	public String updateInquire(Inquire_AnswerVO vo, Model model) {
		model.addAttribute("list", inquire_AnswerMapper.getInquire_Answer(vo));
		return "/inquire_answer/updateInquire_Answer";
	}
	@RequestMapping("/updateInquire_AnswerProc")	//답변 수정
	public String updateInquireProc(Inquire_AnswerVO vo) {
		inquire_AnswerMapper.updateInquire_Answer(vo);
		return "redirect:/getInquire_AnswerList";
	}
	@RequestMapping("/deleteInquire_Answer")	//답변 삭제
	public String deleteInquire(Inquire_AnswerVO vo) {
		inquire_AnswerMapper.deleteInquire_Answer(vo);
		return "redirect:/getInquire_AnswerList";
	}
}
