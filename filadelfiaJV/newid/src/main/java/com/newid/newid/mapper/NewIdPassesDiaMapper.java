package com.newid.newid.mapper;

import java.util.List;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import com.newid.newid.dto.NewIdPassesDiaDTO;
import com.newid.newid.models.NewIdPassesDia;

@Mapper
public interface NewIdPassesDiaMapper {

    @Mapping(source = "idPasse", target = "passe.id")
    @Mapping(source = "passe", target = "passe.tipo")
    @Mapping(source = "idActividadDelDia", target = "actividadDelDia.id")
    public NewIdPassesDia newIdPassesDiaToNewIdPassesDiaDTO(NewIdPassesDiaDTO newIdPassesDiaDTO);
    public List<NewIdPassesDia> newIdPassesDiasToNewIdPassesDiaDTOs(List<NewIdPassesDiaDTO> newIdPassesDiaDTO);


    @Mapping(source = "passe.id", target = "idPasse")
    @Mapping(source = "passe.tipo", target = "passe")
    @Mapping(source = "actividadDelDia.id", target = "idActividadDelDia")
    public NewIdPassesDiaDTO newIdPassesDiaDTOToNewIDPassesDia(NewIdPassesDia newIdPassesDia);
    public List<NewIdPassesDiaDTO> newIdPassesDiasToNewIDPassesDiaDTOs(List<NewIdPassesDia> newIdPassesDia);


    
}
