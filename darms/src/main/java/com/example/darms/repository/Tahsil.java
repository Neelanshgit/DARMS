package com.example.darms.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.example.darms.entity.Tahsils;

@Repository
public interface Tahsil extends JpaRepository<Tahsils, String> {
	@Transactional
    @Query(value = "Select tehsil_code_census, tname_eng, tname from up_tehsil_master where district_code_census=:distCode order by tname asc", nativeQuery = true)
    List<Tahsils> getDistTahsil(@Param("distCode") String distCode);
	
	@Transactional
    @Query(value = "Select tehsil_code_census, tname_eng, tname from up_tehsil_master order by tname asc", nativeQuery = true)
    List<Tahsils> getAllTehsil();
}
