package com.newid.newid.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.newid.newid.models.NewIdActividadDelDia;
import com.newid.newid.models.NewIdPassesDia;

public interface NewIdPassesDiaRepository extends JpaRepository<NewIdPassesDia, Long>{

    List<NewIdPassesDia> findByActividadDelDia(NewIdActividadDelDia newIdActividadDelDiaModel);
    
}
