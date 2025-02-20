package com.newid.newid.mapper;

import java.util.List;

import org.mapstruct.Mapper;

import com.newid.newid.dto.NewIdJovenPassesDTO;
import com.newid.newid.models.NewIdJovenPasses;

@Mapper
public interface NewIdJovenPassesMapper {
    
    public NewIdJovenPassesDTO jovenPassesToJovenPassesDTO(NewIdJovenPasses jovenPasses);
    public List<NewIdJovenPassesDTO> jovenPassesToJovenPassesDTO(List<NewIdJovenPasses> jovenPasses);

    public NewIdJovenPasses jovenPassesDTOToJovenPasses(NewIdJovenPassesDTO jovenPasses);

}
