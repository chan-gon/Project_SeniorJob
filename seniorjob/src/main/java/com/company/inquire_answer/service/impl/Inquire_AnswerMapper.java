package com.company.inquire_answer.service.impl;

import java.util.List;

import com.company.inquire.service.Inquire_AnswerVO;

public interface Inquire_AnswerMapper {
	//등록
	public int insertInquire_Answer(Inquire_AnswerVO vo);
	//수정
	public int updateInquire_Answer(Inquire_AnswerVO vo);
	//삭제
	public int deleteInquire_Answer(Inquire_AnswerVO vo);
	//단건조회
	public Inquire_AnswerVO getInquire_Answer(Inquire_AnswerVO vo);
	//전체 검색 조회
	public List<Inquire_AnswerVO> getInquire_AnswerList();
}
