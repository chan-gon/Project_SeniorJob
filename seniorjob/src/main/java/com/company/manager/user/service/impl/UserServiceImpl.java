package com.company.manager.user.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.manager.user.userVO;
import com.company.manager.user.service.UserService;
import com.company.manager.utils.ManSearchCriteria;


@Service
public class UserServiceImpl implements UserService {

	@Autowired manUserMapper dao;
	
	@Override
	public List<userVO> getUserList(userVO vo) {
		
		return dao.getUserList(vo);
	}

	@Override
	public int updateUserProc(userVO vo) {
		
		return dao.updateUserProc(vo);
	}

	@Override
	public int deleteUser(userVO vo) {
		
		return dao.deleteUser(vo);
	}

	@Override
	public void authUser(userVO vo) {
		
		 dao.authUser(vo);
	}

	@Override
	public List<userVO> userList(ManSearchCriteria scri) {
		
		return dao.userList(scri);
	}

	@Override
	public int userCount(ManSearchCriteria scri) {
		
		return dao.userCount(scri);
	}

	@Override
	public List<userVO> searchUser(String searchKeyword) {
		
		return dao.searchUser(searchKeyword);
	}

	@Override
	public void authDownUser(userVO vo) {
		
		dao.authDownUser(vo);
	
	}

	@Override
	public List<Map<String, Object>> mentorSys() {
		
		return dao.mentorSys();
	}

	

	
	
	

}
