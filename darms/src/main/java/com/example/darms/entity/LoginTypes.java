package com.example.darms.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="up_logintype_master")
public class LoginTypes {
	
	@Id
	private int code;
	private String name;
	private String type;
	
	public LoginTypes() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LoginTypes(int code, String name, String type) {
		super();
		this.code = code;
		this.name = name;
		this.type = type;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "LoginTypes [code=" + code + ", name=" + name + ", type=" + type + "]";
	}

}
