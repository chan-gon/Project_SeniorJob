package com.company.mentor.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface MentorService {

	public List<MentorVO> getMentorList(MentorVO vo); // 검색
	public List<MentorVO> getKeywordSearch(MentorVO vo); // 키워드 검색
	public List<MentorVO> getSearchMentorDuty(MentorVO vo); // 멘토 직무 검색
	public MentorVO getMentor(MentorVO vo); // 멘토 상세페이지
	
	public void MentorRegisterProc(MentorVO vo, HttpServletRequest request) throws IllegalStateException, IOException; // 멘토 등록
	public MentorVO mentorRegisterCheck(MentorVO vo); // 멘토 등록 중복 체크
	
	public void getUpdateFNumPlus(MentorVO vo); // 멘토 팔로우 클릭 시 멘토 팔로우 숫자 추가_김찬곤
	public void getUpdateFNumMinus(MentorVO vo); // 멘토 팔로우 클릭 시 멘토 팔로우 숫자 제거_김찬곤
	
	// 페이징 구현
	public List<MentorVO> getMentorByDate(MentorVO vo); // 멘토리스트 세부검색: 최신순
	public List<MentorVO> getMentorByFollow(MentorVO vo); // 멘토리스트 세부검색: 인기순
	public String getMentorId(MentorVO vo);// 멘토 아이디 조회
	
	public String getMentorName(String menId);//멘토 이름 ㅈ회
}
