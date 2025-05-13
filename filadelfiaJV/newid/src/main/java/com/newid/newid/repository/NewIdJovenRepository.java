package com.newid.newid.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.newid.newid.models.NewidJoven;

public interface NewIdJovenRepository extends JpaRepository<NewidJoven, String> {

    @Query(value= "select j from NewidJoven j where LOWER(j.nombreCompleto) like LOWER(CONCAT('%', :nombre, '%')) ")
    List<NewidJoven> findJoven( @Param("nombre") String nombre);
    
}
