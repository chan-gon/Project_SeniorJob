package com.company.certificate.service;

import java.util.List;

public interface CertificateService {
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
