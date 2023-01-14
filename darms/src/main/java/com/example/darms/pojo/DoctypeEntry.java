package com.example.darms.pojo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Range;


public class DoctypeEntry {
	
	@NotNull(message = "Doc Type Code should not be blank")
	@Range(min = 1, message= "Doc Type Code should be number greater than 0")
	private Integer code;
	@NotBlank(message = "Doc Type Name should not be blank")
	private String name;
	@NotBlank(message = "Please select Type")
	private String type;
	
	public DoctypeEntry() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public DoctypeEntry(Integer code, String name, String type) {
		super();
		this.code = code;
		this.name = name;
		this.type = type;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
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
		return "DoctypeEntry [code=" + code + ", name=" + name + ", type=" + type + "]";
	}
	
}

