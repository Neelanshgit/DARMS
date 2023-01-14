package com.example.darms.entity;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="up_village_master")
public class Villages {
	
	@Id
	private String villageCodeCensus;
	private String vnameEng;
	private String vname;
	
	public Villages() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Villages(String villageCodeCensus, String vnameEng, String vname) {
		super();
		this.villageCodeCensus = villageCodeCensus;
		this.vnameEng = vnameEng;
		this.vname = vname;
	}

	public String getVillageCodeCensus() {
		return villageCodeCensus;
	}

	public void setVillageCodeCensus(String villageCodeCensus) {
		this.villageCodeCensus = villageCodeCensus;
	}

	public String getVnameEng() {
		return vnameEng;
	}

	public void setVnameEng(String vnameEng) {
		this.vnameEng = vnameEng;
	}

	public String getVname() {
		return vname;
	}

	public void setVname(String vname) {
		this.vname = vname;
	}

	@Override
	public String toString() {
		return "Villages [villageCodeCensus=" + villageCodeCensus + ", vnameEng=" + vnameEng + ", vname=" + vname + "]";
	}
	
}
