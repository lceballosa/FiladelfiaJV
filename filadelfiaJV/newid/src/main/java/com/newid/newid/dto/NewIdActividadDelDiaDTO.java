package com.newid.newid.dto;
import java.util.Date;
import java.util.List;

public class NewIdActividadDelDiaDTO {

    private Long id;
    private Long idNewIdTipoActividades;
    private Date fecha;
    private List<NewIdPassesDiaDTO> newidPassesDiaList;


    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public Date getFecha() {
        return this.fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }


    public Long getIdNewIdTipoActividades() {
        return this.idNewIdTipoActividades;
    }

    public void setIdNewIdTipoActividades(Long idNewIdTipoActividades) {
        this.idNewIdTipoActividades = idNewIdTipoActividades;
    }

    public List<NewIdPassesDiaDTO> getNewidPassesDiaList() {
        return this.newidPassesDiaList;
    }

    public void setNewidPassesDiaList(List<NewIdPassesDiaDTO> newidPassesDiaList) {
        this.newidPassesDiaList = newidPassesDiaList;
    }


    
}

