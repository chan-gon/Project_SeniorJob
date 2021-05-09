package com.company.following.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.following.service.FollowService;
import com.company.following.service.FollowingVO;
@Service
public class FollowServiceImpl implements FollowService{
	
	@Autowired FollowingMapper followMapper;

	// 멘토 팔로우 / insert는 리턴값이 void
	@Override
	public int MentorFollow(FollowingVO vo) {
		int result = followMapper.MentorFollow(vo);
		return result;
	}
	// 멘토 팔로우 취소
	@Override
	public int deleteMentorFollow(FollowingVO vo) {
		int result = followMapper.deleteMentorFollow(vo);
		return result;
	}
	// 팔로우 중복 확인
	@Override
	public int mentorFollowCheck(FollowingVO vo) {
		int result = followMapper.mentorFollowCheck(vo);
		return result;
	}
	// 멘토 팔로우 카운트
	@Override
	public int getFollowCnt(FollowingVO vo) {
		int result = followMapper.getFollowCnt(vo);
		return result;
	}
	@Override
	//송다희 추가
	//나의 팔로우 목록
	public List<FollowingVO> getMentorList(FollowingVO vo) {
		return followMapper.getMentorList(vo);
	}
	// 단건 조회
	@Override
	public FollowingVO getMentorFollowing(FollowingVO vo) {
		return followMapper.getMentorFollowing(vo);
	}

}
