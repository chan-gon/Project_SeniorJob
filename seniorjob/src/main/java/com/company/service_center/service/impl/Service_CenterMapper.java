package com.company.service_center.service.impl;

import java.util.List;

import com.company.service_center.PagingVO;
import com.company.service_center.SearchCriteria;
import com.company.service_center.service.Service_CenterVO;

public interface Service_CenterMapper {
	// =========================================공지사항=================================================
	// 공지사항 등록
	public int insertService_Center(Service_CenterVO vo);

	// 공지사항 수정
	public void updateService_Center(Service_CenterVO vo);

	// 공지사항 삭제
	public void deleteService_Center(Service_CenterVO vo);

	// 공지사항 단건조회
	public Service_CenterVO getService_Center(Service_CenterVO vo);

	// 조회수 증가
	public boolean updateClick(Service_CenterVO vo);

	// 게시물 총 갯수
	public int countBoard();

	// 페이징 처리 게시글 조회
	public List<Service_CenterVO> selectBoard(PagingVO vo);

	// 게시글 검색
	public List<Service_CenterVO> searchService(String searchKeyword);

	// 페이징 처리 및 공지사항 전체 조회
	public List<Service_CenterVO> list(SearchCriteria scri);
	public List<Service_CenterVO> listDate(SearchCriteria scri); //최신날짜순
	public List<Service_CenterVO> listClick(SearchCriteria scri); //조회수순

	// 공지사항 게시물 총갯수
	public int listCount(SearchCriteria scri);

	// 공지사항게시물 단건조회 후 이전/다음글
	public Service_CenterVO preNext(Service_CenterVO vo);

	// =========================================결제환불=================================================
	// 페이징 처리 및 결제환불 전체 조회
	public List<Service_CenterVO> listQna(SearchCriteria scri);
	public List<Service_CenterVO> listQnaPayment(SearchCriteria scri);
	public List<Service_CenterVO> listQnaRefund(SearchCriteria scri);
	public List<Service_CenterVO> listQnaRequest(SearchCriteria scri);
	public List<Service_CenterVO> listQnaCancle(SearchCriteria scri);
	public List<Service_CenterVO> listQnaGita(SearchCriteria scri);

	// 결제환불 게시물 총갯수
	public int listCountQna(SearchCriteria scri);

	// 결제환불 게시글 검색
	public List<Service_CenterVO> searchServiceQna(String searchKeyword);

	// 결제환불 단건조회
	public Service_CenterVO getService_CenterQna(Service_CenterVO vo);

	// 결제환불게시물 단건조회 후 이전/다음글
	public Service_CenterVO preNextQna(Service_CenterVO vo);

	// 결제환불 등록
	public int insertService_CenterQna(Service_CenterVO vo);

	// 결제환불 수정
	public void updateService_CenterQna(Service_CenterVO vo);

	// =========================================신청취소=================================================
	// 페이징 처리 및 신청취소 전체 조회
	public List<Service_CenterVO> listQna2(SearchCriteria scri);

	// 신청취소 게시물 총갯수
	public int listCountQna2(SearchCriteria scri);

	// 신청취소 게시글 검색
	public List<Service_CenterVO> searchServiceQna2(String searchKeyword);

	// 신청취소 단건조회
	public Service_CenterVO getService_CenterQna2(Service_CenterVO vo);

	// 신청취소게시물 단건조회 후 이전/다음글
	public Service_CenterVO preNextQna2(Service_CenterVO vo);

	// 신청취소 등록
	public int insertService_CenterQna2(Service_CenterVO vo);

	// 신청취소 수정
	public void updateService_CenterQna2(Service_CenterVO vo);


}
