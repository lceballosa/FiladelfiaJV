package com.newid.newid.mapper;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import com.newid.newid.dto.NewIdSeguimientoDTO;
import com.newid.newid.models.NewIdSeguimiento;

@Mapper
public interface NewIdSeguimientoMapper {
    

    @Mapping(source = "joven.telefono", target = "idJoven")
    public NewIdSeguimientoDTO seguimientoToSeguimientoDTO(NewIdSeguimiento seguimiento);

    @Mapping(source = "idJoven", target = "joven.telefono")
    public NewIdSeguimiento seguimientoDTOToSeguimiento(NewIdSeguimientoDTO seguimiento);
}

