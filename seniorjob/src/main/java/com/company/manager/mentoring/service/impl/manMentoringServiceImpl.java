package com.company.manager.mentoring.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.manager.mentoring.manMentoringVO;
import com.company.manager.mentoring.service.manMentoringService;
import com.company.manager.utils.ManSearchCriteria;

@Service
public class manMentoringServiceImpl implements manMentoringService {

	@Autowired manMentoringMapper dao;
	
	@Override
	public List<manMentoringVO> mentoringList(ManSearchCriteria scri) {
		
		return dao.mentoringList(scri);
	}

	@Override
	public int mentoringCount(ManSearchCriteria scri) {
		
		return dao.mentoringCount(scri);
	}

	@Override
	public List<manMentoringVO> searchMentoring(String searchKeyword) {
		
		return dao.searchMentoring(searchKeyword);
	}

	@Override
	public List<manMentoringVO> getManMentoringList(manMentoringVO vo) {
		
		return dao.getManMentoringList(vo);
	}

	@Override
	public int deleteManMentoring(manMentoringVO vo) {
		
		return dao.deleteManMentoring(vo);
	}

}
