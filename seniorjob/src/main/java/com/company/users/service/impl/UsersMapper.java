package com.company.users.service.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.company.users.service.UsersVO;

public interface UsersMapper {
	
	public List<UsersVO> getUsersList();	//전체조회
	public int insertUsers(UsersVO vo);		//등록
	public int updateUsers(UsersVO vo);		//수정
	public int deleteUsers(UsersVO vo);		//삭제
	public UsersVO getUsers(UsersVO vo);	//단건조회
	public UsersVO logCheck(UsersVO vo);    //로그인
	public int idCheck(UsersVO vo); //아이디 중복체크
	//이메일발송
	public void sendEmail(UsersVO vo, String div) throws Exception;
	//아이디 찾기 (전화번호, 이메일) 
	public List<UsersVO> findId(UsersVO vo);
	//비밀번호찾기
	public void findPw(HttpServletResponse resp, UsersVO vo) throws Exception;
	// 패스워드 변경
	// 회원정보 변경
	public int updateInfo(UsersVO vo) throws Exception;
	
	public int insertCerti(UsersVO vo); //자격증/경력인증서 등록
	public int emailCheck(String email); //email 중복체크 
	public UsersVO kakaoCheck(UsersVO vo); //카카오로그인체크
	
	public List<UsersVO> getUsersForPayment(Map<String, Object> map); // 김찬곤 / 단건 조회
	public int updateUsersProc(UsersVO vo); //개인정보 수정 처리, 양소민 추가
	public List<Map> getCertiList(UsersVO vo); //자격증, 경력증명서 조회
	public List<Map> getCarList(UsersVO vo); //자격증, 경력증명서 조회
	public UsersVO selCareer(UsersVO vo); //경력인증서 파일 이름 가져오기
	public int delCareer(UsersVO vo); //경력인증서 삭제
	public UsersVO getCerti(UsersVO vo); //자격증 단건조회
	public int updateCerti(UsersVO vo);		//수정
	public int deleteCerti(UsersVO vo); //경력인증서 삭제
}
