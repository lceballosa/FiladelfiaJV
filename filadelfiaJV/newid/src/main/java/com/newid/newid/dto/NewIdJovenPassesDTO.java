package com.newid.newid.dto;

import java.util.Date;

import com.newid.newid.models.NewIdPasse;
import com.newid.newid.models.NewidJoven;

import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

public class NewIdJovenPassesDTO {
    
    private Long id;
    private String idJoven;
    private Long idPasse;
    private Date fecha;


    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getIdJoven() {
        return this.idJoven;
    }

    public void setIdJoven(String idJoven) {
        this.idJoven = idJoven;
    }

    public Long getIdPasse() {
        return this.idPasse;
    }

    public void setIdPasse(Long idPasse) {
        this.idPasse = idPasse;
    }

    public Date getFecha() {
        return this.fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

}
