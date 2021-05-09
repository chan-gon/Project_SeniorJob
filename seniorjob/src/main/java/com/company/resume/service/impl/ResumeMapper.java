package com.company.resume.service.impl;

import java.util.List;

import com.company.resume.service.ResumeVO;

public interface ResumeMapper {
	//이력서 전체조회
	public List<ResumeVO> getSearchResumeList(ResumeVO vo);
	//이력서 등록
	public int insertResume(ResumeVO vo);
	//이력서 수정
	public int updateResuem(ResumeVO vo);
	//이력서 삭제
	public int deleteResume(ResumeVO vo);
	//이력서 단건 조회
	public ResumeVO getResume(ResumeVO vo);
	
	public int ckReUpdateSom(ResumeVO vo);
	
	public List<ResumeVO> checkR(ResumeVO vo);
	
	public int colReUpdate(ResumeVO vo);
	
	//이력서 개인 목록 조회
	public List<ResumeVO> getSearchResumeListSom(ResumeVO vo);
}
