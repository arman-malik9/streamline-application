package com.stream.streamline.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.stream.streamline.model.LogInModel;


@Controller
public class IndexController {
	
	@GetMapping("/")
	public String logIn() {
		return "logIn";
	}

	@PostMapping("/home")
	public String registeration(@ModelAttribute LogInModel loginmodel )
	{	
		String email = loginmodel.getEmail();
		String passwd = loginmodel.getPassword();
		System.out.println(loginmodel);
		return "index";
	}
	@PostMapping("/signup")
	public String singup(@ModelAttribute LogInModel loginmodel )
	{	
		String email = loginmodel.getEmail();
		String passwd = loginmodel.getPassword();
		System.out.println(loginmodel);
		return "singUp";
	}
}
