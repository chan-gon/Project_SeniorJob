package com.company.resume.service;

import java.util.List;

import com.company.certificate.service.CertificateVO2;
import com.company.portfolio.service.PortfolioVO;
import com.company.self_info.service.Self_InfoVO;

import lombok.Data;
@Data
public class ResumeRequestVO {
	List<Self_InfoVO> slist;
	List<CertificateVO2> clist;
	List<PortfolioVO> plist;
}
