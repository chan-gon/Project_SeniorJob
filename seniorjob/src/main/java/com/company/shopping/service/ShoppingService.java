package com.company.shopping.service;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface ShoppingService {
	
public int insertShopping(ShoppingVO vo);
	
	public int updateShopping(ShoppingVO vo);
	
	public int deleteShopping(ShoppingVO vo);
	
	public ShoppingVO getShopping(ShoppingVO vo);
	
	public List<ShoppingVO> getSearchShopping(ShoppingVO vo);

	public List<ShoppingVO> getSearchPay(ShoppingVO vo);
	
	// 김찬곤 추가
	public int insertMentoringBasket(ShoppingVO vo); // 멘토 상세페이지_장바구니 담기
	public int deleteMentoringBasket(ShoppingVO vo); // 멘토 상세페이지_장바구니 취소
	public ShoppingVO getSearchBasket(ShoppingVO vo); // 멘토 상세페이지_장바구니 단건 조회
	
	public int mentoringPayProcBasket(ShoppingVO vo); // 멘토링 결제_장바구니에 담겼을 때
	public int mentoringPayProc(ShoppingVO vo); // 멘토링 결제_장바구니에 담지 않고 바로 결제할 때
	public int paymentChk(ShoppingVO vo); // 결제 중복체크
	public ShoppingVO getPayInfo(ShoppingVO vo); // 결제 내역 가져오기
	
}
