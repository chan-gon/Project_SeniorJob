package com.company.mentoring.service.impl;

import java.util.List;

import com.company.mentoring.service.MentoringVO;

public interface MentoringMapper {
	
	public List<MentoringVO> getMentoringList(MentoringVO vo); // 멘토링 리스트
	public List<MentoringVO> getKeywordMentoring(MentoringVO vo);
	public void insertMentoring(MentoringVO vo);
	public int getMentoringCnt(MentoringVO vo); // 진행중인 멘토링 카운트 
	public MentoringVO getSearchMentoringChanGon(MentoringVO vo); // 멘토링 단건 조회_김찬곤
	public List<MentoringVO> mentoringRegisterCheck(MentoringVO vo); // 멘토링 날짜 중복 체크
	public MentoringVO MentoringRegisterCheck(MentoringVO vo); // 멘토링 중복 체크
	public MentoringVO getMentoringDetail(MentoringVO vo); //멘토링 코스 상세조회 
	public List<MentoringVO> getMentoring(MentoringVO vo);
	public List<MentoringVO> getRelatedMentoring(MentoringVO vo); // 멘토링 상세페이지_유사한 멘토링 출력
	
	public int updateMentoring(MentoringVO vo);
	public int deleteMentoring(MentoringVO vo);
	public List<MentoringVO> getSearchMentoring(MentoringVO vo);
	
	public List<MentoringVO> getMyMentoringListSom(MentoringVO vo); 

	//검색&페이징
	public int getMcount(MentoringVO vo);
	//이미지 랜덤
	public List<MentoringVO> getRandomImage(MentoringVO vo);

}