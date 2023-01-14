package com.example.darms.entity;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="up_tehsil_master")
public class Tahsils {
	
	@Id
	private String tehsilCodeCensus;
	private String tnameEng;
	private String tname;
	
	public Tahsils() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Tahsils(String tehsilCodeCensus, String tnameEng, String tname) {
		super();
		this.tehsilCodeCensus = tehsilCodeCensus;
		this.tnameEng = tnameEng;
		this.tname = tname;
	}
	public String getTehsilCodeCensus() {
		return tehsilCodeCensus;
	}
	public void setTehsilCodeCensus(String tehsilCodeCensus) {
		this.tehsilCodeCensus = tehsilCodeCensus;
	}
	public String getTnameEng() {
		return tnameEng;
	}
	public void setTnameEng(String tnameEng) {
		this.tnameEng = tnameEng;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	@Override
	public String toString() {
		return "Tahsils [tehsilCodeCensus=" + tehsilCodeCensus + ", tnameEng=" + tnameEng + ", tname=" + tname + "]";
	}
	
}
