package com.example.darms.entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.Entity;

@Entity
@Table(name="up_district_master")
@AllArgsConstructor
@NoArgsConstructor
@Data
@ToString
public class Districts {
	
	@Id
	private String districtCodeCensus;
	private String districtName;
	private String districtNameHindi;
	
	public String getDistrictCodeCensus() {
		return districtCodeCensus;
	}
	public void setDistrictCodeCensus(String districtCodeCensus) {
		this.districtCodeCensus = districtCodeCensus;
	}
	public String getDistrictName() {
		return districtName;
	}
	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}
	public String getDistrictNameHindi() {
		return districtNameHindi;
	}
	public void setDistrictNameHindi(String districtNameHindi) {
		this.districtNameHindi = districtNameHindi;
	}
	
}
