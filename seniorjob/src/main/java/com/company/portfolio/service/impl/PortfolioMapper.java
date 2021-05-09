package com.company.portfolio.service.impl;

import java.util.List;

import com.company.portfolio.service.PortfolioVO;

public interface PortfolioMapper {
	//전체조회
	public List<PortfolioVO> getSearchPortList();
	//등록
	public int insertPort(PortfolioVO vo);
	//삭제
	public int deletePort(PortfolioVO vo);
	//수정
	public int updatePort(PortfolioVO vo);
	//단건 조회
	public List<PortfolioVO> getPort(PortfolioVO vo);
}
