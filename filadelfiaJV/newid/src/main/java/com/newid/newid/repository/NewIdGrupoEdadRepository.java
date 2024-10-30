package com.newid.newid.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.newid.newid.models.NewIdGrupoEdad;

public interface NewIdGrupoEdadRepository extends JpaRepository<NewIdGrupoEdad, Long>{

    @Query(value= "select * from newid_grupoedad where :anios between valor_minimo and valor_maximo", nativeQuery=true)
    NewIdGrupoEdad findGroup(int anios);
    
}
