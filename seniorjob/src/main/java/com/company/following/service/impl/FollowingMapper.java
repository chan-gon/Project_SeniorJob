package com.company.following.service.impl;

import java.util.List;

import com.company.following.service.FollowingVO;

public interface FollowingMapper {
	
	public FollowingVO getMentorFollowing(FollowingVO vo); // 단건 조회
	public int MentorFollow(FollowingVO vo); // 멘토 팔로우 / insert는 리턴값이 void
	public int mentorFollowCheck(FollowingVO vo); // 팔로우 중복 확인
	public int deleteMentorFollow(FollowingVO vo); // 멘토 팔로우 취소
	public int getFollowCnt(FollowingVO vo); // 멘토 팔로우 카운트
	
	//송다희 추가
	public List<FollowingVO> getMentorList(FollowingVO vo); //나의 팔로우 전체 목록
	
}
