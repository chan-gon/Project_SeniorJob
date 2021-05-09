package com.company.following.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.following.service.FollowService;
import com.company.following.service.FollowingVO;
import com.company.mentor.service.MentorService;
import com.company.mentor.service.MentorVO;

@Controller
public class FollowingController {

	@Autowired FollowService followService;
	@Autowired MentorService mentorService;

//	--------------------------------------------------------김찬곤-----------------------------------------------------------------------------------------------------
	//팔로우 목록
	@RequestMapping("/following")
	public String following(HttpServletRequest req, FollowingVO vo, Model model) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		model.addAttribute("list", followService.getMentorList(vo));
		return "following";				  
	}
	
	// 멘토 팔로우
	@ResponseBody
	@RequestMapping("/mentorFollowCheck")
	public int mentorFollowCheck(FollowingVO fVo, MentorVO mVo) {
		int result = followService.mentorFollowCheck(fVo);
		if(result == 0) {
			followService.MentorFollow(fVo);
			String mentor_id = "41";
			mVo.setMentor_id(mentor_id);
			mentorService.getUpdateFNumPlus(mVo); // 멘토 테이블 멘토 팔로우 숫자 증가
			return result;
		}else {
			return result;
		}
	}
	// 멘토 팔로우 취소
	@ResponseBody
	@RequestMapping("/deleteMentorFollow")
	public int deleteMentorFollow(FollowingVO fVo, MentorVO mVo) {
		int result = followService.deleteMentorFollow(fVo);
		mentorService.getUpdateFNumMinus(mVo); // 멘토 테이블 멘토 팔로우 숫자 차감
		return result;
	}
	
	// 멘토 팔로우 카운트
	@ResponseBody
	@RequestMapping("getFollowCnt")
	public int getFollowCnt(FollowingVO vo) {
		int result = followService.getFollowCnt(vo);
		return result;
	}
	
	// 단건 조회
	@ResponseBody
	@RequestMapping("getMentorFollowing")
	public FollowingVO getMentorFollowing(FollowingVO vo) {
		FollowingVO result = followService.getMentorFollowing(vo);
		if(result != null) {
			return result;
		}else {
			return null;
		}
	}
//	--------------------------------------------------------End of 김찬곤-----------------------------------------------------------------------------------------------------	
	
	
}