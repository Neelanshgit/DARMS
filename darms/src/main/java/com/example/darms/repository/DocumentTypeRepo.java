package com.example.darms.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.darms.entity.DocumentTypes;
@Repository
public interface DocumentTypeRepo extends JpaRepository<DocumentTypes, String>  {
	
	DocumentTypes findById(long id);
	
	@Transactional
    @Query(value = "select * from up_documenttype_master order by id desc", nativeQuery = true)
    List<DocumentTypes> getAllDocumentTypes();
	
	@Transactional
    @Query(value = "select * from up_documenttype_master order by name asc", nativeQuery = true)
    List<DocumentTypes> getDocumentTypeOptions();
	
	@Transactional
	@Query(value = "select * from up_documenttype_master where code=:code", nativeQuery = true)
	DocumentTypes getDocumentTypeByCode(@Param("code") Integer code);
}
