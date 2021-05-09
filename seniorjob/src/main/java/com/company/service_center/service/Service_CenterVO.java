package com.company.service_center.service;

import java.util.Date;

import lombok.Data;

@Data
public class Service_CenterVO { 		//고객센터
	private String seq;		//글번호
	private String category_a;		//대분류
	private String category_b;		//중분류
	private Date w_date;		//작성일자
	private String click;		//조회수
	private String content;		//글내용
	private String s_file;		//첨부파일
	private String id;		//아이디
	private String title; //글제목
	
	//글 이전 다음
	private int prev; //이전글의 글번호를 담을 필드
	private String prev_title; // 이전 글의 글제목 담을 필드
	private int next; //다음글의 글번호를 담을 필드
	private String next_title; //다음글의 글제목을 담을 필드
	//
}
