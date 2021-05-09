package com.company.mentor.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.company.mentor.service.MentorSearchVO;
import com.company.mentor.service.MentorService;
import com.company.mentor.service.MentorVO;
import com.company.portfolio.service.FileRenamePolicy;
@Service
public class MentorServiceImpl implements MentorService {
	
	@Autowired MentorMapper mentorMapper;

//	--------------------------------------------------------김찬곤-----------------------------------------------------------------------------------------------------
	
	// 전체검색 / 지역 검색 / 직무 검색
	@Override
	public List<MentorVO> getMentorList(MentorVO vo) {
		return mentorMapper.getMentorList(vo);
	}

	// 키워드 검색
	@Override
	public List<MentorVO> getKeywordSearch(MentorVO vo) {
		return mentorMapper.getKeywordSearch(vo);

	}

	// 멘토 직무 검색
	@Override
	public List<MentorVO> getSearchMentorDuty(MentorVO vo) {
		return mentorMapper.getSearchMentorDuty(vo);
	}

	// 멘토 상세 페이지(단건 조회)
	@Override
	public MentorVO getMentor(MentorVO vo) {
		return mentorMapper.getMentor(vo);
	}

	// 멘토 등록
	@Override
	public void MentorRegisterProc(MentorVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
		// 이미지 업로드
		MultipartFile photoFile = vo.getMentor_photo_file(); // 멘토 사진 파일
		//MultipartFile licenseFile = vo.getMentor_license_file(); // 멘토 자격증 파일
		//MultipartFile careerFile = vo.getMentor_career_certificate_file(); // 멘토 경력 인증 파일
		
		if( photoFile != null && !photoFile.isEmpty() && photoFile.getSize() > 0
		   // && licenseFile != null && !licenseFile.isEmpty() && licenseFile.getSize() > 0
		   // && careerFile != null && !careerFile.isEmpty() && careerFile.getSize() > 0 
				) {
			
			// 파일 이름만 추출
			String photoFileName = photoFile.getOriginalFilename();
			//String licenseFileName = licenseFile.getOriginalFilename();
			//String careerFileName = careerFile.getOriginalFilename();
			
			// 파일 저장소 경로 확인
			String path = request.getServletContext().getRealPath("image");
			System.out.println("나의경로 ===================== " + request.getServletContext().getRealPath("image"));
			
			// 파일 이름 중복 처리
			// 동일 파일 처리 시 파일 이름 뒤에 숫자 삽입
			File photoRename = FileRenamePolicy.rename(new File(path, photoFileName));
			//File licenseRename = FileRenamePolicy.rename(new File(path, licenseFileName));
			//File careerRename = FileRenamePolicy.rename(new File(path, careerFileName));
			
			// 저장소에 파일 저장
			photoFile.transferTo(new File(path, photoRename.getName()));
			//licenseFile.transferTo(new File(path, licenseRename.getName()));
			//careerFile.transferTo(new File(path, careerRename.getName()));
			
			// DB에 파일 이름만 저장
			vo.setMentor_photo(photoFileName);
			//vo.setMentor_license(licenseFileName);
			//vo.setMentor_career_certificate(careerFileName);
			
			mentorMapper.MentorRegisterProc(vo);
		}
	}

	// 멘토 등록 중복 체크
	@Override
	public MentorVO mentorRegisterCheck(MentorVO vo){
		return mentorMapper.mentorRegisterCheck(vo);
	}

	// 멘토 페이징1
	@Override
	public int getCountMentor() {
		return mentorMapper.getCountMentor();
	}

	// 멘토 페이징2 + 멘토 전체 리스트 조회
	@Override
	public List<MentorVO> getSearchMentor(MentorSearchVO vo) {
		return mentorMapper.getSearchMentor(vo);
	}
	
	// 멘토리스트 상세 검색: 최신순
	@Override
	public List<MentorVO> getMentorByDate(MentorVO vo) {
		return mentorMapper.getMentorByDate(vo);
	}
	
	// 멘토리스트 상세 검색: 인기순
	@Override
	public List<MentorVO> getMentorByFollow(MentorVO vo) {
		return mentorMapper.getMentorByFollow(vo);
	}
	// 멘토 팔로우 클릭 시 멘토 팔로우 숫자 추가_김찬곤
	@Override
	public void getUpdateFNumPlus(MentorVO vo) {
	}
	// 멘토 팔로우 클릭 시 멘토 팔로우 숫자 제거_김찬곤
	@Override
	public void getUpdateFNumMinus(MentorVO vo) {
	}
	
//	-------------------------------------------------------- End of 김찬곤-----------------------------------------------------------------------------------------------------

	@Override
	public String getMentorId(MentorVO vo) {
		return mentorMapper.getMentorId(vo);
	}

	@Override
	public String getMentorName(String menId) {
		return mentorMapper.getMentorName(menId);
	}
}
