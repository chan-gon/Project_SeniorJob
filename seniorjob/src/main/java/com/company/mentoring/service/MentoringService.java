package com.company.mentoring.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface MentoringService {
	
//	--------------------------------------------------------김찬곤-----------------------------------------------------------------------------------------------------	
	public List<MentoringVO> getMentoringList(MentoringVO vo); // 硫섑넗留� 由ъ뒪�듃

	public List<MentoringVO> getKeywordMentoring(MentoringVO vo); // 멘토링 키워드 검색_김찬곤

	public void insertMentoring(MentoringVO vo, HttpServletRequest request) throws IllegalStateException, IOException;

	public int updateMentoring(MentoringVO vo);

	public int deleteMentoring(MentoringVO vo);

	public List<MentoringVO> getMentoring(MentoringVO vo);

	public List<MentoringVO> getSearchMentoring(MentoringVO vo);

	public List<MentoringVO> mentoringRegisterCheck(MentoringVO vo); // 硫섑넗留� 以묐났 泥댄겕

	public int getMentoringCnt(MentoringVO vo); // 진행중인 멘토링 카운트_김찬곤

	public MentoringVO getSearchMentoringChanGon(MentoringVO vo); // 멘토링 단건 조회_김찬곤

	public MentoringVO MentoringRegisterCheck(MentoringVO vo); // 멘토링 중복 체크
	
	public MentoringVO getMentoringDetail(MentoringVO vo); //멘토링 코스 상세조회 
	
	
	public List<MentoringVO> getRelatedMentoring(MentoringVO vo); // 멘토링 상세페이지_유사한 멘토링 출력

//-------------------------------------------------------- End of 김찬곤-----------------------------------------------------------------------------------------------------

//------------양소민-------------------//
	public List<MentoringVO> getMyMentoringListSom(MentoringVO vo); 
//-----------------------------------//
	
	//송다희 추가
	//검색&페이징
	
	public int getMcount(MentoringVO vo);
	//이미지 랜덤
	public List<MentoringVO> getRandomImage(MentoringVO vo);
}
