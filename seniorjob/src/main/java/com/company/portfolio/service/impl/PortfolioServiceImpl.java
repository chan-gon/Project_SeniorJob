package com.company.portfolio.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.portfolio.service.PortfolioService;
import com.company.portfolio.service.PortfolioVO;
@Service
public class PortfolioServiceImpl implements PortfolioService{

	@Autowired PortfolioMapper portmapper;
	
	@Override
	public List<PortfolioVO> getSearchPortList() {
		return portmapper.getSearchPortList();
	}

	@Override
	public int insertPort(PortfolioVO vo) {
		return portmapper.insertPort(vo);
	}

	@Override
	public int deletePort(PortfolioVO vo) {
		return portmapper.deletePort(vo);
	}

	@Override
	public int updatePort(PortfolioVO vo) {
		return portmapper.updatePort(vo);
	}

	@Override
	public List<PortfolioVO> getPort(PortfolioVO vo) {
		return portmapper.getPort(vo);
	}

}
