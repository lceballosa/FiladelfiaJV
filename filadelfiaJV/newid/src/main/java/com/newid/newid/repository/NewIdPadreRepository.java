package com.newid.newid.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.newid.newid.models.NewIdContacto;
import com.newid.newid.models.NewidPadre;

public interface NewIdPadreRepository extends JpaRepository<NewidPadre, String>{
    
}
