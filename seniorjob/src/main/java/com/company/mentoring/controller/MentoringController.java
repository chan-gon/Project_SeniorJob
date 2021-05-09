package com.company.mentoring.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.cart.service.CartService;
import com.company.cart.service.CartVO;
import com.company.mentor.common.Paging;
import com.company.mentor.service.MentorService;
import com.company.mentor.service.MentorVO;
import com.company.mentoring.service.MentoringService;
import com.company.mentoring.service.MentoringVO;
import com.company.mentoring_reviews.service.Mentoring_ReviewsService;
import com.company.mentoring_reviews.service.Mentoring_ReviewsVO;
import com.company.shopping.service.ShoppingService;
import com.company.shopping.service.ShoppingVO;
import com.company.users.service.UsersService;
import com.company.users.service.UsersVO;


@Controller
public class MentoringController {
	
	@Autowired MentorService mentorService;
	@Autowired MentoringService mtService;
	@Autowired UsersService usersService;
	@Autowired ShoppingService shoppingService;
	@Autowired CartService cartService;
	
//	--------------------------------------------------------김찬곤-----------------------------------------------------------------------------------------------------
	@Autowired CartService cartservice;

	//송다희 추가=========================================
	@Autowired Mentoring_ReviewsService mentorservice; 
	//=================================================
	
