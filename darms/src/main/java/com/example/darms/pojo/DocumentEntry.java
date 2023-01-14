package com.example.darms.pojo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Range;
import org.springframework.web.multipart.MultipartFile;


public class DocumentEntry {
	
	@NotNull(message = "Start page should not be blank")
	@Range(min = 1, message= "Start should be greater than 0")
	private Integer start_page;
	@NotBlank(message = "Document Type should not be blank")
	private String document_type;
	@NotNull(message = "End page should not be blank")
	@Range(min = 1, message= "End page should be greater than 0")
	private Integer end_page;
	@NotBlank(message = "Khasra Number should not be blank")
	private String khasra_number;
	@NotBlank(message = "Fasli Year should not be blank")
	private String fasli_year;
	@NotBlank(message = "Village should not be blank")
	private String village_code;
	@NotBlank(message = "Owner name should not be blank")
	private String owner_name;
	@NotBlank(message = "Father name should not be blank")
	private String father_name;
	@NotNull(message = "Compactor no. should not be blank")
	@Range(min = 1, message= "Compactor no. should not be blank")
	private Integer compactor_no;
	@NotNull(message = "Rack no. should not be blank")
	@Range(min = 1, message= "Rack no. should not be blank")
	private Integer rack_no;
	@NotNull(message = "Bundle no. should not be blank")
	@Range(min = 1, message= "Bundle no. should not be blank")
	private Integer bundle_no;
	@NotNull(message = "File name should not be blank")
	private MultipartFile upload;
	@NotNull(message = "Total pages should not be blank")
	@Range(min = 1, message= "Total pages should be greater than 0")
	private Integer total_pages;
	private String description;
	
	public DocumentEntry() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DocumentEntry(Integer start_page, String document_type, Integer end_page, String khasra_number,
			String fasli_year, String village_code, String owner_name, String father_name, Integer compactor_no, Integer rack_no, Integer bundle_no, MultipartFile upload,
			Integer total_pages, String description) {
		super();
		this.start_page = start_page;
		this.document_type = document_type;
		this.end_page = end_page;
		this.khasra_number = khasra_number;
		this.fasli_year = fasli_year;
		this.village_code = village_code;
		this.owner_name = owner_name;
		this.father_name = father_name;
		this.compactor_no = compactor_no;
		this.rack_no = rack_no;
		this.bundle_no = bundle_no;
		this.upload = upload;
		this.total_pages = total_pages;
		this.description = description;
	}

	public Integer getStart_page() {
		return start_page;
	}

	public void setStart_page(Integer start_page) {
		this.start_page = start_page;
	}

	public String getDocument_type() {
		return document_type;
	}

	public void setDocument_type(String document_type) {
		this.document_type = document_type;
	}

	public Integer getEnd_page() {
		return end_page;
	}

	public void setEnd_page(Integer end_page) {
		this.end_page = end_page;
	}

	public String getKhasra_number() {
		return khasra_number;
	}

	public void setKhasra_number(String khasra_number) {
		this.khasra_number = khasra_number;
	}
	
	public String getFasli_year() {
		return fasli_year;
	}

	public void setFasli_year(String fasli_year) {
		this.fasli_year = fasli_year;
	}

	public String getVillage_code() {
		return village_code;
	}

	public void setVillage_code(String village_code) {
		this.village_code = village_code;
	}
	
	public String getOwner_name() {
		return owner_name;
	}

	public void setOwner_name(String owner_name) {
		this.owner_name = owner_name;
	}
	
	public String getFather_name() {
		return father_name;
	}

	public void setFather_name(String father_name) {
		this.father_name = father_name;
	}

	public Integer getCompactor_no() {
		return compactor_no;
	}

	public void setCompactor_no(Integer compactor_no) {
		this.compactor_no = compactor_no;
	}

	public Integer getRack_no() {
		return rack_no;
	}

	public void setRack_no(Integer rack_no) {
		this.rack_no = rack_no;
	}

	public Integer getBundle_no() {
		return bundle_no;
	}

	public void setBundle_no(Integer bundle_no) {
		this.bundle_no = bundle_no;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

	public Integer getTotal_pages() {
		return total_pages;
	}

	public void setTotal_pages(Integer total_pages) {
		this.total_pages = total_pages;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "DocumentEntry [start_page=" + start_page + ", document_type=" + document_type + ", end_page=" + end_page
				+ ", khasra_number=" + khasra_number + ", fasli_year=" + fasli_year + ", village_code=" + village_code
				+ ", owner_name=" + owner_name + ", father_name=" + father_name + ", compactor_no=" + compactor_no
				+ ", rack_no=" + rack_no + ", bundle_no=" + bundle_no + ", upload=" + upload + ", total_pages="
				+ total_pages + ", description=" + description + "]";
	}
		
}

