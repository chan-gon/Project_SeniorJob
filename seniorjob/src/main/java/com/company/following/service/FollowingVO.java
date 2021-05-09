package com.company.following.service;

import com.company.mentor.service.MentorVO;
import com.company.users.service.UsersVO;

import lombok.Data;

@Data
public class FollowingVO { 		//팔로우목록
	private String id;		//아이디
	private String mentor_id;		//멘토id
	
	private MentorVO mentorVO; // getMentorList 쿼리 시 조인용도
	private UsersVO usersVO; // getMentorList 쿼리 시 조인용도
}
