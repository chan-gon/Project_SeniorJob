package com.company.schedule.service;

import lombok.Data;

@Data
public class ScheduleVO {			
	private String seq;					//일정번호
	private String schedule_name;		//일정이름
	private String schedule_con;		//요청내용
	private String schedule_start;		//시작일시
	private String schedule_end;		//종료일시
	private String state;				//진행상황
	private String menteeid;			//멘티
	private String mentorid;			//멘토
	private String auth;				//권한
	
	private String schedule_start_time;		//시작시간
	private String schedule_end_time;		//종료시간
	
	private String reply; //답변
	private String resume_no; //이력서 번호
	private String oldResumeNo; //옛날이력서 번호
	
}
