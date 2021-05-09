package com.company.self_info.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.self_info.service.SelfInfoService;
import com.company.self_info.service.Self_InfoVO;

@Service
public class SelfInfoServiceImpl implements SelfInfoService{

	@Autowired Self_InfoMapper selfinfoMapper; 
	
	@Override
	public List<Self_InfoVO> getSearchSelfList() {
		return selfinfoMapper.getSearchSelfList();
	}

	@Override
	public int insertSelf(Self_InfoVO vo) {
		return selfinfoMapper.insertSelf(vo);
	}

	@Override
	public int updateSelf(Self_InfoVO vo) {
		return selfinfoMapper.updateSelf(vo);
	}

	@Override
	public int deleteSelf(Self_InfoVO vo) {
		return selfinfoMapper.deleteSelf(vo);
	}

	@Override
	public List<Self_InfoVO> getSelf(Self_InfoVO vo) {
		return selfinfoMapper.getSelf(vo);
	}

}
