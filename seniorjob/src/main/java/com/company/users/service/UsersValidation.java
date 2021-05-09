
package com.company.users.service;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class UsersValidation implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		
		return true;
	}

	@Override
	public void validate(Object target, Errors errors) {
		UsersVO users = (UsersVO)target;
		//login id check  
		if(users.getId() == null || users.getId().isEmpty()) {
			errors.rejectValue("id", null, "※아이디를 입력하세요.");
		}
		
		//login password check 	
		if(users.getPassword() == null || users.getPassword().isEmpty()) {
			errors.rejectValue("password", null, "※비밀번호를 입력하세요.");
		}
	}

}
