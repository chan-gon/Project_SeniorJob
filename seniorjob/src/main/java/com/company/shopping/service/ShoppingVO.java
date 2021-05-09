package com.company.shopping.service;

import lombok.Data;

@Data
public class ShoppingVO { //주문정보
	private String shopping_no; //주문번호
	private String id; //아이디
	private String mentoring_number; // 멘토링 코스 번호
	private String mentor_id;
	private String s_date; //주문일
	private String men_start; //멘토링 시작일
	private String met_end; //멘토링 종료일
	private String men_price;
	
	//양소민 추가(마이페이지 수강중인 멘토링, 결제내역에 사용)
	private String name;
	private String mentoring_name;
	private String mentoring_content;
	private String mentoring_photo;
	private String mentoring_price;
	
}
