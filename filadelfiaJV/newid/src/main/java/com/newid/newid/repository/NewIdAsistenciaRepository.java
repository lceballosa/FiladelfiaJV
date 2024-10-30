package com.newid.newid.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.newid.newid.models.NewIdAsistencia;
import com.newid.newid.models.NewidJoven;

public interface NewIdAsistenciaRepository extends JpaRepository<NewIdAsistencia, Long>{

    List<NewIdAsistencia> findByJoven(NewidJoven joven);
    
}
