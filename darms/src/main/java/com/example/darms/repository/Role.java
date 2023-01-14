package com.example.darms.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.darms.entity.Roles;

@Repository
public interface Role extends JpaRepository<Roles, String>  {
	
	Roles findById(long id);
	
	@Transactional
    @Query(value = "select menus from roles where role_id=:id", nativeQuery = true)
    String getMenusByRole(@Param("id") int id);
	
	@Transactional
    @Query(value = "select * from roles where role_id=:id", nativeQuery = true)
    Roles getRoleByRoleId(@Param("id") int id);
	
}
