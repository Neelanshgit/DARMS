package com.example.darms.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.darms.entity.Villages;
@Repository
public interface Village extends JpaRepository<Villages, String> {
	@Transactional
    @Query(value = "Select village_code_census, vname_eng, vname from up_village_master where pargana_code_new=:parganaCode order by vname_eng asc", nativeQuery = true)
    List<Villages> getParganaVillage(@Param("parganaCode") String parganaCode);
	
	@Transactional
    @Query(value = "Select village_code_census, vname_eng, vname from up_village_master where tehsil_code_census=:tehsilCode order by vname_eng asc", nativeQuery = true)
    List<Villages> getTehsilVillage(@Param("tehsilCode") String tehsilCode);
	
	@Transactional
    @Query(value = "Select village_code_census, vname_eng, vname from up_village_master where village_code_census=:villageCode", nativeQuery = true)
    Villages getVillagebyId(@Param("villageCode") String villageCode);
}
