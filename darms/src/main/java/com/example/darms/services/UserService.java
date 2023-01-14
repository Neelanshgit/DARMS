package com.example.darms.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.darms.repository.User;
import com.example.darms.repository.User.UserList;

@Service
public class UserService {
	
	@Autowired
	User userModel;
	
	public Page<UserList> findAll(int pageNo, int pageSize, String tehsil_code, String user_id, String mobile_no){
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		Page<UserList> pagedata = userModel.findAllUsersWithPage(pageable, tehsil_code, user_id, mobile_no); //userModel.findAllUsersWithPage(pageable);
	    return pagedata;
	  }
}
