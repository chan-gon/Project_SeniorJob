package com.company.self_info.service;

import lombok.Data;

@Data
public class Self_InfoVO { 		//자소서
	private String self_no;	//자소서번호
	private String resume_no;		//이력서번호
	private String self_name;		//자소서제목
	private String self_content;		//자소서내용
	private String[] self_arrang;   //자기소개서 담을 배열(반복)

}
