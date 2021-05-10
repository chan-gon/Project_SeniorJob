package com.company.mentoring.service;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MentoringVO {  //멘토링 코스
	private int mentoring_number;  	//멘토링 코스 번호
	private String mentoring_name; 	//멘토링 코스 이름
	private String mentoring_limit; 	//멘토링 코스 정원
	private String mentoring_content; 		//멘토링 코스 내용
	private String mentoring_photo;	//멘토링 코스 이미지
	//송다희 수정(string > int)
	private int mentoring_price;	//멘토링 코스 금액
	private String mentoring_introduce; 		//멘토링 코스 간단 소개(100자 이하)
	private String mentoring_data;	//멘토링 코스 자료
	private String mentor_id;	//멘토 id
	private String mentoring_end_date;	//멘토링 코스 종료일
	private String mentoring_begin_date;	//멘토링 코스 시작일
	private String mentoring_kind; // 멘토링 분류
	
	private MultipartFile mentoring_photo_file; // 멘토링 사진 파일_김찬곤 추가
	
	private String s_date; // 멘토링 시작일 alias
	private String e_date; // 멘토링 종료일 alias
	
	//양소민 추가(마이페이지 내가 만든 멘토링에 사용)
	private String name; //멘토링 코스를 수강중인 멘티의 이름
	private String men_start; //멘티가 멘토링을 시작한 날짜
	private String met_end; //멘티가 멘토링을 끝내는 날짜
	private String id; //멘토의 회원 id
	private String menteeId; //멘티의 회원 id
	
	//송다희 추가
	//paging
	Integer page = 1;
	int start = 1;
	int end = 10;
}
