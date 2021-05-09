package com.company.businesspalna.service;

import lombok.Data;

@Data
public class BusinessPalnAVO { //사업계획서a(필수)
	private int seq;				//사업계획서 글번호
	private String business_a;		//사업의 배경과 필요성(BusinessA 테이블)
	private String business_b;		//사업의 목적(BusinessA 테이블)
	private String business_c;		//사업 기대효과(BusinessA 테이블)
	private String id;				//작성자
	private String collection;		//지도내용
	private String prod_a;			//제품(서비스)명(BusinessB 테이블)
	private String prod_b;			//제품(서비스)소개(BusinessB 테이블)
	private String prod_c;			//제품(서비스)차별성(BusinessB 테이블)
	private String market_a;		//국내외 목표시장(BusinessC 테이블)
	private String market_b;		//국내외 관련기술(제품)동향(BusinessC 테이블)
	private String market_c;		//경쟁사현황(BusinessC 테이블)
	private String market_d;		//시장진출가능성(BusinessC 테이블)
	private String selling_a;		//제품홍보방법(BusinessD 테이블)
	private String selling_b;		//수익창출방안(BusinessD 테이블)
	private String selling_c;		//시장성공요인(BusinessD 테이블)
	

	private String phidden;			//제품(서비스)명,소개,차별성 항목이 존재하는지 안하는지 여부를 체크하기 위한 값.(BusinessB 테이블)
	private String mhidden;			//국내외 목표시장, 국내외 관련기술(제품)동향, 경쟁사 현황, 시장진출가능성 항목이 존재하는지 안하는지 여부를 체크하기 위한 값.(BusinessC 테이블)
	private String shidden;			//제품홍보방법, 수익창출방안, 시장성공요인이 존재한느지 안하는지 여부를 체크하기 위한값.(BusinessD 테이블)
	private String title;			//제목
	private String mentorId;		//멘토 아이디
}
