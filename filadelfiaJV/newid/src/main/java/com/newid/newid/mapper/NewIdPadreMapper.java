package com.newid.newid.mapper;

import org.mapstruct.Mapper;

import com.newid.newid.dto.NewidJovenDTO;
import com.newid.newid.dto.NewidPadreDTO;
import com.newid.newid.models.NewidPadre;

@Mapper
public interface NewIdPadreMapper {

    public NewidPadre padreDTOToPadre(NewidPadreDTO padreDTO);
    public NewidPadreDTO padreToPadreDTO(NewidPadre padre);
    
}
