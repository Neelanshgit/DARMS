package com.example.darms.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.darms.entity.LoginTypes;
@Repository
public interface LoginType extends JpaRepository<LoginTypes, String>  {

	@Transactional
    @Query(value = "select code, name, type from up_logintype_master where type=:type order by name", nativeQuery = true)
    List<LoginTypes> getAllLoginTypes(@Param("type") String type);
}
