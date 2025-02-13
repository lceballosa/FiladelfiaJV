package com.newid.newid.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.newid.newid.models.NewIdAsistenciaPray;
import com.newid.newid.models.NewidJoven;

public interface NewIdAsistenciaPrayRepository extends JpaRepository<NewIdAsistenciaPray, Long>{

    List<NewIdAsistenciaPray> findByJoven(NewidJoven joven);
    
}
