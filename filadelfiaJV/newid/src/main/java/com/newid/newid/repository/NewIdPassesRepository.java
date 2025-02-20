package com.newid.newid.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.newid.newid.models.NewIdPasse;
import com.newid.newid.models.NewidPadre;

public interface NewIdPassesRepository extends JpaRepository<NewIdPasse, Long>{
    
}
