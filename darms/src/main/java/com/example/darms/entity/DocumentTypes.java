package com.example.darms.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.lang.NonNull;

@Entity
@Table(name="up_documenttype_master")
public class DocumentTypes {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@NonNull
	private long id;
	private Integer code;
	private String name;
	private String type;
	private boolean status;
	public DocumentTypes() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DocumentTypes(Integer code, String name, String type, boolean status) {
		super();
		this.code = code;
		this.name = name;
		this.type = type;
		this.status = status;
	}
	public DocumentTypes(long id, Integer code, String name, String type, boolean status) {
		super();
		this.id = id;
		this.code = code;
		this.name = name;
		this.type = type;
		this.status = status;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
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
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "DocumentTypes [id=" + id + ", code=" + code + ", name=" + name + ", type=" + type + ", status=" + status
				+ "]";
	}
	
	
}
