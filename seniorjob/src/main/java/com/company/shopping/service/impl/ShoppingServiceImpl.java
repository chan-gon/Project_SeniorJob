package com.company.shopping.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.shopping.service.ShoppingService;
import com.company.shopping.service.ShoppingVO;

@Service
public class ShoppingServiceImpl implements ShoppingService {

	@Autowired ShoppingMapper dao;
	
	@Override
	public int insertShopping(ShoppingVO vo) {
		return dao.insertShopping(vo);
	}

	@Override
	public int updateShopping(ShoppingVO vo) {
		return dao.updateShopping(vo);
	}

	@Override
	public int deleteShopping(ShoppingVO vo) {
		return dao.deleteShopping(vo);
	}

	@Override
	public ShoppingVO getShopping(ShoppingVO vo) {
		return dao.getShopping(vo);
	}

	
	//양소민 추가
	
	@Override
	public List<ShoppingVO> getSearchShopping(ShoppingVO vo) { //마이페이지_수강중인 멘토링
		return dao.getSearchShopping(vo);
	}

	@Override
	public List<ShoppingVO> getSearchPay(ShoppingVO vo) { //마이페이지_결제내역
		return dao.getSearchPay(vo);
	}

	// 김찬곤 추가
	@Override
	public int insertMentoringBasket(ShoppingVO vo) { // 멘토 상세페이지_장바구니 담기
		int result = dao.insertMentoringBasket(vo);
		return result;
	}
	@Override
	public int deleteMentoringBasket(ShoppingVO vo) { // 멘토 상세페이지_장바구니 취소
		int result = dao.deleteShopping(vo);
		return result;
	}
	@Override
	public ShoppingVO getSearchBasket(ShoppingVO vo) { // 멘토 상세페이지_장바구니 단건 조회
		return dao.getSearchBasket(vo);
	}
	

	// 멘토링 결제_장바구니에 담겼을 때 
	public int mentoringPayProcBasket(ShoppingVO vo) {
		int result = dao.mentoringPayProcBasket(vo);
		return result;
	}

	// 결제 중복체크
	public int paymentChk(ShoppingVO vo) {
		int result = dao.paymentChk(vo);
		return result;
	}

	 // 멘토링 결제_장바구니에 담지 않고 바로 결제할 때
	public int mentoringPayProc(ShoppingVO vo) {
		int result = dao.mentoringPayProc(vo);
		return result;
	}

	// 결제 내역 가져오기
	public ShoppingVO getPayInfo(ShoppingVO vo) {
		return dao.getPayInfo(vo);
	}


}
