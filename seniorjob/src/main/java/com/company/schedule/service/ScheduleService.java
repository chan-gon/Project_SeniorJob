package com.company.schedule.service;

import java.util.List;
import java.util.Map;


public interface ScheduleService {
	
	public int insertSchedule(ScheduleVO vo);
	public int insertQuest(ScheduleVO vo);
	
	public int updateSchedule(ScheduleVO vo);

	public int updateScheduleReject(ScheduleVO vo);
	
	
	public int deleteSchedule(ScheduleVO vo);
	
	public ScheduleVO getSchedule(ScheduleVO vo);
	
	public List<Map<String, String>> getSearchSchedule(ScheduleVO vo);
	
	public List<Map> getSearchRequest(ScheduleVO vo);
	
	public List<Map> getSearchQuest(ScheduleVO vo);
	
	public int updateQuest(ScheduleVO vo);
	
	public ScheduleVO getQuest(ScheduleVO vo);
	
	public List<Map> getSearchMentoringDate(ScheduleVO vo);
	
	public List<ScheduleVO> replyQuestFormSom(ScheduleVO vo);

}
