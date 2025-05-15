package com.newid.newid.dto;
import java.util.Date;
import java.util.List;

public class NewIdActividadDelDiaDTO {

    private Long id;
    private Long idNewIdTipoActividades;
    private String actividadDia;
    private Date fecha;
    private List<NewIdPassesDiaDTO> newidPassesDiaList;
    private String idJoven;



    public String getIdJoven() {
        return this.idJoven;
    }

    public void setIdJoven(String idJoven) {
        this.idJoven = idJoven;
    }


    public String getActividadDia() {
        return this.actividadDia;
    }

    public void setActividadDia(String actividadDia) {
        this.actividadDia = actividadDia;
    }

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

