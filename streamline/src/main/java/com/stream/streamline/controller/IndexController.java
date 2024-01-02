package com.stream.streamline.controller;
<<<<<<< HEAD
=======

import javax.security.auth.login.LoginException;
import javax.security.auth.spi.LoginModule;
>>>>>>> bef9bec669803d2d4fdc4285e8088ce027a97645

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.stream.streamline.model.LogInModel;
import com.stream.streamline.model.SignUpModel;


@Controller
public class IndexController {
	
	@GetMapping("/")
	public String homepage() {
		return "login";
	}
	
	@RequestMapping("/signUp")
	public String signUp(){
		return "signUp";
	}
	
	@PostMapping("/logIn")
	public String registeration(@ModelAttribute SignUpModel signmodel) {
		String name = signmodel.getName();
		String DOB = signmodel.getDOB();
		String email = signmodel.getEmail();
		String password = signmodel.getPassword();
		
		System.out.println(signmodel);
		
		return "logIn";
	}

	@PostMapping("/home")
<<<<<<< HEAD
	public String registeration(@ModelAttribute LogInModel loginmodel )
	{	
=======
	public String logIn(@ModelAttribute LogInModel loginmodel )
	{
		
>>>>>>> bef9bec669803d2d4fdc4285e8088ce027a97645
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
