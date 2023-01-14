package com.example.darms.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.darms.entity.Users;

//import com.example.darms.pojo.UserList;
@Repository
public interface User extends JpaRepository<Users, String> {
	
	Users findById(long id);

	@Query(value = "SELECT * FROM Users ORDER BY id", countQuery = "SELECT count(*) FROM Users", nativeQuery = true)
	List<Users> findAllUsersWithPagination(Pageable pageable);

	@Transactional
	@Query(value = "SELECT u.id, u.name, u.mobile, u.user_id, t.tname_eng, t.tname, d.district_name, d.district_name_hindi, lt.name as 	logintype, ut.name as usertype, r.name as rolename, u.created_at FROM users u left join up_usertype_master ut on 	u.user_type_id = ut.code left join up_logintype_master lt on u.login_type_id = lt.code left join up_tehsil_master t on 	u.tehsil_code = t.tehsil_code_census left join up_district_master d on u.district_code = d.district_code_census left join 	roles r on 	u.role_id = r.role_id where u.tehsil_code LIKE :tehsil_code% and u.user_id LIKE :user_id% and u.mobile LIKE :mobile_no% ORDER BY u.id desc", countQuery = "SELECT count(*) FROM Users where tehsil_code LIKE :tehsil_code% and user_id LIKE :user_id% and mobile LIKE :mobile_no%", nativeQuery = true)
	Page<UserList> findAllUsersWithPage(Pageable pageable, String tehsil_code, String user_id, String mobile_no);

	@Transactional
	@Query(value = "Select password from users where user_id=:userId and user_type_id=:userType", nativeQuery = true)
	String getUserPassword(@Param("userId") String userId, @Param("userType") int userType);

	@Transactional
	@Query(value = "SELECT u.id, u.name, u.password, u.user_id, u.role_id, t.tname_eng, t.tname, d.district_name, d.district_name_hindi, lt.name as logintype, ut.name as usertype, r.name as rolename, u.created_at FROM users u left join 	up_usertype_master ut on u.user_type_id = ut.code left join up_logintype_master lt on u.login_type_id = lt.code left join 	up_tehsil_master t on u.tehsil_code = t.tehsil_code_census left join up_district_master d on u.district_code = 	d.district_code_census left join roles r on u.role_id = r.role_id where u.user_id=:userId and u.user_type_id=:userType", 	nativeQuery = true)
	UserDetail getUserDetail(@Param("userId") String userId, @Param("userType") int userType);
	
	@Transactional
	@Query(value = "SELECT u.id, u.name, u.password, u.user_id, u.role_id, t.tname_eng, t.tname, d.district_name, d.district_name_hindi, lt.name as logintype, ut.name as usertype, r.name as rolename, u.created_at FROM users u left join 	up_usertype_master ut on u.user_type_id = ut.code left join up_logintype_master lt on u.login_type_id = lt.code left join 	up_tehsil_master t on u.tehsil_code = t.tehsil_code_census left join up_district_master d on u.district_code = 	d.district_code_census left join roles r on u.role_id = r.role_id where u.user_id=:userId and u.user_type_id=:userType and u.login_type_id=:loginType and u.district_code=:distCode and u.tehsil_code=:tehsilCode", 	nativeQuery = true)
	UserDetail getUserLoginDetail(@Param("userId") String userId, @Param("userType") int userType, @Param("loginType") int loginType, @Param("distCode") String distCode, @Param("tehsilCode") String tehsilCode);
	
	interface UserDetail {
		long getId();
		String getName();
		String getPassword();
		String getUser_id();
		String getTname_eng();
		String getTname();
		String getDistrict_name();
		String getDistrict_name_hindi();
		String getUsertype();
		String getLogintype();
		int getRole_id();
		String getRolename();
	}
	
	interface UserList {
		long getId();
		String getName();
		String getMobile();
		String getUser_id();
		String getTname_eng();
		String getTname();
		String getDistrict_name();
		String getDistrict_name_hindi();
		String getUsertype();
		String getLogintype();
		String getRolename();
		String getCreated_at();
	}
	

}
