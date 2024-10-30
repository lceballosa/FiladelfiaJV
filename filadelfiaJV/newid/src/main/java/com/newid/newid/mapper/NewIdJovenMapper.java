package com.newid.newid.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import com.newid.newid.dto.NewidJovenDTO;
import com.newid.newid.models.NewidJoven;
import java.util.List;

@Mapper
public interface NewIdJovenMapper {

    @Mapping(source = "mentor.id", target = "idMentor")
    @Mapping(source = "mentor.abreviatura", target = "abreviaturaMentor")
    @Mapping(source = "grupoEdad.id", target = "idGrupoEdad")
    @Mapping(source = "grupoEdad.grupoEdad", target = "grupoEdad")
    public NewidJovenDTO jovenToJovenDTO(NewidJoven joven);
    public List<NewidJovenDTO> jovenesToJovenesDTO(List<NewidJoven> jovenes);

    @Mapping(source = "idMentor", target = "mentor.id")
    @Mapping(source = "idGrupoEdad", target = "grupoEdad.id")
    public NewidJoven jovenDTOToJoven(NewidJovenDTO joven);
    
}
