package com.example.darms.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@SequenceGenerator(initialValue = 1, name = "codegen", sequenceName = "usertypes_seq", allocationSize = 1)
@Table(name="up_usertype_master")
public class UserTypes extends DataObjectTwo {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7526472295622776147L;
	@Id
	private int code;
	private String name;
	
	public UserTypes() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserTypes(int code, String name) {
		super();
		this.code = code;
		this.name = name;
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
	
	@Override
	public String toString() {
		return "UserTypes [code=" + code + ", name=" + name + "]";
	}

}
