package com.company.users.service;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.company.users.service.impl.UsersMapper;
@Service
public class UsersServiceImpl implements UsersService {

	@Autowired UsersMapper usersmapper;
	@Inject BCryptPasswordEncoder pwdEncoder;
	
	//비밀번호 찾기 이메일발송
	@Override
	public void sendEmail(UsersVO vo, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "testapi123";
		String hostSMTPpwd = "ip000793*";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "testapi123@naver.com";
		String fromName = "SeniorJob";
		String subject = "";
		String msg = "";

		if(div.equals("findpw")) {
			subject = "[SeniorJob] 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getPassword() + "</p></div>";
		}
		
		// 받는 사람 E-Mail 주소
		String mail = vo.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587); //네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	//비밀번호찾기
	@Override
	public void findPw(HttpServletResponse response, UsersVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		UsersVO ck = usersmapper.getUsers(vo);
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		if(ck == null) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if(!vo.getEmail().equals(ck.getEmail())) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			//password를 vo에 담는다.
			vo.setPassword(pw);
			//password를 암호화 하여 DB에 담는다.
			pw = pwdEncoder.encode(pw);
			ck.setPassword(pw);
			// DB에 비밀번호 업데이트
			usersmapper.updateInfo(ck);
			// 비밀번호 변경 메일 발송(암호화 전)
			sendEmail(vo, "findpw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}

	
	
	
	@Override
	public List<UsersVO> getUsersList() {
		
		return usersmapper.getUsersList();
	}

	@Override
	public int insertUsers(UsersVO vo) {
		
		return usersmapper.insertUsers(vo);
	}

	@Override
	public int updateUsers(UsersVO vo) {
		
		return usersmapper.updateUsers(vo);
	}

	@Override
	public int deleteUsers(UsersVO vo) {
		
		return usersmapper.deleteUsers(vo);
	}

	@Override
	public UsersVO getUsers(UsersVO vo) {
		
		return usersmapper.getUsers(vo);
	}

	@Override
	public UsersVO logCheck(UsersVO vo) {
		
		return usersmapper.logCheck(vo);
	}

	@Override
	public int idCheck(UsersVO vo) {
		
		return usersmapper.idCheck(vo);
	}

	
	@Override
	public int emailCheck(String email) {
		
		return usersmapper.emailCheck(email);
	}
	
	@Override
	public UsersVO kakaoCheck(UsersVO vo) {
		
		return usersmapper.kakaoCheck(vo);
	}

	@Override
	public int updateInfo(UsersVO vo) throws Exception {
		return usersmapper.updateInfo(vo);
	}

	@Override
	public int insertCerti(UsersVO vo) {
		return usersmapper.insertCerti(vo);
	}

	@Override
	public int updateUsersProc(UsersVO vo) {
		return usersmapper.updateUsersProc(vo);
	}

	@Override
	public List<Map> getCertiList(UsersVO vo) {
		return usersmapper.getCertiList(vo);
	}
	
	// 김찬곤 / 단건 조회
	public List<UsersVO> getUsersForPayment(Map<String, Object> map) {
		return usersmapper.getUsersForPayment(map);
	}

	@Override
	public UsersVO selCareer(UsersVO vo) {
		return usersmapper.selCareer(vo);
	}

	@Override
	public int delCareer(UsersVO vo) {
		return usersmapper.delCareer(vo);
	}

	@Override
	public List<Map> getCarList(UsersVO vo) {
		return usersmapper.getCarList(vo);
	}
	
	@Override	public int updateCerti(UsersVO vo) {		return usersmapper.updateCerti(vo);	}

	@Override
	public int deleteCerti(UsersVO vo) {
		return usersmapper.deleteCerti(vo);
	}

	@Override
	public UsersVO getCerti(UsersVO vo) {
		return usersmapper.getCerti(vo);
	}
	//아이디 찾기(이메일, 전화번호)

	@Override
	public List<UsersVO> findId(UsersVO vo) {
		
		return usersmapper.findId(vo);
	}
	
	
}
