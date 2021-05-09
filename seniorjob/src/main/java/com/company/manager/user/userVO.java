package com.company.manager.user;

import java.util.Date;

import lombok.Data;

@Data

public class userVO {
	private String id;
	private String password;
	private String address;
	private String phonenum;
	private String email;
	private String birth;
	private String auth;
	private String name;
	private Date log_date;
	private String distinction;
	private String accesstoken;
	private String postcode;
	private String detailaddress;
	private String extraaddress;
	
	private String mentor_career_certificate; //멘토 경력증명서
	private Date mentor_date; //멘토 등록일
	private String mentor_confirm_status; //멘토 신청상태
	
}
