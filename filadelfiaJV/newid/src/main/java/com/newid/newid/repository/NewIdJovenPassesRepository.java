package com.newid.newid.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.newid.newid.models.NewIdJovenPasses;
import com.newid.newid.models.NewidJoven;

public interface NewIdJovenPassesRepository extends JpaRepository<NewIdJovenPasses, Long>{

    NewIdJovenPasses findByJoven(NewidJoven newidJoven);

    List<NewIdJovenPasses> findAllByJoven(NewidJoven newidJoven);
    
}
