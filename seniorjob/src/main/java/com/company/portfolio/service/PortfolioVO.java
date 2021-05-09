package com.company.portfolio.service;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class PortfolioVO { 		//포트폴리오
	private String port_no;		//포트폴리오번호
	private String resume_no;		//이력서번호
	private String portfolio;		//포트폴리오
	private MultipartFile[] portFile;   //파일 여러건 올리는 배열
}
