  package com.company.users.service;

import java.util.Date;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;


@Data
public class UsersVO { //회원테이블
	//(?=.*[0-9]) 숫자 적어도 하나, (?=.*[a-zA-Z]) 영문 대,소문자 중 적어도 하나, (?=.*\\W) 특수문자 적어도 하나, (?=\\S+$).{8,20} 공백제거, 적어도 8에서 20자 (https://victorydntmd.tistory.com/332)

	@NotEmpty(message="※아이디를 입력하세요.")
	//@Length(min=5, max = 10, message="※아이디는 최소 5에서 최대 10까지 입력 가능합니다.") 
	//@Pattern(regexp="(?=.*[a-zA-Z])(?=.*[0-9])(?=\\S+$).{5,10}", message="※아이디 생성시 대소문자와 숫자 조합으로 입력해주세요.")
	private String id; //아이디
	@NotEmpty(message="※비밀번호를 입력하세요.")
	@Length(min=4, max = 10, message="※패스워드는 최소 4에서 최대 10까지 입력 가능합니다.")
	@Pattern(regexp="(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{4,10}", message="※비밀번호는 영문 대,소문자와 숫자, 특수기호가 적어도 한 개 이상 포함 되도록 입력하시오.")
	private String password; //패스워드
	@NotEmpty(message="※우편번호를 입력하세요")
	private String postcode; //우편번호
	@NotEmpty(message="※주소를 입력하세요")
	private String address; //주소
	@NotEmpty(message="※상세주소를 입력하세요")
	private String detailaddress; //상세주소
	@NotEmpty(message="※참고항목을 입력하세요")
	private String extraaddress; //참고항목
	@NotEmpty(message="※전화번호를 입력하세요")
	//@Pattern(regexp="[0-9]{10,11}", message="※10~11자리 숫자만 입력가능합니다.")
	private String phonenum; //전화번호
	@NotEmpty(message="※이메일을 입력하세요.")
	//@Email(message="※이메일 양식을 지켜주세요.")
	private String email; //이메일
	@NotEmpty(message="※생일을 입력하세요")
	private String birth; //생년월일
	private String auth; //권한
	@NotEmpty(message="※이름을 입력하세요")
	private String name; //이름
	private Date log_date; //가입일
	private String distinction;
	private String accesstoken;
	
			//양소민 추가
			//비밀번호 변경 시 필요
			private String passwordold; //예전 비밀번호
			private String passwordck; //비밀번호 확인
		
			//자격증,경력증명서 등록,조회시 필요
			private String no; //자격증, 경력증명서 no
			private String certi_name;		//자격증명
			private String certi_place;		//발행처/기관
			private String certi_no;		//자격증번호
			private String certi_date;		//취득일
			private String carrer_certi;    //경력증명서
			
			//file타입의 값을 담을 vo
			private MultipartFile[] uploadFile;
}
