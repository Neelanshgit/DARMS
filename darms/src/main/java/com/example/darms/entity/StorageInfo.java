package com.example.darms.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.springframework.lang.NonNull;

@Entity
@SequenceGenerator(initialValue = 1, name = "idgen", sequenceName = "storage_seq", allocationSize = 1)
@Table(name="storage_info")
public class StorageInfo extends DataObject {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7526472295622776147L;
	@Id
	@NonNull
	private long id;
	private String district_code;
	private String tehsil_code;
	private int total_compactors;
	private int total_racks;
	private int total_bundles;
	
	public StorageInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public StorageInfo(String district_code, String tehsil_code, int total_compactors, int total_racks,
			int total_bundles) {
		super();
		this.district_code = district_code;
		this.tehsil_code = tehsil_code;
		this.total_compactors = total_compactors;
		this.total_racks = total_racks;
		this.total_bundles = total_bundles;
	}

	public StorageInfo(long id, String district_code, String tehsil_code, int total_compactors, int total_racks,
			int total_bundles) {
		super();
		this.id = id;
		this.district_code = district_code;
		this.tehsil_code = tehsil_code;
		this.total_compactors = total_compactors;
		this.total_racks = total_racks;
		this.total_bundles = total_bundles;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
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
		return "StorageInfo [id=" + id + ", district_code=" + district_code + ", tehsil_code=" + tehsil_code
				+ ", total_compactors=" + total_compactors + ", total_racks=" + total_racks + ", total_bundles="
				+ total_bundles + "]";
	}
	
	
	
}
