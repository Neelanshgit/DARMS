package com.example.darms.entity;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import org.springframework.lang.NonNull;

@Entity
public class Roles {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@NonNull
	private long id;
	private int role_id;
	private String name;
	private String nameEng;
	private Timestamp created;
	private boolean status;
	private String menus;
	
	public Roles() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Roles(long id, int role_id, String name, String nameEng, Timestamp created, boolean status, String menus) {
		super();
		this.id = id;
		this.role_id = role_id;
		this.name = name;
		this.nameEng = nameEng;
		this.created = created;
		this.status = status;
		this.menus = menus;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNameEng() {
		return nameEng;
	}
	public void setNameEng(String nameEng) {
		this.nameEng = nameEng;
	}
	public Timestamp getCreated() {
		return created;
	}
	public void setCreated(Timestamp created) {
		this.created = created;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public void setMenus(String menus) {
		this.menus = menus;
	}
	public String getMenus() {
		return menus;
	}
	@Override
	public String toString() {
		return "Roles [id=" + id + ", role_id=" + role_id + ", name=" + name + ", nameEng=" + nameEng + ", created="
				+ created + ", status=" + status + ", menus=" + menus + "]";
	}
	
	
}
