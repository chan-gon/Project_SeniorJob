package com.company.self_info.service;

import java.util.List;

public interface SelfInfoService {
	//전체조회
	public List<Self_InfoVO> getSearchSelfList();
	//등록
	public int insertSelf(Self_InfoVO vo);
	//수정
	public int updateSelf(Self_InfoVO vo);
	//삭제
	public int deleteSelf(Self_InfoVO vo);
	//단건조회
	public List<Self_InfoVO> getSelf(Self_InfoVO vo);
}
