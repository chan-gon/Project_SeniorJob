package com.company.manager.sum.service.impl;

import java.util.List;
import java.util.Map;

import com.company.manager.sum.DateVO;

import com.company.manager.sum.sumVO;

public interface manSumMapper {
	    //쇼핑 전체조회
		public List<sumVO> sumList(DateVO vo);
		
		//검색
		public List<sumVO> searchSum(String searchKeyword);
		
		//월별 매출 조회
		public List<sumVO> monsum(DateVO vo);
		
		//월 포함 매출 합계 
		public List<Map<String, Object>> summonth();

		
}
