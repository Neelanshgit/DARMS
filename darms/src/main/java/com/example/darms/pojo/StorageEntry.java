package com.example.darms.pojo;

//import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Range;


public class StorageEntry {
	
	private String district_code;
	private String tehsil_code;
	@NotNull(message = "Total Compactors should not be blank")
	@Range(min = 1, message= "Total Compactors should be greater than 0")
	private int total_compactors;
	@NotNull(message = "Total Racks should not be blank")
	@Range(min = 1, message= "Total Compactors should be greater than 0")
	private int total_racks;
	@NotNull(message = "Total Bundles should not be blank")
	@Range(min = 1, message= "Total Compactors should be greater than 0")
	private int total_bundles;
	
	public StorageEntry() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public StorageEntry(String district_code, String tehsil_code, int total_compactors, int total_racks, int total_bundles) {
		super();
		this.district_code = district_code;
		this.tehsil_code = tehsil_code;
		this.total_compactors = total_compactors;
		this.total_racks = total_racks;
		this.total_bundles = total_bundles;
	}

	public String getDistrict_code() {
		return district_code;
	}

	public void setDistrict_code(String district_code) {
		this.district_code = district_code;
	}

	public String getTehsil_code() {
		return tehsil_code;
	}

	public void setTehsil_code(String tehsil_code) {
		this.tehsil_code = tehsil_code;
	}

	public int getTotal_compactors() {
		return total_compactors;
	}

	public void setTotal_compactors(int total_compactors) {
		this.total_compactors = total_compactors;
	}

	public int getTotal_racks() {
		return total_racks;
	}

	public void setTotal_racks(int total_racks) {
		this.total_racks = total_racks;
	}

	public int getTotal_bundles() {
		return total_bundles;
	}

	public void setTotal_bundles(int total_bundles) {
		this.total_bundles = total_bundles;
	}

	@Override
	public String toString() {
		return "StorageEntry [district_code=" + district_code + ", tehsil_code=" + tehsil_code + ", total_compactors="
				+ total_compactors + ", total_racks=" + total_racks + ", total_bundles=" + total_bundles + "]";
	}
	
	
}

