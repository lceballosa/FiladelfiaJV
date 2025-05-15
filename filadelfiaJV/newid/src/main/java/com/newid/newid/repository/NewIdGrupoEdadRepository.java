package com.newid.newid.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.newid.newid.models.NewIdGrupoEdad;

public interface NewIdGrupoEdadRepository extends JpaRepository<NewIdGrupoEdad, Long>{

    @Query("SELECT g FROM NewIdGrupoEdad g WHERE :anios BETWEEN g.valorMinimo AND g.valorMaximo")
    NewIdGrupoEdad findGroup(int anios);
    
}

