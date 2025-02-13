package com.newid.newid.mapper;

import org.mapstruct.Mapper;

import com.newid.newid.dto.NewIdContactoDTO;
import com.newid.newid.models.NewIdContacto;


@Mapper
public interface NewIdContactoMapper {
        
        public NewIdContactoDTO toDTO(NewIdContacto entity);
        
        public NewIdContacto toEntity(NewIdContactoDTO dto);
}
