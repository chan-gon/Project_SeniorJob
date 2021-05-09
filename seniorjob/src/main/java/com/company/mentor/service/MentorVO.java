package com.company.mentor.service;

import org.springframework.web.multipart.MultipartFile;

import com.company.following.service.FollowingVO;
import com.company.users.service.UsersVO;

import lombok.Data;

@Data
public class MentorVO { //멘토
	private String mentor_id; //멘토id
	private String mentoring_kind; //대표 멘토링 분야
	private String mentor_introduce; // 멘토소개
	private String mentor_career; //멘토 주요 경력
	private String mentor_photo; // 멘토 사진
	private String mentor_license; //멘토 자격증
	private String mentor_career_certificate; //멘토 경력증명서
	private String mentor_school_name; //멘토 학교명
	private String mentor_company_name; //멘토 회사명
	private String mentor_department_name; //멘토 부서명
	private String mentor_job_id; //멘토 직급
	private String mentor_duty; //멘토 직무
	private String id; //아이디
	private String mentoring_age; //멘토링 연령대
	private String mentoring_location; //멘토링 지역
	private String mentor_confirm_status; //멘토링 승인여부
	private String mentor_date; // 멘토 등록 일자
	private String mentor_f_num; // 멘토 팔로우 숫자
	
	private String[] mentor_dutyArr; // 메인페이지 멘토 직무 검색용
	
	private MultipartFile mentor_photo_file; // 멘토 사진 파일_김찬곤 추가
	private MultipartFile mentor_license_file; // 멘토 자격증 파일_김찬곤 추가
	private MultipartFile mentor_career_certificate_file; // 멘토 경력 증명서 파일_김찬곤 추가
	
	private UsersVO usersVO; // Users/Mentor 테이블 조인구문 사용 시 필요_김찬곤 추가
	private FollowingVO followingVO; // 멘토리스트 세부검색:인기순 쿼리 시 필요_김찬곤 추가
	private String searchKeyword; // 키워드 검색 파라미터_김찬곤 추가
}
