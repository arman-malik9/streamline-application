package com.stream.streamline.controller;

import javax.security.auth.login.LoginException;
import javax.security.auth.spi.LoginModule;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.stream.streamline.model.LogInModel;
import com.stream.streamline.model.SignUpModel;
import com.stream.streamline.service.StreamlineService;
import com.stream.streamline.service.impl.StreamlineServiceImpl;
import org.springframework.web.servlet.ModelAndView;


@Controller
//@RestController
public class IndexController {
	
	
	private StreamlineService service;
	
	@Autowired
	public IndexController(StreamlineService service) {
		this.service=service;
		}
	
	@GetMapping("/")
	public String homepage() {
		return "logIn";
	}
	
	@RequestMapping("/signUp")
	public String signUp(){
		return "signUp";
	}
	
	@PostMapping("/logIn")
	public String registeration(@RequestBody SignUpModel signmodel) {
//		String name = signmodel.getName();
//		String DOB = signmodel.getDob();
//		String email = signmodel.getEmail();
//		String password = signmodel.getPassword();
//		// You can customize the view name and add model attributes as needed
       
		System.out.println(signmodel);
		service.addUser(signmodel);
		return "logIn";
	}

	@PostMapping("/home")
	public String logIn(@ModelAttribute LogInModel loginmodel )
	{
		
		String email = loginmodel.getEmail();
		String passwd = loginmodel.getPassword();

		System.out.println(loginmodel);
		
		return "index";
	}
}