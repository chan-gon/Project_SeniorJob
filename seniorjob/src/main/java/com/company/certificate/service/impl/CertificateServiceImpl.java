package com.company.certificate.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.certificate.service.CertificateService;
import com.company.certificate.service.CertificateVO2;
@Service
public class CertificateServiceImpl implements CertificateService{

	@Autowired CertificateMapper certimapper;
	
	@Override
	public List<CertificateVO2> getSearchCertiList() {
		return certimapper.getSearchCertiList();
	}

	@Override
	public int insertCerti(CertificateVO2 vo) {
		return certimapper.insertCerti(vo);
	}

	@Override
	public int updateCerti(CertificateVO2 vo) {
		return certimapper.updateCerti(vo);
	}

	@Override
	public int deleteCerti(CertificateVO2 vo) {
		return certimapper.deleteCerti(vo);
	}

	@Override
	public List<CertificateVO2> getCerti(CertificateVO2 vo) {
		return certimapper.getCerti(vo);
	}

}
