package com.company.manager.mentoring.service.impl;

import java.util.List;

import com.company.manager.mentoring.manMentoringVO;
import com.company.manager.utils.ManSearchCriteria;

public interface manMentoringMapper {
	//페이징 처리 및 멘토링 전체 조회
	public List<manMentoringVO> mentoringList(ManSearchCriteria scri);
	//멘토링 게시물 총갯수
	public int mentoringCount(ManSearchCriteria scri);
	//멘토링 게시글 검색 
	public List<manMentoringVO> searchMentoring(String searchKeyword);
	//멘토링 단건 조회
	public List<manMentoringVO> getManMentoringList(manMentoringVO vo);
	//멘토링 삭제
	public int deleteManMentoring(manMentoringVO vo);
	
}
