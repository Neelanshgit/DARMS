package com.example.darms.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.darms.entity.Districts;
@Repository
public interface District extends JpaRepository<Districts, String>  {

	@Transactional
    @Query(value = "select district_name_hindi, district_code_census, district_name from up_district_master order by district_name", nativeQuery = true)
    List<Districts> getAllDistricts();
	
	
}
