package com.company.resume.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.company.certificate.service.CertificateVO2;
import com.company.portfolio.service.PortfolioVO;
import com.company.self_info.service.Self_InfoVO;

public interface ResumeService {
	//이력서 전체조회
	public List<ResumeVO> getSearchResumeList(ResumeVO vo);
	//이력서 등록
	public void insertResume(ResumeVO vo, List<CertificateVO2> clist, List<Self_InfoVO> slist, PortfolioVO portvo, HttpServletRequest req) throws IllegalStateException, IOException;
	//이력서 수정
	public void updateResuem(ResumeVO vo, List<CertificateVO2> clist, List<Self_InfoVO> slist, PortfolioVO portvo, HttpServletRequest req) throws IllegalStateException, IOException;
	//이력서 삭제
	public int deleteResume(ResumeVO vo);
	//이력서 단건 조회
	public ResumeVO getResume(ResumeVO vo);
	
	public int ckReUpdateSom(ResumeVO vo);
	
	public List<ResumeVO> checkR(ResumeVO vo);
	
	public int colReUpdate(ResumeVO vo);
}
