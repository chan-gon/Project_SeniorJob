package com.company.certificate.service.impl;

import java.util.List;

import com.company.certificate.service.CertificateVO2;

//import com.company.certificate.service.CertificateVO;


public interface CertificateMapper {
	//전체조회
	public List<CertificateVO2> getSearchCertiList();
	//등록
	public int insertCerti(CertificateVO2 vo);
	//수정
	public int updateCerti(CertificateVO2 vo);
	//삭제
	public int deleteCerti(CertificateVO2 vo);
	//단건 조회
	public List<CertificateVO2> getCerti(CertificateVO2 vo);
}
