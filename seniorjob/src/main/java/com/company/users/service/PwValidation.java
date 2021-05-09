package com.company.users.service;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class PwValidation implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		UsersVO users = (UsersVO)target;

		
		
		//password 체크
		if(users.getPasswordold() == null || users.getPasswordold().isEmpty())
			errors.rejectValue("passwordold", null, "※패스워드를 입력해주세요");
		//password 체크
		if(users.getPassword() == null || users.getPassword().isEmpty())
			errors.rejectValue("password", null, "※패스워드를 입력해주세요");
		//password확인 체크
		if(users.getPasswordck() == null || users.getPasswordck().isEmpty())
			errors.rejectValue("passwordck", null, "※패스워드를 입력해주세요");
		//비밀번호 일치여부
		if(users.getPassword() == users.getPasswordck())
			errors.rejectValue("passwordold", null, "※현재 사용중인 비밀번호와 다른 비밀번호를 입력해주세요.");
		//비밀번호 일치여부
		if(users.getPassword() != users.getPasswordck())
			errors.rejectValue("passwordck", null, "※비밀번호가 일치하지 않습니다.");
		

	}

}
