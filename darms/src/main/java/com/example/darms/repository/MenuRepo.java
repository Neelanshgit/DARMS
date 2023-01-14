package com.example.darms.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.darms.entity.Menus;
@Repository
public interface MenuRepo extends JpaRepository<Menus, String>  {
	
	Menus findById(long id);
	
	@Transactional
    @Query(value = "select m.*, pm.name as pmenu from menus m left join menus pm on m.parent_id = pm.id order by id desc", nativeQuery = true)
    List<MenuList> getAllMenus();
	
	@Transactional
    @Query(value = "select * from menus where parent_id=0 order by name asc", nativeQuery = true)
    List<Menus> getMenuOptions();
	
	@Transactional
    @Query(value = "select * from menus where parent_id=:id order by name asc", nativeQuery = true)
    List<Menus> getSubMenuOptions(@Param("id") Long id);
	
	@Transactional
	@Query(value = "select * from menus where id=:id", nativeQuery = true)
	Menus getMenuById(@Param("id") Integer id);
	
	@Transactional
    @Query(value = "select m.*, pm.name as pmenu from menus m left join menus pm on m.parent_id = pm.id where cast(m.id AS TEXT) IN (:menuArray) order by name_eng asc", nativeQuery = true)
    List<MenuList> getAccessPermission_old(@Param("menuArray") String[] menuArray);
	
	@Transactional
    @Query(value = "select m.* from menus m where m.parent_id = 0 and cast(m.id AS TEXT) IN (:menuArray) order by name_eng asc", nativeQuery = true)
    List<MenuList> getAccessPermission(@Param("menuArray") String[] menuArray);
	
	interface MenuList {
		long getId();
		Integer getParent_id();
		String getPmenu();
		String getName();
		String getName_eng();
		boolean getStatus();
		String getMapped_url();
	}
	
	interface AccessList {
		long getId();
		String getPmenu();
		String getName();
		String getName_eng();
		boolean getStatus();
		String getMapped_url();
	}
}
