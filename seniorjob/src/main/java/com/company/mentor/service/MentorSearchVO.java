package com.company.mentor.service;

import lombok.Data;

@Data
public class MentorSearchVO extends MentorVO {
	
	private String nowPage;
	private String cntPerPage;
	private int start;
	private int end;
	private String optionValue;
	
	

}
