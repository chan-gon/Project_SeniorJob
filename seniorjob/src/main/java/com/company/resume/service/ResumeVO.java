package com.company.resume.service;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ResumeVO {					//이력서필수
	private String resume_no;			//이력서번호
	private String resume_name;			//이름
	private String resume_birth;		//생년월일
	private String resume_email;		//이메일
	private String resume_phone;		//휴대폰번호
	private String resume_address;		//주소
	private String resume_school;		//학교명
	private String resume_area;			//지역
	private String resume_start;		//입학일
	private String resume_end;			//졸업일
	private String id;					//아이디
	private String collection;			//지도내용
	private String image;				//이미지
	private MultipartFile uploadFile;	//이미지 업로드
	private String resume_title;		//이력서 제목
	private String resume_major; 		//전공
	
	//양소민 추가
	private String mentorId;			//멘토아이디
}
