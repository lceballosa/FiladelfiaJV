package com.newid.newid.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.newid.newid.models.NewidMentor;

public interface NewIdMentorRepository extends JpaRepository<NewidMentor, Long>{

    NewidMentor findByAbreviatura(String abreviaturaMentor);
    
}
