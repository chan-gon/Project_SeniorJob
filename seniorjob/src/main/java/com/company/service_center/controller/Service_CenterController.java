package com.company.service_center.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

import com.company.service_center.PageMaker;
import com.company.service_center.SearchCriteria;
import com.company.service_center.service.Service_CenterVO;
import com.company.service_center.service.impl.Service_CenterMapper;

@Controller
public class Service_CenterController {
	@Autowired
	Service_CenterMapper service_CenterMapper;

//	--------------------------------------------------------공지사항-----------------------------------------------------------------------------------------------------
	// 게시판 목록 조회(공지사항)
	@RequestMapping("/serviceCenter")
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) {
		
		
		if(scri.getOptionValue()!="최신순" && scri.getOptionValue()!="인기순") {
			model.addAttribute("list", service_CenterMapper.list(scri));
			System.out.println("============================ssqq===========================");
			System.out.println(scri.getOptionValue());
		}else if(scri.getOptionValue().equals("최신순")) {
			System.out.println("============================ssqq1===========================");
			model.addAttribute("list", service_CenterMapper.listDate(scri));
			System.out.println(scri.getOptionValue());
		}else if(scri.getOptionValue().equals("인기순")) {
			System.out.println("============================ssqq2===========================");
			model.addAttribute("list", service_CenterMapper.listClick(scri));
			System.out.println(scri.getOptionValue());
		}
		//model.addAttribute("list", service_CenterMapper.list(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service_CenterMapper.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "/Service_Center/serviceCenter"; // 공지사항
	}

	@RequestMapping("/getService_Center") // 공지사항 단건조회
	public String getService_CenterList(Model model, Service_CenterVO vo) {
		model.addAttribute("gongji", service_CenterMapper.getService_Center(vo));
		service_CenterMapper.updateClick(vo); // 조회수 증가

		model.addAttribute("num", service_CenterMapper.preNext(vo));
		service_CenterMapper.preNext(vo); // 게시글 이전/다음
		return "/Service_Center/getService_Center";
	}

	// 검색(공지사항)
	@RequestMapping("/searchService")
	public String searchService(Model model, @RequestParam("searchKeyword") String searchKeyword) {
		List<Service_CenterVO> list = service_CenterMapper.searchService(searchKeyword);
		model.addAttribute("list", list);
		return "/Service_Center/searchService";
	}

	@RequestMapping("/insertService_CenterForm") // 공지사항 등록폼
	public String insertService_Center(Service_CenterVO vo) {
		return "/Service_Center/insertService_CenterForm";
	}

	@RequestMapping("/insertService_Center") // 공지사항 등록
	public String insertService_CenterProc(Service_CenterVO vo,HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		service_CenterMapper.insertService_Center(vo);
		return "redirect:/serviceCenter";
	}

	@RequestMapping("/updateService_CenterForm") // 공지사항 수정폼
	public String updateService_Center(Service_CenterVO vo, Model model) {
		model.addAttribute("list", service_CenterMapper.getService_Center(vo));
		return "/Service_Center/updateService_CenterForm";
	}

	@RequestMapping("/updateService_Center") // 공지사항 수정
	public String updateService_CenterProc(Service_CenterVO vo) {
		service_CenterMapper.updateService_Center(vo);
		return "redirect:/serviceCenter";
	}

	@RequestMapping("/deleteService_Center") // 공지사항 삭제
	public String deleteService_Center(Service_CenterVO vo) {
		service_CenterMapper.deleteService_Center(vo);
		return "redirect:/serviceCenter";
	}

//	--------------------------------------------------------faq-----------------------------------------------------------------------------------------------------
	@RequestMapping("serviceCenterQna") // 결제/환불 목록 조회
	public String listQna(Model model, @ModelAttribute("scri") SearchCriteria scri) {

		if(scri.getOptionValue()==null || scri.getOptionValue()=="" ) {
			model.addAttribute("list", service_CenterMapper.listQna(scri));
			System.out.println("============================ssqq===========================");
			System.out.println(scri.getOptionValue());
		}else if(scri.getOptionValue().equals("결제")) {
			System.out.println("============================ssqq1===========================");
			model.addAttribute("list", service_CenterMapper.listQnaPayment(scri));
			System.out.println(scri.getOptionValue());
		}else if(scri.getOptionValue().equals("환불")) {
			System.out.println("============================ssqq2===========================");
			model.addAttribute("list", service_CenterMapper.listQnaRefund(scri));
			System.out.println(scri.getOptionValue());
		}else if(scri.getOptionValue().equals("신청")) {
			System.out.println("============================ssqq2===========================");
			model.addAttribute("list", service_CenterMapper.listQnaRequest(scri));
			System.out.println(scri.getOptionValue());
		}else if(scri.getOptionValue().equals("취소")) {
			System.out.println("============================ssqq2===========================");
			model.addAttribute("list", service_CenterMapper.listQnaCancle(scri));
			System.out.println(scri.getOptionValue());
		}else if(scri.getOptionValue().equals("기타")) {
			System.out.println("============================ssqq2===========================");
			model.addAttribute("list", service_CenterMapper.listQnaGita(scri));
			System.out.println(scri.getOptionValue());
		}

		PageMaker pageMaker = new PageMaker(); // 페이징
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service_CenterMapper.listCountQna(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "/Service_Center/qna/serviceCenterQna";
	}

	@RequestMapping("/getService_CenterQna") // 결제환불 단건조회
	public String getService_CenterListQna(Model model, Service_CenterVO vo) {
		model.addAttribute("gongji", service_CenterMapper.getService_CenterQna(vo));
		service_CenterMapper.updateClick(vo); // 조회수 증가

		model.addAttribute("num", service_CenterMapper.preNextQna(vo));
		service_CenterMapper.preNextQna(vo); // 게시글 이전/다음
		return "/Service_Center/qna/getService_CenterQna";
	}

	@RequestMapping("/insertService_CenterFormQna") // 결제환불 등록폼
	public String insertService_CenterQna(Service_CenterVO vo) {
		return "/Service_Center/qna/insertService_CenterFormQna";
	}

	@RequestMapping("/insertService_CenterQna") // 결제환불 등록
	public String insertService_CenterProcQna(Service_CenterVO vo,HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		service_CenterMapper.insertService_CenterQna(vo);
		return "redirect:/serviceCenterQna";
	}

	@RequestMapping("/updateService_CenterFormQna") // 결제환불 수정폼
	public String updateService_CenterQna(Service_CenterVO vo, Model model) {
		model.addAttribute("list", service_CenterMapper.getService_CenterQna(vo));
		return "/Service_Center/qna/updateService_CenterFormQna";
	}

	@RequestMapping("/updateService_CenterQna") // 결제환불 수정
	public String updateService_CenterProcQna(Service_CenterVO vo) {
		service_CenterMapper.updateService_CenterQna(vo);
		return "redirect:/serviceCenterQna";
	}

	@RequestMapping("/deleteService_CenterQna") // 결제환불 삭제
	public String deleteService_CenterQna(Service_CenterVO vo) {
		service_CenterMapper.deleteService_Center(vo);
		return "redirect:/serviceCenterQna";
	}


	// ==================================고객센터 main=============================
	@RequestMapping("/inquire")
	public String serviceCenterMain(Model model, @ModelAttribute("scri") SearchCriteria scri) {
		
		return "/inquire";
	}
	@RequestMapping("/serviceCenterMain2")
	public String serviceCenterMain2() {
		return "/Service_Center/qna/serviceCenterMain2";

	}
}
