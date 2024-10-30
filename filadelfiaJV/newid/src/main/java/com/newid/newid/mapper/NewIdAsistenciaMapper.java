package com.newid.newid.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import com.newid.newid.dto.NewIdAsistenciaDTO;
import com.newid.newid.models.NewIdAsistencia;

@Mapper
public interface NewIdAsistenciaMapper {

    @Mapping(source = "joven.telefono", target = "idJoven")
    public NewIdAsistenciaDTO asistenciaToAsistenciaDTO(NewIdAsistencia asistencia);
    
    @Mapping(source = "idJoven", target = "joven.telefono")
    public NewIdAsistencia asistenciaDTOToAsistencia(NewIdAsistenciaDTO asistencia);
    
}
