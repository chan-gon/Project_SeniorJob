package com.company.businesspalna.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.businesspalna.service.BusinessPlanAService;
import com.company.mentoring.service.MentoringVO;
import com.company.businesspalna.service.BusinessPalnAVO;

@Service
public class BusinessPlanAServiceImpl implements BusinessPlanAService {
	
	@Autowired BusinessPlanAMapper dao;

	@Override
	public int insertBusinessPlanA(BusinessPalnAVO vo) {
		return dao.insertBusinessPlanA(vo);
	}
	
	@Override
	public int insertBusinessPlanB(BusinessPalnAVO vo) {
		return dao.insertBusinessPlanB(vo);
	}

	@Override
	public int insertBusinessPlanC(BusinessPalnAVO vo) {
		return dao.insertBusinessPlanC(vo);
	}

	@Override
	public int insertBusinessPlanD(BusinessPalnAVO vo) {
		return dao.insertBusinessPlanD(vo);
	}

	@Override
	public int updateBusinessPlanA(BusinessPalnAVO vo) {
		return dao.updateBusinessPlanA(vo);
	}

	@Override
	public int deleteBusinessPlanA(BusinessPalnAVO vo) {
		return dao.deleteBusinessPlanA(vo);
	}

	@Override
	public BusinessPalnAVO getBusinessPlanA(BusinessPalnAVO vo) {
		return dao.getBusinessPlanA(vo);
	}

	@Override
	public List<BusinessPalnAVO> getSearchBusinessPlanA(BusinessPalnAVO vo) {
		return dao.getSearchBusinessPlanA(vo);
	}

	@Override
	public List<Map<String, Object>> getBpExcel(BusinessPalnAVO vo) {
		return dao.getBpExcel(vo);
	}

	@Override
	public int getSeq() {
		return dao.getSeq();
	}

	@Override
	public int updateBusinessPlanB(BusinessPalnAVO vo) {
		return dao.updateBusinessPlanB(vo);
	}

	@Override
	public int updateBusinessPlanC(BusinessPalnAVO vo) {
		return dao.updateBusinessPlanC(vo);
	}

	@Override
	public int updateBusinessPlanD(BusinessPalnAVO vo) {
		return dao.updateBusinessPlanD(vo);
	}

	@Override
	public List<MentoringVO> ckMenName(MentoringVO vo) {
		return dao.ckMenName(vo);
	}

	@Override
	public int ckUpdate(BusinessPalnAVO vo) {
		return dao.ckUpdate(vo);
	}

	@Override
	public List<BusinessPalnAVO> checkP(BusinessPalnAVO vo) {
		return dao.checkP(vo);
	}

	@Override
	public BusinessPalnAVO checkBusinessPlan(BusinessPalnAVO vo) {
		return dao.checkBusinessPlan(vo);
	}

	@Override
	public int collectionUpdate(BusinessPalnAVO vo) {
		return dao.collectionUpdate(vo);
	}

	


}
