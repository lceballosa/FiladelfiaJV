package com.newid.newid.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.newid.newid.models.NewIdSeguridad;

public interface NewIdSeguiridadRepository  extends JpaRepository<NewIdSeguridad, Long>{

    NewIdSeguridad findByContrasenia(String password);
    
}
