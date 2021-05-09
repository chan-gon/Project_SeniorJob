package com.company.resume.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.businesspalna.service.BusinessPlanAService;
import com.company.certificate.service.CertificateVO2;
import com.company.certificate.service.impl.CertificateMapper;
import com.company.mentor.service.MentorService;
import com.company.mentor.service.MentorVO;
import com.company.mentoring.service.MentoringService;
import com.company.mentoring.service.MentoringVO;
import com.company.portfolio.service.PortfolioVO;
import com.company.portfolio.service.impl.PortfolioMapper;
import com.company.resume.service.ResumeRequestVO;
import com.company.resume.service.ResumeService;
import com.company.resume.service.ResumeVO;
import com.company.resume.service.impl.ResumeMapper;
import com.company.schedule.service.ScheduleVO;
import com.company.schedule.service.impl.ScheduleMapper;
import com.company.self_info.service.Self_InfoVO;
import com.company.self_info.service.impl.Self_InfoMapper;
import com.company.users.service.UsersVO;
import com.company.users.service.impl.UsersMapper;

@Controller
public class ResumeController {

	@Autowired
	ResumeService resumeservice;
	@Autowired
	ResumeMapper resumemapper;
	@Autowired
	Self_InfoMapper selfmapper;
	@Autowired
	PortfolioMapper portmapper;
	@Autowired
	CertificateMapper certimapper;
	@Autowired
	BusinessPlanAService bpService;
	@Autowired
	MentorService mtService;
	@Autowired
	UsersMapper usersmapper;
	@Autowired ScheduleMapper sdMapper;

	
	// 이력서 전체조회
	@RequestMapping("/getSearchResumeList")
	public String getSearchResumeList(Model model, HttpServletRequest req, ResumeVO vo) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		model.addAttribute("list", resumemapper.getSearchResumeList(vo));
		return "resume/resumeList";
	}
	
	//이력서 전체조회 팝업(멘티가 멘토링 요청 승낙 시 선택하는 창)
	@RequestMapping("/popResumeList")
	public String popResumeList(Model model, HttpServletRequest req, ResumeVO vo, String seq) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		System.out.println("popResume"+id+","+vo.getId());
		model.addAttribute("list", resumemapper.getSearchResumeListSom(vo));
		model.addAttribute("seq", seq);
		return "resume/popResumeList";
	}
	
	//이력서 단건조회
	@RequestMapping("/resumeGetForm")
	public String resumeGetForm(Model model, ResumeVO vo, Self_InfoVO selfvo, CertificateVO2 certivo,
			PortfolioVO portvo) {
		vo = resumemapper.getResume(vo);
		model.addAttribute("resumeVO", vo);
		selfvo.setResume_no(vo.getResume_no()); // resume 테이블의 resume_no라는 거 명시
		model.addAttribute("slist", selfmapper.getSelf(selfvo));
		certivo.setResume_no(vo.getResume_no());
		model.addAttribute("clist", certimapper.getCerti(certivo));
		portvo.setResume_no(vo.getResume_no());
		model.addAttribute("plist", portmapper.getPort(portvo));
		return "resume/resumeUpdate";
	}
	
	//이력서 팝업조회
		@RequestMapping("/popResumeGetForm")
		public String popResumeGetForm(Model model, ResumeVO vo, Self_InfoVO selfvo, CertificateVO2 certivo,
				PortfolioVO portvo) {
			vo = resumemapper.getResume(vo);
			model.addAttribute("resumeVO", vo);
			selfvo.setResume_no(vo.getResume_no()); // resume 테이블의 resume_no라는 거 명시
			model.addAttribute("slist", selfmapper.getSelf(selfvo));
			certivo.setResume_no(vo.getResume_no());
			model.addAttribute("clist", certimapper.getCerti(certivo));
			portvo.setResume_no(vo.getResume_no());
			model.addAttribute("plist", portmapper.getPort(portvo));
			return "resume/popResumeGetForm";
		}

	// 이력서 등록폼
	@RequestMapping("/resumeInsertForm")
	public String resumeInsertForm(UsersVO uservo, Model model, ResumeVO vo, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		uservo.setId(id);
		model.addAttribute("user", usersmapper.getUsers(uservo));
		return "resume/resumeInsert";
	}

	// 이력서 등록
	@RequestMapping("/resumeInsert")
	public String resumeInsert(HttpServletRequest req, ResumeVO vo, ResumeRequestVO reqvo, 
			PortfolioVO portvo, Model model) throws Exception {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		resumeservice.insertResume(vo, reqvo.getClist(), reqvo.getSlist(), portvo, req);
		model.addAttribute("msg", "등록완료");
		model.addAttribute("url", "throughCerti");
		return "common/Success";
	}
	
	// 이력서 수정
	@PostMapping("/resumeUpdate")
	public String resumeUpdate(HttpServletRequest req, ResumeVO vo, ResumeRequestVO reqvo,
			PortfolioVO portvo, ScheduleVO sVo) throws Exception {
	HttpSession session = req.getSession();
	String id = (String) session.getAttribute("id");
	vo.setId(id);
	sVo.setOldResumeNo(vo.getResume_no());
	System.out.println("resumeUpdate:"+sVo.getOldResumeNo());
	resumeservice.updateResuem(vo, reqvo.getClist(), reqvo.getSlist(), portvo, req);
	sVo.setResume_no(vo.getResume_no());
	System.out.println("resumeUpdate:"+sVo.getResume_no());
	sdMapper.renameResumeNo(sVo);
	System.out.println("resumeUpdate:"+sVo);
	return "redirect:/getSearchResumeList";
	}

	// 이력서 수정폼
	@RequestMapping("/resumeUpdateForm")
	public String resumeUpdateForm(Model model, ResumeVO vo, Self_InfoVO selfvo, CertificateVO2 certivo,
			PortfolioVO portvo) {
		vo = resumemapper.getResume(vo);
		model.addAttribute("resumeVO", vo);
		selfvo.setResume_no(vo.getResume_no()); // resume 테이블의 resume_no라는 거 명시
		model.addAttribute("slist", selfmapper.getSelf(selfvo));
		certivo.setResume_no(vo.getResume_no());
		model.addAttribute("clist", certimapper.getCerti(certivo));
		portvo.setResume_no(vo.getResume_no());
		model.addAttribute("plist", portmapper.getPort(portvo));
		return "resume/resumeUpdate";
	}

	// 이력서 워드폼
	@RequestMapping("/resumeWord")
	public String resumeWord(Model model, ResumeVO vo, Self_InfoVO selfvo, CertificateVO2 certivo, PortfolioVO portvo) {
		vo = resumemapper.getResume(vo);
		model.addAttribute("resumeVO", vo);
		selfvo.setResume_no(vo.getResume_no()); // resume 테이블의 resume_no라는 거 명시
		model.addAttribute("slist", selfmapper.getSelf(selfvo));
		certivo.setResume_no(vo.getResume_no());
		model.addAttribute("clist", certimapper.getCerti(certivo));
		portvo.setResume_no(vo.getResume_no());
		model.addAttribute("portvo", portmapper.getPort(portvo));
		return "resume/resumeWord";
	}

	// 이력서 삭제
	@PostMapping("/resumeDelete")
	public String resumeDelete(ResumeVO vo) {
		System.out.println(vo);
		resumemapper.deleteResume(vo);
		return "redirect:/getSearchResumeList";
	}

	// 이력서 단건 조회
	@RequestMapping("/getResume")
	public String getResume(Model model, ResumeVO vo, Self_InfoVO selfvo, PortfolioVO portvo, CertificateVO2 certivo) {
		model.addAttribute("resumeVO", resumemapper.getResume(vo));
		model.addAttribute("selfvo", selfmapper.getSelf(selfvo));
		model.addAttribute("portvo", portmapper.getPort(portvo));
		model.addAttribute("certivo", certimapper.getCerti(certivo));
		return "resume/resumeList";
	}
	
	// 미리보기
	@RequestMapping("/preview")
	public String preview() {
		return "resume/preview";
	}

	// 첨삭
	@RequestMapping("/collection")
	public String collection(Model model, ResumeVO vo, Self_InfoVO selfvo, CertificateVO2 certivo, PortfolioVO portvo) {
		vo = resumemapper.getResume(vo);
		model.addAttribute("resumeVO", vo);
		model.addAttribute("selfvo", selfmapper.getSelf(selfvo));
		model.addAttribute("certivo", certimapper.getCerti(certivo));
		model.addAttribute("portvo", portmapper.getPort(portvo));
		return "resume/collection"; 
	}
	
	//첨삭요청 팝업창
	@GetMapping("/checkReForm")
	public String checkReForm(MentoringVO vo, Model model, HttpServletRequest request,String resume_no) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		vo.setMenteeId(id);
		model.addAttribute("ck", bpService.ckMenName(vo));
		model.addAttribute("resume_no", resume_no);
		return "/resume/checkReForm";
	}
	
	//첨삭 요청하면 이력서에 멘토 아이디 추가
	@PostMapping("/ckReUpdateSom")
	public String ckReUpdateSom(ResumeVO vo) {
		System.out.println("resumevo:"+vo);
		resumeservice.ckReUpdateSom(vo);
		
		return "/users/throughCerti";
		
	}
	
	//이력서 첨삭요청 목록
	@GetMapping("/checkR")
	public String checkR(ResumeVO vo, MentorVO mvo, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		mvo.setId(id);
		String mId = mtService.getMentorId(mvo);
		System.out.println("mId:"+mId);
		vo.setMentorId(mId);
		model.addAttribute("list", resumeservice.checkR(vo));
		
		return "/Mentor/checkR";
	}
	
	//첨삭 등록
	@RequestMapping("/colReUpdate")
	public String colReUpdate(ResumeVO vo, Model model) {
		System.out.println("vo:"+vo);
		resumeservice.colReUpdate(vo);
		
		model.addAttribute("msg", "첨삭 등록이 완료되었습니다.");
		model.addAttribute("url", "mypageHome");
		return "common/Success";
	}
	
	//첨삭보기
	@GetMapping("/seeCkRe")
	public String seeCkRe(Model model, ResumeVO vo, Self_InfoVO selfvo, CertificateVO2 certivo, PortfolioVO portvo) {
		model.addAttribute("resumeVO", resumemapper.getResume(vo));
		model.addAttribute("selfvo", selfmapper.getSelf(selfvo));
		model.addAttribute("certivo", certimapper.getCerti(certivo));
		model.addAttribute("portvo", portmapper.getPort(portvo));
		return "resume/seeCkRe";
	}
	//영상통화
	@RequestMapping("/videoIn")
	public String videoIn() {
		return "videoIn";
	}
	
	//영상통화
	@RequestMapping("/calleer")
	public String calleer() {
		return "videos/caller";
	}
}
