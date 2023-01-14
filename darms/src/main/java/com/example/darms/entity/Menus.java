package com.example.darms.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import org.springframework.lang.NonNull;

@Entity
@SequenceGenerator(initialValue = 1, name = "idgen", sequenceName = "menu_seq", allocationSize = 1)
public class Menus extends DataObject {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7526472295622776147L;
	@Id
	@NonNull
	private long id;
	@Column(nullable = true)
	private int parentId;
	private String name;
	private String nameEng;
	private Timestamp created;
	private boolean status;
	@Column(nullable = true)
	private String mappedUrl;
	
	public Menus() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Menus(long id, int parentId, String name, String nameEng, Timestamp created, boolean status, String mappedUrl) {
		super();
		this.id = id;
		this.parentId = parentId;
		this.name = name;
		this.nameEng = nameEng;
		this.created = created;
		this.status = status;
		this.mappedUrl = mappedUrl;
	}
	
	public Menus(int parentId, String name, String nameEng, Timestamp created, boolean status, String mappedUrl) {
		super();
		this.parentId = parentId;
		this.name = name;
		this.nameEng = nameEng;
		this.created = created;
		this.status = status;
		this.mappedUrl = mappedUrl;
	}
	
	public Menus(long id, int parentId, String name, String nameEng) {
		super();
		this.id = id;
		this.parentId = parentId;
		this.name = name;
		this.nameEng = nameEng;
	}
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
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
	public String getMappedUrl() {
		return mappedUrl;
	}
	public void setMappedUrl(String mappedUrl) {
		this.mappedUrl = mappedUrl;
	}

	@Override
	public String toString() {
		return "Menus [id=" + id + ", parentId=" + parentId + ", name=" + name + ", nameEng=" + nameEng + ", created="
				+ created + ", status=" + status + ", mappedUrl=" + mappedUrl + "]";
	}
	
}
