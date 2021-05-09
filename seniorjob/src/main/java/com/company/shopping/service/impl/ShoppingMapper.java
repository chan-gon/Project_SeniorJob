package com.company.shopping.service.impl;

import java.util.List;

import com.company.shopping.service.ShoppingVO;

public interface ShoppingMapper {
	
public int insertShopping(ShoppingVO vo);
	
	public int updateShopping(ShoppingVO vo);
	
	public int deleteShopping(ShoppingVO vo);
	
	public ShoppingVO getShopping(ShoppingVO vo);
	
	//양소민 추가
	public List<ShoppingVO> getSearchShopping(ShoppingVO vo); //마이페이지_수강중인 멘토링
	
	public List<ShoppingVO> getSearchPay(ShoppingVO vo); //마이페이지_결제내역
	
	// 김찬곤 추가
	public int insertMentoringBasket(ShoppingVO vo); // 멘토 상세페이지_장바구니 담기
	public int deleteMentoringBasket(ShoppingVO vo); // 멘토 상세페이지_장바구니 취소
	public ShoppingVO getSearchBasket(ShoppingVO vo); // 멘토 상세페이지_장바구니 단건 조회
	
	public int mentoringPayProcBasket(ShoppingVO vo); // 멘토링 결제_장바구니에 담겼을 때 
	public int mentoringPayProc(ShoppingVO vo); //멘토링 결제_장바구니에 담지 않고 바로 결제
	public int paymentChk(ShoppingVO vo); // 결제 중복체크
	public ShoppingVO getPayInfo(ShoppingVO vo); // 결제 내역 가져오기
}
