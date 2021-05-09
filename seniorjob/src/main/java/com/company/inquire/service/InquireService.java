package com.company.inquire.service;

import java.util.List;
import java.util.Map;

import com.company.service_center.SearchCriteria;

public interface InquireService {
	//등록
	public int insertInquire(InquireVO vo);
	//수정
	public int updateInquire(InquireVO vo);
	
	//삭제
	public int deleteInquire(InquireVO vo);
	//단건조회
	public InquireVO getInquire(InquireVO vo);
	
	//전체문의목록
	// 전체문의목록 게시물 총갯수
	public int inquireCount(SearchCriteria scri); //전체 게시글 
	public int inquireCountY(SearchCriteria scri);//전체 게시글 중 답변완료
	public int inquireCountN(SearchCriteria scri);//전체 게시글 중 미답변
	public int inquireCount2(SearchCriteria scri);
	
	//전체문의목록 게시글 검색
	public List<InquireVO> searchInquire(String searchKeyword);
	
	//전체 검색 조회
	public List<InquireVO> getInquireList(SearchCriteria scri);
	public List<InquireVO> getInquireList2(SearchCriteria scri); //결제
	public List<InquireVO> getInquireList3(SearchCriteria scri); //환불
	public List<InquireVO> getInquireList4(SearchCriteria scri); //신청
	public List<InquireVO> getInquireList5(SearchCriteria scri); //취소
	public List<InquireVO> getInquireList6(SearchCriteria scri); //기타
	
	public List<InquireVO> getInquireListY(SearchCriteria scri); //전체 답변완료
	public List<InquireVO> getInquireListN(SearchCriteria scri); //전체 답변완료
	
	
	//===============================================//
	
	//유저 내문의목록조회
	public List<InquireVO> userInquireList(Map<String, Object> map);
	//유저 내문의목록단건조회
	public InquireVO getUserInquire(InquireVO vo);
	//관리자 답변작성
	public int insertAnswer(Inquire_AnswerVO avo);
	//관리자 답변작성시 미답변->답변완료
	public boolean updateConfirm(InquireVO vo);
	//관리자 답변작성시 답변완료->미답변
	public boolean updateAnswerStatus(InquireVO vo);	
	//답변 작성 리스트 조회
	public List<Inquire_AnswerVO> userAnswerList(Inquire_AnswerVO avo);
	//답변 수정
	public int updateAnswer(Inquire_AnswerVO avo);
	//답변 삭제
	public int deleteAnswer(Inquire_AnswerVO avo);	
	//답변 삭제(i_seq가 아닌seq기준)
	public int deleteAnswer2(Inquire_AnswerVO avo);
}
