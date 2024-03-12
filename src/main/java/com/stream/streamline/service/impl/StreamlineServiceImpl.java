package com.stream.streamline.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.stream.streamline.model.*;
import com.stream.streamline.repository.Streamlinerepo;
import com.stream.streamline.service.StreamlineService;

@Service
public class StreamlineServiceImpl implements StreamlineService{
	

	@Autowired
	private Streamlinerepo repo;

	@Override
	public void addUser(SignUpModel e) {
		SignUpModel user = repo.save(e);
		System.out.println(user);
	}

}

