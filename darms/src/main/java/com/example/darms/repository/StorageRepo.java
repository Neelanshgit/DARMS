package com.example.darms.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.darms.entity.StorageInfo;

@Repository
public interface StorageRepo extends JpaRepository<StorageInfo, String>  {
	
	@Transactional
	@Query(value = "SELECT * FROM storage_info where district_code=:districtCode and tehsil_code=:tehsilCode", nativeQuery = true)
	StorageInfo getStorageByTehsil(@Param("districtCode") String districtCode, @Param("tehsilCode") String tehsilCode);
	
	@Transactional
	@Query(value = "SELECT s.*, t.tname_eng, t.tname, d.district_name, d.district_name_hindi FROM storage_info s left join 	up_tehsil_master t on s.tehsil_code = t.tehsil_code_census left join up_district_master d on s.district_code = 	d.district_code_census ORDER BY d.district_name asc", nativeQuery = true)
	List<StorageDetail> getStorageDetail();
	
	interface StorageDetail {
		long getId();
		String getDistrict_code();
		String getTehsilCode();
		Integer getTotal_bundles();
		Integer getTotal_compactors();
		String getTotal_racks();
		String getTname_eng();
		String getTname();
		String getDistrict_name();
		String getDistrict_name_hindi();
	}
	
}
