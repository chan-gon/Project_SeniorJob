package com.company.inquire.service;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class Inquire_AnswerVO { 		//문의답변
	private String seq;		//문의 원글 번호
	private String title;		//제목
	private String content;		//내용
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date w_date;		//작성일자
	private String id;		//아이디
	private String i_seq;  //답변 글 번호
	private String seq_ord; // 답변 글 순서
}
