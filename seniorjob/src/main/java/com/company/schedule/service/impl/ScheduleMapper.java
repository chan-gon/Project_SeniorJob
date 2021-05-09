package com.company.schedule.service.impl;

import java.util.List;
import java.util.Map;

import com.company.schedule.service.ScheduleVO;

public interface ScheduleMapper {

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
	
	public String replyQuestBadge(ScheduleVO vo);
	
	public int renameResumeNo(ScheduleVO vo);
}
