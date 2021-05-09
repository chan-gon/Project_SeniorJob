package com.company.mentoring_reviews.service.impl;

import java.util.List;

import com.company.mentoring_reviews.service.MenSearchCriteria;
import com.company.mentoring_reviews.service.Mentoring_ReviewsVO;

public interface Mentoring_ReviewsMapper {
	
//====================게시판 뷰=========================================================================
		// 페이징 처리 및 후기 전체 조회
		public List<Mentoring_ReviewsVO> list(MenSearchCriteria scri);

		// 게시글 검색
	    public List<Mentoring_ReviewsVO> searchMenService(String searchKeyword);		
				
		// 공지사항 게시물 총갯수
		public int listCount(MenSearchCriteria scri);
		
		// 게시물 총 갯수
		public int countBoard();
		
		// 후기 조회수 증가
		public boolean upnumMenReview(Mentoring_ReviewsVO vo);
//=======================게시판 글 클릭 후 뷰=========================================================================
		// 후기 단건 조회
		public Mentoring_ReviewsVO getSearchMenReview(Mentoring_ReviewsVO vo);
		// 후기 게시물 단건조회 후 이전/다음글
		public Mentoring_ReviewsVO menPreNext(Mentoring_ReviewsVO vo);
//================================게시글 등록=================================================================		
		// 후기 등록
		public int insertMenReview(Mentoring_ReviewsVO vo);
//=================================게시글 수정================================================================
		// 후기 수정
		public int updateMenReview(Mentoring_ReviewsVO vo);
//================================게시글 삭제=================================================================
		// 후기 삭제
		public int deleteMenReview(Mentoring_ReviewsVO vo);
//=================================================================================================
		
		
		public List<Mentoring_ReviewsVO> getPopularArticleList(Mentoring_ReviewsVO vo); 
		
		
		//송다희 추가
		//후기
		public List<Mentoring_ReviewsVO> getReviewsList(Mentoring_ReviewsVO vo);
		
		// 구매내역 조회
		public int searchShopping(Mentoring_ReviewsVO vo);
		// 입력
		public int insertReviewsMen(Mentoring_ReviewsVO vo);
		// 삭제
		public int deleteReviews(Mentoring_ReviewsVO vo);
		// 수정
		public int updateReviews(Mentoring_ReviewsVO vo);
		// 후기글 한 번만 작성
		public int getReviewOne(Mentoring_ReviewsVO vo);
		// 후기글 단건 조회
		public String getOneReviews(Mentoring_ReviewsVO vo);
		// 페이징
		public int getRcount(Mentoring_ReviewsVO vo);

		public Mentoring_ReviewsVO getReviewsUp(Mentoring_ReviewsVO vo);
}
