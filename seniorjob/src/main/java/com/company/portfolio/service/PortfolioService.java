package com.company.portfolio.service;

import java.util.List;

public interface PortfolioService {
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
