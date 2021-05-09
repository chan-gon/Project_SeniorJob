package com.company.schedule.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.schedule.service.ScheduleService;
import com.company.schedule.service.ScheduleVO;

@Service
public class ScheduleServiceImpl implements ScheduleService {
	
	@Autowired ScheduleMapper dao;

	@Override
	public int insertSchedule(ScheduleVO vo) {
		return dao.insertSchedule(vo);
	}

	@Override
	public int updateSchedule(ScheduleVO vo) {
		return dao.updateSchedule(vo);
	}

	@Override
	public int deleteSchedule(ScheduleVO vo) {
		return dao.deleteSchedule(vo);
	}

	@Override
	public ScheduleVO getSchedule(ScheduleVO vo) {
		return dao.getSchedule(vo);
	}

	@Override
	public List<Map<String, String>> getSearchSchedule(ScheduleVO vo) {
		return dao.getSearchSchedule(vo);
	}

	@Override
	public List<Map> getSearchRequest(ScheduleVO vo) {
		return dao.getSearchRequest(vo);
	}

	@Override
	public int updateScheduleReject(ScheduleVO vo) {
		return dao.updateScheduleReject(vo);
	}

	@Override
	public int insertQuest(ScheduleVO vo) {
		return dao.insertQuest(vo);
	}

	@Override
	public List<Map> getSearchQuest(ScheduleVO vo) {
		return dao.getSearchQuest(vo);
	}

	@Override
	public int updateQuest(ScheduleVO vo) {
		return dao.updateQuest(vo);
	}

	@Override
	public ScheduleVO getQuest(ScheduleVO vo) {
		return dao.getQuest(vo);
	}

	@Override
	public List<Map> getSearchMentoringDate(ScheduleVO vo) {
		return dao.getSearchMentoringDate(vo);
	}

	@Override
	public List<ScheduleVO> replyQuestFormSom(ScheduleVO vo) {
		return dao.replyQuestFormSom(vo);
	}
	
	

}
