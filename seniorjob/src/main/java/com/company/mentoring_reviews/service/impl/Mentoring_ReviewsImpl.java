package com.company.mentoring_reviews.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.mentoring_reviews.service.MenSearchCriteria;
import com.company.mentoring_reviews.service.Mentoring_ReviewsService;
import com.company.mentoring_reviews.service.Mentoring_ReviewsVO;

@Service
public class Mentoring_ReviewsImpl implements Mentoring_ReviewsService {

	@Autowired Mentoring_ReviewsMapper dao;

	@Override
	public List<Mentoring_ReviewsVO> list(MenSearchCriteria scri) {
		// TODO Auto-generated method stub
		return dao.list(scri);
	}

	@Override
	public List<Mentoring_ReviewsVO> searchMenService(String searchKeyword) {
		// TODO Auto-generated method stub
		return dao.searchMenService(searchKeyword);
	}

	@Override
	public int listCount(MenSearchCriteria scri) {
		// TODO Auto-generated method stub
		return dao.listCount(scri);
	}

	@Override
	public int countBoard() {
		// TODO Auto-generated method stub
		return dao.countBoard();
	}

	@Override
	public Mentoring_ReviewsVO getSearchMenReview(Mentoring_ReviewsVO vo) {
		// TODO Auto-generated method stub
		return dao.getSearchMenReview(vo);
	}

	@Override
	public int insertMenReview(Mentoring_ReviewsVO vo) {
		// TODO Auto-generated method stub
		return dao.insertMenReview(vo);
	}

	@Override
	public int updateMenReview(Mentoring_ReviewsVO vo) {
		// TODO Auto-generated method stub
		return dao.updateMenReview(vo);
	}

	@Override
	public int deleteMenReview(Mentoring_ReviewsVO vo) {
		// TODO Auto-generated method stub
		return dao.deleteMenReview(vo);
	}

	@Override
	public boolean upnumMenReview(Mentoring_ReviewsVO vo) {
		// TODO Auto-generated method stub
		return dao.upnumMenReview(vo);
	}

	@Override
	public Mentoring_ReviewsVO menPreNext(Mentoring_ReviewsVO vo) {
		// TODO Auto-generated method stub
		return dao.menPreNext(vo);
	}

	// 인기 조회수 후기 페이지 띄우기_김찬곤
	@Override
	public List<Mentoring_ReviewsVO> getPopularArticleList(Mentoring_ReviewsVO vo) {
		return dao.getPopularArticleList(vo);
	}

	@Override
	public List<Mentoring_ReviewsVO> getReviewsList(Mentoring_ReviewsVO vo) {
		return dao.getReviewsList(vo);
	}

	@Override
	public int searchShopping(Mentoring_ReviewsVO vo) {
		return dao.searchShopping(vo);
	}

	@Override
	public int insertReviewsMen(Mentoring_ReviewsVO vo) {
		return dao.insertReviewsMen(vo);
	}

	@Override
	public int deleteReviews(Mentoring_ReviewsVO vo) {
		return dao.deleteReviews(vo);
	}

	@Override
	public int updateReviews(Mentoring_ReviewsVO vo) {
		return dao.updateReviews(vo);
	}
	
	@Override
	public int getReviewOne(Mentoring_ReviewsVO vo) {
		return dao.getReviewOne(vo);
	}
	
	@Override
	public String getOneReviews(Mentoring_ReviewsVO vo) {
		return dao.getOneReviews(vo);
	}
	
	@Override
	public int getRcount(Mentoring_ReviewsVO vo) {
		return dao.getRcount(vo);
	}

	@Override
	public Mentoring_ReviewsVO getReviewsUp(Mentoring_ReviewsVO vo) {
		return dao.getReviewsUp(vo);
	}

}
