package com.company.mentoring_reviews.service;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class Mentoring_ReviewsVO { //멘토링 후기
	private int seq; // 글번호
	private String category_a; //대분류
	private String category_b; //중분류
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date w_date; //작성일자
	private int click; //조회수
	private String content; //글내용
	private String r_file; //첨부파일
	private String id; //아이디
	private int mentoring_number; //멘토링 코스번호
	private String title; //글 제목
	
	private String mentoringVO; // mentoring 테이블에서 값 가져오는 alias_김찬곤
	
	//글 이전 다음
	private int menPrev; //이전글의 글번호를 담을 필드
	private String menPrev_title; // 이전 글의 글제목 담을 필드
	private int menNext; //다음글의 글번호를 담을 필드
	private String menNext_title; //다음글의 글제목을 담을 필드
	
	//paging
	Integer page = 1;
	int start = 1;
	int end = 10;
}
