package com.stream.streamline.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="Entries")

public class SignUpModel {
	
	@Id 
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	
	private int id;
	private String name;
	private String dob;
	private String email;
	private String password;
	
	public SignUpModel() {
	super();
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String DOB) {
		this.dob = DOB;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "SignUpModel [name="+ name + ", dob="+ dob + ", email=" + email + ", password=" + password + "]";
	}
}
