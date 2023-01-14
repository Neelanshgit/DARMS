package com.example.darms.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.darms.entity.Documents;

//import com.example.darms.pojo.UserList;
@Repository
public interface DocumentRepo extends JpaRepository<Documents, String> {
	
	Documents findById(long id);

	@Query(value = "SELECT * FROM Documents ORDER BY id", countQuery = "SELECT count(*) FROM Documents", nativeQuery = true)
	List<Documents> findAllDocumentsWithPagination(Pageable pageable);

	@Transactional
	@Query(value = "SELECT d.id, t.name, d.start_page, d.end_page, d.village_code, d.khasra_number, d.fasli_year, d.owner_name, d.father_name, d.compactor_no, d.rack_no, d.bundle_no, d.file_name, d.total_pages, d.created_at, d.created_by FROM documents d left join up_village_master v on d.village_code = v.village_code_census left join up_documenttype_master t on d.document_type = cast(t.code AS TEXT) ORDER BY d.id desc", countQuery = "SELECT count(*) FROM Documents", nativeQuery = true)
	Page<DocumentList> findAllDocumentsWithPage(Pageable pageable);
	
	@Transactional
	@Query(value = "SELECT d.id, t.name, d.start_page, d.end_page, v.vname_eng, v.vname, d.khasra_number, d.fasli_year, d.owner_name, d.father_name, d.compactor_no, d.rack_no, d.bundle_no, d.file_name, d.total_pages, d.created_at, d.created_by FROM documents d left join up_village_master v on d.village_code = v.village_code_census left join up_documenttype_master t on d.document_type = cast(t.code AS TEXT) where d.forwarded=false and d.created_by=:userid ORDER BY d.id desc", countQuery = "SELECT count(*) FROM Documents where forwarded=false and created_by=:userid", nativeQuery = true)
	Page<DocumentList> findNonForwardedDocumentsWithPage(Pageable pageable, int userid);
	
	@Transactional
	@Query(value = "SELECT d.id, t.name, d.start_page, d.end_page, v.vname_eng, v.vname, d.khasra_number, d.fasli_year, d.owner_name, d.father_name, d.compactor_no, d.rack_no, d.bundle_no, d.file_name, d.total_pages, d.created_at, d.created_by, u.name as username FROM documents d left join up_village_master v on d.village_code = v.village_code_census left join users u on d.created_by = u.id left join up_documenttype_master t on d.document_type = cast(t.code AS TEXT) where d.forwarded=true and d.approved=false and d.rejected=false and d.created_by in(select id from users where user_type_id=:userTypeId and login_type_id=:loginTypeId and district_code=:districtCode and tehsil_code=:tehsilCode) ORDER BY d.id desc", countQuery = "SELECT count(*) FROM documents where forwarded=true and approved=false and rejected=false and created_by in(select id from users where user_type_id=:userTypeId and login_type_id=:loginTypeId and district_code=:districtCode and tehsil_code=:tehsilCode)", nativeQuery = true)
	Page<DocumentList> findForwardedDocumentsWithPage(Pageable pageable, int userTypeId, int loginTypeId, String districtCode, String tehsilCode);
	
	@Transactional
	@Query(value = "SELECT d.id, t.name, d.start_page, d.end_page, v.vname_eng, v.vname, d.khasra_number, d.fasli_year, d.owner_name, d.father_name, d.compactor_no, d.rack_no, d.bundle_no, d.file_name, d.total_pages, d.created_at, d.created_by FROM documents d left join up_village_master v on d.village_code = v.village_code_census left join up_documenttype_master t on d.document_type = cast(t.code AS TEXT) where d.forwarded=true and d.approved=true and d.created_by=:userid and d.document_type LIKE :doc_type% and d.khasra_number LIKE :khasra_number% ORDER BY d.id desc", countQuery = "SELECT count(*) FROM documents where forwarded=true and approved=true and created_by=:userid and document_type LIKE :doc_type% and khasra_number LIKE :khasra_number%", nativeQuery = true)
	Page<DocumentList> findApprovedDocumentsWithPage(Pageable pageable, int userid, String doc_type, String khasra_number);
	
	@Transactional
	@Query(value = "SELECT d.id, t.name, d.start_page, d.end_page, v.vname_eng, v.vname, d.khasra_number, d.fasli_year, d.owner_name, d.father_name, d.compactor_no, d.rack_no, d.bundle_no, d.file_name, d.total_pages, d.created_at, d.created_by FROM documents d left join up_village_master v on d.village_code = v.village_code_census left join up_documenttype_master t on d.document_type = cast(t.code AS TEXT) where d.forwarded=true and d.approved=true and d.created_by in(select id from users where user_type_id=:userTypeId and login_type_id=:loginTypeId and district_code=:districtCode and tehsil_code=:tehsilCode) and d.document_type LIKE :doc_type% and d.khasra_number LIKE :khasra_number% ORDER BY d.id desc", countQuery = "SELECT count(*) FROM documents where forwarded=true and approved=true and created_by in(select id from users where user_type_id=:userTypeId and login_type_id=:loginTypeId and district_code=:districtCode and tehsil_code=:tehsilCode) and document_type LIKE :doc_type% and khasra_number LIKE :khasra_number%", nativeQuery = true)
	Page<DocumentList> findTehsilApprovedDocumentsWithPage(Pageable pageable, int userTypeId, int loginTypeId, String districtCode, String tehsilCode, String doc_type, String khasra_number);
	
	@Transactional
	@Query(value = "SELECT d.id, t.name, d.start_page, d.end_page, v.vname_eng, v.vname, d.khasra_number, d.fasli_year, d.owner_name, d.father_name, d.compactor_no, d.rack_no, d.bundle_no, d.file_name, d.total_pages, d.created_at, d.created_by FROM documents d left join up_village_master v on d.village_code = v.village_code_census left join up_documenttype_master t on d.document_type = cast(t.code AS TEXT) where d.forwarded=true and d.approved=true and d.document_type LIKE :doc_type% and d.khasra_number LIKE :khasra_number% ORDER BY d.id desc", countQuery = "SELECT count(*) FROM documents where forwarded=true and approved=true and document_type LIKE :doc_type% and khasra_number LIKE :khasra_number%", nativeQuery = true)
	Page<DocumentList> findAllApprovedDocumentsWithPage(Pageable pageable, String doc_type, String khasra_number);
	
	@Transactional
	@Query(value = "SELECT d.id, t.name, d.start_page, d.end_page, v.vname_eng, v.vname, d.khasra_number, d.fasli_year, d.owner_name, d.father_name, d.compactor_no, d.rack_no, d.bundle_no, d.file_name, d.total_pages, d.created_at, d.created_by, u.name as username FROM documents d left join up_village_master v on d.village_code = v.village_code_census  left join users u on d.created_by = u.id left join up_documenttype_master t on d.document_type = cast(t.code AS TEXT) where d.forwarded=true and d.approved=false and d.rejected=false and d.id=:id", nativeQuery = true)
	DocumentList findDocumentById(long id);
	
	interface DocumentList {
		long getId();
		String getName();
		String getStart_page();
		String getEnd_page();
		String getVname_eng();
		String getVname();
		String getKhasra_number();
		String getFasli_year();
		String getOwner_name();
		String getFather_name();
		int getCompactor_no();
		int getRack_no();
		int getBundle_no();
		String getFile_name();
		int getTotal_pages();
		String getCreated_at();
		int getCreated_by();
		String getUsername();
	}
}