	// 멘토링 검색
	@RequestMapping("/getMentoringList")
	public String getMentorList(MentoringVO vo, Paging paging, Model model) {
		paging.setPageUnit(5);
		paging.setPageSize(3);
		
		if(vo.getPage() == null) {
			vo.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		paging.setTotalRecord(mtService.getMcount(vo));
		System.out.println("종료일: " + vo.getMentoring_end_date() + "시작일:" + vo.getMentoring_begin_date());
		model.addAttribute("list", mtService.getMentoringList(vo));
		System.out.println("종료일: " + vo.getMentoring_end_date() + "시작일:" + vo.getMentoring_begin_date());
		model.addAttribute("random", mtService.getRandomImage(vo));
		return "Mentoring/mentoringList";
	}
	
	//송다희 추가=============================
	@RequestMapping("/getReviewsList")
	public @ResponseBody List<Mentoring_ReviewsVO> getReviewsList(Mentoring_ReviewsVO vo, Model model) {
		return mentorservice.getReviewsList(vo);
	}
	
	// 멘토링 키워드 검색
	@RequestMapping("/getKeywordMentoring")
	public String getKeywordMentoring(Model model, MentoringVO vo) {
		model.addAttribute("list", mtService.getKeywordMentoring(vo));
		return "Mentoring/mentoringList"; 
	}
	
	// 멘토링 단건조회
	@RequestMapping("/getMentoringChanGon")
	public String getMentoring(@RequestParam String bizno, Model model, MentoringVO mtVo, MentorVO mVo) throws IOException {
		model.addAttribute("mentoring", mtService.getMentoring(mtVo));
		model.addAttribute("mentor",mentorService.getMentor(mVo));
		return "Mentoring/getMentoring";
	}
	
	// 멘토링 등록 페이지
	@RequestMapping("/MentoringRegister")
	public String MentoringRegister(Model model, MentorVO vo) {
		MentorVO mentorRegisterCheck = mentorService.mentorRegisterCheck(vo);
		if(mentorRegisterCheck==null) {
			model.addAttribute("msg", "멘토가 아닙니다. 멘토 등록을 해주세요.");
			model.addAttribute("url", "getMentorList");
			return "common/Fail";
		}else {
			model.addAttribute("mentorInfo", mentorRegisterCheck);
			return "Mentoring/MentoringRegister";
		}
	}
	
	// 멘토링 등록 처리
	@RequestMapping("/mentoringRegisterCheck")
	public String mentoringRegisterCheck(Model model, MentoringVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
			mtService.insertMentoring(vo, request);
			model.addAttribute("msg", "멘토링 등록 완료");
			model.addAttribute("url", "getMentorList");
			return "common/Success";
	}
	
	// 멘토링 미리보기 페이지 호출
	@RequestMapping("/mentoringPreview")
	public String mentoringPreviewForm() {
		return "Mentoring/mentoringPreview";
	}
	
	// 멘토링 미리보기 페이지 호출용
	@RequestMapping("/MentoringRegisterForm")
	public String MentoringRegisterForm() {
		return "Mentoring/MentoringRegister";
	}
	
	// 멘토링 결제페이지
	@RequestMapping("/mentoringPayForm")
	public String mentoringPayForm(Model model, MentoringVO mtrVo, MentorVO mVo, ShoppingVO sVo, CartVO cvo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UsersVO users = (UsersVO) session.getAttribute("users");
		// 송다희 추가
		/*
		 * String del = request.getParameter("cartNo"); cvo.setCart_no(del);
		 * System.out.println(del); model.addAttribute("cart",
		 * cartservice.getCart(cvo);
		 * System.out.println("cart_no:================="+cvo);
		 */
		
		if(users != null) {
			model.addAttribute("users",users); // 세션 정보
			model.addAttribute("mentoring", mtService.getSearchMentoringChanGon(mtrVo)); // 멘토링 정보
			model.addAttribute("mentor", mentorService.getMentor(mVo)); // 멘토 정보
		}else {
			model.addAttribute("msg", "로그인한 사용자만 이용가능합니다.");
			model.addAttribute("url", "getMentoringList");
			return "common/Fail"; 
		}
		
		return "Mentoring/mentoringPayForm";
	}
	
	// 멘토링 결제 처리
	@ResponseBody
	@RequestMapping("/mentoringPayProc")
	public int mentoringPayProc(ShoppingVO vo, CartVO cvo) {
		int result = shoppingService.paymentChk(vo);
		if(result==0) { // 테이블에 값이 없으면(장바구니에 없으면)
			shoppingService.mentoringPayProc(vo); // Insert
			
			/*
			 * //카트 해당 항목 삭제 cartservice.deleteSub(cvo);
			 * System.out.println("====================================cvo:" + cvo);
			 */
			 
			return result;
		}else { // 테이블에 값이 있으면(장바구니에 있으면)
			// Cart 삭제
			shoppingService.mentoringPayProc(vo); // Insert
			return result;
		}
	}
	
	// 결제 완료 페이지 호출
	@RequestMapping("/PaymentSuccessForm")
	public String PaymentSuccess(Model model, ShoppingVO vo) {
		model.addAttribute("shopping", shoppingService.getPayInfo(vo));
		return "Mentoring/PaymentSuccess";
	}
	
	// 멘토링 개수
	@ResponseBody
	@RequestMapping("getMentoringCnt")
	public int getMentoringCnt(MentoringVO vo) {
		int result = mtService.getMentoringCnt(vo);
		return result;
	}
	
	// 멘토링 리스트 윈도우
	@RequestMapping("/mentoringListWindow")
	public String mentoringListWindow(MentoringVO mtVo, MentorVO mVo, Model model) {
		model.addAttribute("mentoring", mtService.getMentoring(mtVo));
		model.addAttribute("mentor",mentorService.getMentor(mVo));
		return "Mentoring/mentoringListWindow";
	}
	
	// 멘토링 단건 조회_김찬곤
	// 송다희 추가
	@RequestMapping("/getSearchMentoringChanGon")
	public String getSearchMentoringChanGon(MentoringVO mtVo,MentorVO mVo, Model model, Mentoring_ReviewsVO reviewvo, HttpServletRequest req) throws IOException {
		model.addAttribute("mentoring", mtService.getSearchMentoringChanGon(mtVo)); // 멘토링 정보
		model.addAttribute("mentor",mentorService.getMentor(mVo)); // 멘토 정보
		model.addAttribute("relatedMentoring", mtService.getRelatedMentoring(mtVo)); // 유사한 멘토링
		
		//송다희 추가====================================================================
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");  //로그인 시 session에 저장된 id값을 꺼내옴.
		reviewvo.setId(id);
		model.addAttribute("reviewList", mentorservice.getReviewsList(reviewvo));
		System.out.println(reviewvo);
		//크롤링
		String uri = "https://comento.kr/edu/learn/%EC%97%B0%EA%B5%AC%EA%B0%9C%EB%B0%9C/%EC%97%B0%EA%B5%AC%EA%B0%9C%EB%B0%9C-G165";
		Document doc = Jsoup.connect(uri).get();
		Elements element = doc.select(".edu-detail--summary");
		
		System.out.println(doc.toString());
		model.addAttribute("biz", element);

		return "Mentoring/getMentoring";
	}
	
//	--------------------------------------------------------End of 김찬곤-----------------------------------------------------------------------------------------------------
	
	//양소민 추가
	@GetMapping("/getMyMentoringListSom")   //마이페이지_내가 만든 멘토링
	public String getSearchMentoring(MentoringVO vo, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");  //로그인 시 session에 저장된 id값을 꺼내옴.
		vo.setId(id);									
		model.addAttribute("list", mtService.getMyMentoringListSom(vo)); 
		return "mypage/mentoringCourse";
	}
	
	@RequestMapping("/requestMentoring")   //멘토링 일정 요청 
	public String requestMentoring(String mentorid, String menteeid, String schedule_name, Model model) {
		model.addAttribute("mentorid", mentorid);
		model.addAttribute("menteeid", menteeid);
		model.addAttribute("schedule_name", schedule_name);
		
		return "mypage/mentoringRequest";
	}
	
	@GetMapping("/getMentoring") //멘토링 상세 페이지
	public String getMentoring(MentoringVO vo, Model model) {
		model.addAttribute("md", mtService.getMentoring(vo));
		return "Mentoring/getMentoring";
	}
	
	@GetMapping("updateMentoringForm") //멘토링 수정 페이지로 이동
	public String updateMentoringForm(Model model, MentoringVO vo) {
		mtService.getMentoringDetail(vo);
		model.addAttribute("menDetail", mtService.getMentoringDetail(vo));
		
		return "/Mentoring/updateMentoringForm";
		
	}
	
	@PostMapping("/updateMentoring") //멘토링 수정 처리
	public String updateMentoring(MentoringVO vo, HttpServletRequest request) {
		mtService.updateMentoring(vo);
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");  //로그인 시 session에 저장된 id값을 꺼내옴.
		vo.setId(id);
		return "redirect:/getMyMentoringListSom";
		
	}
	
	@GetMapping("/menteeList")
	public String menteeList(MentoringVO vo, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");  //로그인 시 session에 저장된 id값을 꺼내옴.
		vo.setId(id);
		model.addAttribute("list", mtService.getSearchMentoring(vo));
		return "/Mentoring/menteeList";
	}
	
	
}
