package com.company.mentoring_reviews.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;

import com.company.mentoring_reviews.service.MenSearchCriteria;
import com.company.mentoring_reviews.service.Mentoring_ReviewsVO;
import com.company.mentoring_reviews.service.PagingMaker;
import com.company.mentoring_reviews.service.impl.Mentoring_ReviewsMapper;

@Controller
public class Mentoring_ReviewsController {

	@Autowired
	Mentoring_ReviewsMapper mentoring_ReviewsMapper;

	// 게시판 목록 조회(공지사항)
	@RequestMapping("/mentoringReviews")
	public String list(Model model, @ModelAttribute("scri") MenSearchCriteria scri) {

		model.addAttribute("list", mentoring_ReviewsMapper.list(scri));

		PagingMaker pagingMaker = new PagingMaker();
		pagingMaker.setCri(scri);
		pagingMaker.setTotalCount(mentoring_ReviewsMapper.listCount(scri));

		model.addAttribute("pagingMaker", pagingMaker);

		return "/mentoringReviews/mentoringReviews"; // 공지사항
	}

	@RequestMapping("/getSearchMenReview") // 후기 리스트 (단건조회)
	public String getSearchMenReview(Mentoring_ReviewsVO vo, Model model) {
		model.addAttribute("menslist", mentoring_ReviewsMapper.getSearchMenReview(vo));
		mentoring_ReviewsMapper.upnumMenReview(vo); // 조회수 증가

		model.addAttribute("mennum", mentoring_ReviewsMapper.menPreNext(vo));
		mentoring_ReviewsMapper.menPreNext(vo); // 게시글 이전/다음

		return "/mentoringReviews/getSearchMenReview";
	}

	// 검색(공지사항)
	@RequestMapping("/searchMenService")
	public String searchMenService(Model model, @RequestParam("searchKeyword") String searchKeyword) {
		List<Mentoring_ReviewsVO> list = mentoring_ReviewsMapper.searchMenService(searchKeyword);
		model.addAttribute("list", list);
		return "/mentoringReviews/searchMenService";
	}

	@RequestMapping("/insertMenReviews") // 후기 등록
	public String insertMenReviews(Mentoring_ReviewsVO vo) {
		return "/mentoringReviews/insertMenReviews";
	}

	@RequestMapping("/insertMenReviewsProc") // 후기 등록 프록
	public String insertMentoring_ReviewsProc(Mentoring_ReviewsVO vo) {
		mentoring_ReviewsMapper.insertMenReview(vo);
		return "redirect:/mentoringReviews";
	}

	@RequestMapping("/updateMenReviews") // 후기 수정
	public String updateMenReviews(Mentoring_ReviewsVO vo, Model model) {
		model.addAttribute("menslist", mentoring_ReviewsMapper.getSearchMenReview(vo));
		return "/mentoringReviews/updateMenReviews";
	}

	@RequestMapping("/updateMenReviewsProc") // 후기 수정 프록
	public String updateMentoring_ReviewsProc(Mentoring_ReviewsVO vo) {
		mentoring_ReviewsMapper.updateMenReview(vo);
		return "redirect:/mentoringReviews";
	}

	@RequestMapping("/deleteMenReviews") // 후기 삭제
	public String deleteMentoring_Reviews(Mentoring_ReviewsVO vo, Model model) {
		mentoring_ReviewsMapper.deleteMenReview(vo);

		return "redirect:/mentoringReviews";
	}

	// 인기 조회수 후기 페이지 띄우기_김찬곤
	@ResponseBody
	@RequestMapping("/getPopularArticleList")
	public List<Mentoring_ReviewsVO> getPopularArticleList(Mentoring_ReviewsVO vo) {
		List<Mentoring_ReviewsVO> list = mentoring_ReviewsMapper.getPopularArticleList(vo);
		return list;
	}

	// 송다희 추가
	// 멘토링 후기 등록
	@RequestMapping("/searchShopping")
	public @ResponseBody int searchShopping(Mentoring_ReviewsVO vo, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		int result = mentoring_ReviewsMapper.searchShopping(vo); 
		if (result == 1) { 
			mentoring_ReviewsMapper.insertReviewsMen(vo); 
			return result; 
		} else { 
			return  result; 
		} 
	}
	//후기 삭제
	@RequestMapping("/deleteReviews")
	@ResponseBody
	public String deleteReviews(Mentoring_ReviewsVO vo) {
		mentoring_ReviewsMapper.deleteReviews(vo);
		return "redirect:/getSearchMentoringChanGon";
	}
	//후기 수정
	@RequestMapping("/updateReviews")
	public String updateReviews(Mentoring_ReviewsVO vo) {
		mentoring_ReviewsMapper.updateReviews(vo);
		return "redirect:/getSearchMentoringChanGon";
	}
	
	//단건조회(수정폼 호출)
	@RequestMapping("/getReviewsUp")
	public String getReviewsUp(Mentoring_ReviewsVO vo, Model model) {
		model.addAttribute("review", mentoring_ReviewsMapper.getReviewsUp(vo));
		return "mentoringReviews/updateMenReviews";
	}
	
	//후기글 하나 이상 못 올리게 확인
	@RequestMapping("/getReviewOne")
	public @ResponseBody int getReviewOne(Mentoring_ReviewsVO vo, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		int result = mentoring_ReviewsMapper.getReviewOne(vo);
		if (result >= 1) {  
			return result; 
		}
		return result;
	}

}
