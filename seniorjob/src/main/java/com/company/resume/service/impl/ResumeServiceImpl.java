package com.company.resume.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.company.certificate.service.CertificateVO2;
import com.company.certificate.service.impl.CertificateMapper;
import com.company.portfolio.service.FileRenamePolicy;
import com.company.portfolio.service.PortfolioVO;
import com.company.portfolio.service.impl.PortfolioMapper;
import com.company.resume.service.ResumeService;
import com.company.resume.service.ResumeVO;
import com.company.self_info.service.Self_InfoVO;
import com.company.self_info.service.impl.Self_InfoMapper;

@Service
public class ResumeServiceImpl implements ResumeService {

	@Autowired
	ResumeMapper resumemapper;
	@Autowired
	CertificateMapper certimapper;
	@Autowired
	Self_InfoMapper selfmapper;
	@Autowired
	PortfolioMapper portmapper;

	@Override
	public List<ResumeVO> getSearchResumeList(ResumeVO vo) {
		return resumemapper.getSearchResumeList(vo);
	}

	@Override
	public void insertResume(ResumeVO vo, List<CertificateVO2> clist, List<Self_InfoVO> slist, PortfolioVO portvo, HttpServletRequest req)
			throws IllegalStateException, IOException {
// 		이력서 
		// image 업로드(RESUME)
		MultipartFile file = vo.getUploadFile();
		if (file != null && !file.isEmpty() && file.getSize() > 0) {
			String image = file.getOriginalFilename();
			String path = req.getServletContext().getRealPath("image");
			// DB에 담기
			vo.setImage(image);
			file.transferTo(new File(path, image));
		}
		resumemapper.insertResume(vo);
//		자기소개서
		for (Self_InfoVO selfvo : slist) {
			if (selfvo.getSelf_name() != null && !selfvo.getSelf_name().isEmpty()) {
				selfvo.setResume_no(vo.getResume_no());
				selfmapper.insertSelf(selfvo);
			}
		}
//		자격증
		for (CertificateVO2 certivo : clist) {
			if (certivo.getCerti_name() != null && !certivo.getCerti_name().isEmpty()) {
				certivo.setResume_no(vo.getResume_no());
				certimapper.insertCerti(certivo);
			}
		}
		// portfolio 업로드 저장
		MultipartFile[] ports = portvo.getPortFile();
		for (MultipartFile port : ports) {
			if (port != null && !port.isEmpty() && port.getSize() > 0) {
				String portfolio = port.getOriginalFilename();
				String path = req.getServletContext().getRealPath("image");
				File rename = FileRenamePolicy.rename(new File(path, portfolio));
				port.transferTo(new File(path, rename.getName()));

				PortfolioVO portsvo = new PortfolioVO();
				portsvo.setPortfolio(rename.getName());
				portsvo.setResume_no(vo.getResume_no());
				portmapper.insertPort(portsvo);
			}
		}
	}

	@Override
	public void updateResuem(ResumeVO vo, List<CertificateVO2> clist, List<Self_InfoVO> slist, PortfolioVO portvo, HttpServletRequest req) 
			throws IllegalStateException, IOException {
		//삭제
		resumemapper.deleteResume(vo);
// 		이력서 
		// image 업로드(RESUME)
		MultipartFile file = vo.getUploadFile();
		if (file != null && !file.isEmpty() && file.getSize() > 0) {
			String image = file.getOriginalFilename();
			String path = req.getServletContext().getRealPath("image");
			// DB에 담기
			vo.setImage(image);
			file.transferTo(new File(path, image));
		}
		resumemapper.insertResume(vo);
//		자기소개서
		if(slist != null ) {
			for (Self_InfoVO selfvo : slist) {
				if (selfvo.getSelf_name() != null && !selfvo.getSelf_name().isEmpty()) {
					selfvo.setResume_no(vo.getResume_no());
					selfmapper.insertSelf(selfvo);
				}
			}
		}
//		자격증
		if(clist != null ) {
			for (CertificateVO2 certivo : clist) {
				if (certivo.getCerti_name() != null && !certivo.getCerti_name().isEmpty()) {
					certivo.setResume_no(vo.getResume_no());
					certimapper.insertCerti(certivo);
				}
			}
		}
		// portfolio 업로드 저장
		MultipartFile[] ports = portvo.getPortFile();
		for (MultipartFile port : ports) {
			if (port != null && !port.isEmpty() && port.getSize() > 0) {
				String portfolio = port.getOriginalFilename();
				String path = req.getServletContext().getRealPath("image");
				File rename = FileRenamePolicy.rename(new File(path, portfolio));
				port.transferTo(new File(path, rename.getName()));

				PortfolioVO portsvo = new PortfolioVO();
				portsvo.setPortfolio(rename.getName());
				portsvo.setResume_no(vo.getResume_no());
				portmapper.insertPort(portsvo);
			}
		}
	}

	@Override
	public int deleteResume(ResumeVO vo) {
		return resumemapper.deleteResume(vo);
	}

	@Override
	public ResumeVO getResume(ResumeVO vo) {
		return resumemapper.getResume(vo);
	}

	@Override
	public int ckReUpdateSom(ResumeVO vo) {
		return resumemapper.ckReUpdateSom(vo);
	}

	@Override
	public List<ResumeVO> checkR(ResumeVO vo) {
		return resumemapper.checkR(vo);
	}

	@Override
	public int colReUpdate(ResumeVO vo) {
		return resumemapper.colReUpdate(vo);
	}

}
