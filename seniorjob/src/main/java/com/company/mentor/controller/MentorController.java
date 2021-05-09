package com.company.mentor.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.following.service.FollowService;
import com.company.following.service.FollowingVO;
import com.company.mentor.service.MentorSearchVO;
import com.company.mentor.service.MentorService;
import com.company.mentor.service.MentorVO;
import com.company.mentoring.service.MentoringService;

@Controller
public class MentorController {
	
	@Autowired MentorService mentorService;
	@Autowired MentoringService mentoringService;
	@Autowired FollowService followService;
	
//	--------------------------------------------------------김찬곤-----------------------------------------------------------------------------------------------------
	
		// 로그인, 회원가입 미비 시 호출되는 페이지
		// 로그아웃 상태에서 멘토등록 클릭하면 호출
		@RequestMapping("loginCheckAlert")
		public String loginCheckAlert() {
			return "Mentor/loginCheckAlert";
		}
		
		// 멘토 리스트 페이지 호출
		@RequestMapping("/getMentorList")
		public String MentorList(Model model,MentorVO vo) {
			model.addAttribute("list", mentorService.getMentorList(vo));
			return "Mentor/mentorList";
		}
		
		// 메인페이지 키워드 검색
		@RequestMapping("/getKeywordSearch")
		public String getKeywordSearch(Model model, MentorVO vo) {
			model.addAttribute("list", mentorService.getKeywordSearch(vo));
			return "Mentor/mentorList";
		}
		
		// 메인페이지 직무 검색
		@RequestMapping("getSearchMentorDuty")
		public String getSearchMentorDuty(MentorVO vo, Model model) {
			model.addAttribute("list", mentorService.getSearchMentorDuty(vo));
			return "Mentor/mentorList";
		}
		
		// 멘토 등록 페이지 호출
		@RequestMapping("/mentorRegisterCheck")
		public String MentorRegister(Model model, MentorVO vo) {
			MentorVO mentorCheck = mentorService.mentorRegisterCheck(vo); // 멘토 등록 여부 확인
			if(mentorCheck != null) {
				model.addAttribute("msg", "이미 멘토로 등록하셨습니다. 마이페이지를 확인하세요.");
				model.addAttribute("url", "getMentorList");
				return "common/Fail"; // 이미 멘토 등록되어 있으면 해당 주소로 리턴
			}
			return "Mentor/mentorRegister";
		}
		
		// 멘토 등록 요청
		@RequestMapping("/MentorRegisterProc") // RequestMapping 설정만 해도 GET,POST 둘 다 사용가능
		public String MentorRegisterProc(Model model, MentorVO vo, HttpServletRequest request) throws Exception {
			MentorVO mentorCheck = mentorService.mentorRegisterCheck(vo); // 멘토 등록 여부 확인
			if(mentorCheck != null) {
				model.addAttribute("msg", "이미 멘토로 등록하셨습니다. 마이페이지를 확인하세요.");
				model.addAttribute("url", "getMentorList");
				return "common/Fail"; // 이미 멘토 등록되어 있으면 해당 주소로 리턴
			}else if(mentorCheck == null) {
				System.out.println("MentorRegisterProc:"+vo);
					mentorService.MentorRegisterProc(vo, request);
					System.out.println("MentorRegisterProc2:"+vo);
					model.addAttribute("msg", "멘토 등록 완료");
					model.addAttribute("url", "getMentorList");
					return "common/Success";
				}else {
					// 멘토 등록 오류 발생 시 해당 페이지로 리턴
					// 오류 발생 조건: 빈칸 제출
					model.addAttribute("msg", "멘토 등록 처리 실패. 다시 작성 해주세요.");
					model.addAttribute("url", "getMentorList");
					return "common/Fail"; 
				}
			}
		
		// 멘토 상세 페이지 호출
		@RequestMapping("/getMentor")
		public String getMentor(Model model, MentorVO mVo, FollowingVO fVo, HttpServletRequest req) {
			HttpSession session = req.getSession();
			String id = (String) session.getAttribute("id");
			
			if(id == null) {
				model.addAttribute("mentor", mentorService.getMentor(mVo));
				return "Mentor/getMentor";
			}else {
				fVo.setId(id);
				model.addAttribute("following", followService.getMentorFollowing(fVo));
				model.addAttribute("mentor", mentorService.getMentor(mVo));
				return "Mentor/getMentor";
			}
		}
		
		// 멘토 세부검색(최신순, 인기순)
		@ResponseBody
		@RequestMapping("/optionValueChk")
		public Map<String, Object> optionValueChk(MentorSearchVO vo) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			if(vo.getOptionValue().equals("최신순")) {
				List<MentorVO> list = mentorService.getMentorByDate(vo);
				map.put("list", list);
			}
			else if(vo.getOptionValue().equals("인기순")) {
				List<MentorVO> list = mentorService.getMentorByFollow(vo);
				map.put("list", list);
			}
			else if(vo.getOptionValue().equals("")) {
				List<MentorVO> list = mentorService.getMentorList(vo);
				map.put("list", list);
			}
			return map;
		}
//		--------------------------------------------------------End of 김찬곤-----------------------------------------------------------------------------------------------------		
}
