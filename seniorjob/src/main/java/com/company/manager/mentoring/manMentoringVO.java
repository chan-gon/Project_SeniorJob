package com.company.manager.mentoring;

import java.util.Date;

import lombok.Data;

@Data
public class manMentoringVO {
	
	private String mentoring_number;  	//멘토링 코스 번호
	private String mentoring_name; 	//멘토링 코스 이름
	private String mentoring_limit; 	//멘토링 코스 정원
	private String mentoring_introduce; 		//멘토링 코스 소개
	private String mentoring_photo;	//멘토링 코스 이미지
	private String mentoring_price;	//멘토링 코스 금액
	private String mentoring_data;	//멘토링 코스 자료
	private String mentoring_request;	//멘토링 코스 요청사항
	private String mentor_id;	//멘토 id
	private Date mentoring_end_date;	//멘토링 코스 종료일
	private Date mentoring_begin_date;	//멘토링 코스 시작일
	private String mentoring_kind; //멘토링 분야
	private String mentoring_content;	//멘토링 코스 내용
	
	private String s_date; // 멘토링 시작일 alias
	private String e_date; // 멘토링 종료일 alias
}
