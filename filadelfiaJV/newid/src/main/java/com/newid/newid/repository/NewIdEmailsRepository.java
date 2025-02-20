package com.newid.newid.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.newid.newid.models.NewIdEmails;

public interface NewIdEmailsRepository extends JpaRepository<NewIdEmails, Long>{
    
}
