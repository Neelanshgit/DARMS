package com.example.darms.pojo;

import javax.persistence.Column;
import javax.validation.constraints.NotBlank;

public class MenuEntry {
	
	@Column(nullable=true)
	private Integer parent_id;
	@NotBlank(message = "Name (Hindi) should not be blank")
	private String name;
	@NotBlank(message = "Name (English) should not be blank")
	private String name_eng;
	@Column(nullable=true)
	private String mapped_url;
	
	public MenuEntry() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MenuEntry(Integer parent_id, String name, String name_eng, String mapped_url) {
		super();
		this.parent_id = parent_id;
		this.name = name;
		this.name_eng = name_eng;
		this.mapped_url = mapped_url;
	}

	public Integer getParent_id() {
		return parent_id;
	}

	public void setParent_id(Integer parent_id) {
		this.parent_id = parent_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName_eng() {
		return name_eng;
	}
	
	public void setName_eng(String name_eng) {
		this.name_eng = name_eng;
	}

	public String getMapped_url() {
		return mapped_url;
	}
	
	public void setMapped_url(String mapped_url) {
		this.mapped_url = mapped_url;
	}
	
	@Override
	public String toString() {
		return "MenuEntry [parent_id=" + parent_id + ", name=" + name + ", name_eng=" + name_eng + ", mapped_url="
				+ mapped_url + "]";
	}
	
}

