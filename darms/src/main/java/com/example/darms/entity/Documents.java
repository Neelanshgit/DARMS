package com.example.darms.entity;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import org.springframework.lang.NonNull;

@Entity
@SequenceGenerator(initialValue = 1, name = "idgen", sequenceName = "documents_seq", allocationSize = 1)
public class Documents extends DataObject {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7526472295622776147L;
	@Id
	@NonNull
	private long id;
	private Integer startPage;
	private String documentType;
	private Integer endPage;
	private String khasraNumber;
	private String fasliYear;
	private String villageCode;
	private String ownerName;
	private String fatherName;
	private Integer compactorNo;
	private Integer rackNo;
	private Integer bundleNo;
	private String fileName;
	private Integer totalPages;
	private String description;
	private int createdBy;
	private Timestamp createdAt;
	private int modifiedBy;
	private Timestamp modifiedAt;
	private boolean status;
	private boolean forwarded;
	private boolean approved;
	private boolean rejected;
	
	public Documents() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Documents(Integer startPage, String documentType, Integer endPage, String khasraNumber,
			String fasliYear, String villageCode, String ownerName, String fatherName, Integer compactorNo, Integer rackNo, Integer bundleNo,
			String fileName, Integer totalPages, String description, int createdBy, Timestamp createdAt, int modifiedBy,
			Timestamp modifiedAt, boolean status, boolean forwarded, boolean approved, boolean rejected) {
		super();
		this.startPage = startPage;
		this.documentType = documentType;
		this.endPage = endPage;
		this.khasraNumber = khasraNumber;
		this.fasliYear = fasliYear;
		this.villageCode = villageCode;
		this.ownerName = ownerName;
		this.fatherName = fatherName;
		this.compactorNo = compactorNo;
		this.rackNo = rackNo;
		this.bundleNo = bundleNo;
		this.fileName = fileName;
		this.totalPages = totalPages;
		this.description = description;
		this.createdBy = createdBy;
		this.createdAt = createdAt;
		this.modifiedBy = modifiedBy;
		this.modifiedAt = modifiedAt;
		this.status = status;
		this.forwarded = forwarded;
		this.approved = approved;
		this.rejected = rejected;
	}
	
	public Documents(long id, Integer startPage, String documentType, Integer endPage, String khasraNumber,
			String fasliYear, String villageCode, String ownerName, String fatherName, Integer compactorNo, Integer rackNo, Integer bundleNo,
			String fileName, Integer totalPages, String description, int createdBy, Timestamp createdAt, int modifiedBy,
			Timestamp modifiedAt, boolean status, boolean forwarded, boolean approved, boolean rejected) {
		super();
		this.id = id;
		this.startPage = startPage;
		this.documentType = documentType;
		this.endPage = endPage;
		this.khasraNumber = khasraNumber;
		this.fasliYear = fasliYear;
		this.villageCode = villageCode;
		this.ownerName = ownerName;
		this.fatherName = fatherName;
		this.compactorNo = compactorNo;
		this.rackNo = rackNo;
		this.bundleNo = bundleNo;
		this.fileName = fileName;
		this.totalPages = totalPages;
		this.description = description;
		this.createdBy = createdBy;
		this.createdAt = createdAt;
		this.modifiedBy = modifiedBy;
		this.modifiedAt = modifiedAt;
		this.status = status;
		this.forwarded = forwarded;
		this.approved = approved;
		this.rejected = rejected;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	
	public String getDocumentType() {
		return documentType;
	}

	public void setDocumentType(String documentType) {
		this.documentType = documentType;
	}

	
	public String getKhasraNumber() {
		return khasraNumber;
	}

	public Integer getStartPage() {
		return startPage;
	}

	public void setStartPage(Integer startPage) {
		this.startPage = startPage;
	}

	public Integer getEndPage() {
		return endPage;
	}

	public void setEndPage(Integer endPage) {
		this.endPage = endPage;
	}

	public void setKhasraNumber(String khasraNumber) {
		this.khasraNumber = khasraNumber;
	}

	public String getFasliYear() {
		return fasliYear;
	}

	public void setFasliYear(String fasliYear) {
		this.fasliYear = fasliYear;
	}

	public String getVillageCode() {
		return villageCode;
	}

	public void setVillageCode(String villageCode) {
		this.villageCode = villageCode;
	}
	
	public String getOwnerName() {
		return ownerName;
	}
	
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	
	public String getFatherName() {
		return fatherName;
	}
	
	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}

	public Integer getCompactorNo() {
		return compactorNo;
	}

	public void setCompactorNo(Integer compactorNo) {
		this.compactorNo = compactorNo;
	}

	public Integer getRackNo() {
		return rackNo;
	}

	public void setRackNo(Integer rackNo) {
		this.rackNo = rackNo;
	}

	public Integer getBundleNo() {
		return bundleNo;
	}

	public void setBundleNo(Integer bundleNo) {
		this.bundleNo = bundleNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Integer getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(Integer totalPages) {
		this.totalPages = totalPages;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public int getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(int modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	public Timestamp getModifiedAt() {
		return modifiedAt;
	}

	public void setModifiedAt(Timestamp modifiedAt) {
		this.modifiedAt = modifiedAt;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public boolean isForwarded() {
		return forwarded;
	}

	public void setForwarded(boolean forwarded) {
		this.forwarded = forwarded;
	}
	public boolean isApproved() {
		return forwarded;
	}
	public void setApproved(boolean approved) {
		this.approved = approved;
	}
	public boolean isRejected() {
		return rejected;
	}
	public void setRejected(boolean rejected) {
		this.rejected = rejected;
	}

	@Override
	public String toString() {
		return "Documents [id=" + id + ", startPage=" + startPage + ", documentType=" + documentType + ", endPage="
				+ endPage + ", khasraNumber=" + khasraNumber + ", fasliYear=" + fasliYear + ", villageCode="
				+ villageCode + ", ownerName=" + ownerName + ", fatherName=" + fatherName + ", compactorNo="
				+ compactorNo + ", rackNo=" + rackNo + ", bundleNo=" + bundleNo + ", fileName=" + fileName
				+ ", totalPages=" + totalPages + ", description=" + description + ", createdBy=" + createdBy
				+ ", createdAt=" + createdAt + ", modifiedBy=" + modifiedBy + ", modifiedAt=" + modifiedAt + ", status="
				+ status + ", forwarded=" + forwarded + ", approved=" + approved + ", rejected=" + rejected + "]";
	}
	
	
}
