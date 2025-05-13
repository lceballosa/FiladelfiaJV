package com.newid.newid.dto;

import com.newid.newid.models.NewIdActividadDelDia;

public class NewIdPassesDiaDTO {


    private Long id;

    private Long idPasse;

    private String passe;

    private Long puntos;

    private Long idActividadDelDia;



    public String getPasse() {
        return this.passe;
    }

    public void setPasse(String passe) {
        this.passe = passe;
    }

    public Long getIdPasse() {
        return this.idPasse;
    }

    public void setIdPasse(Long idPasse) {
        this.idPasse = idPasse;
    }


    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getPuntos() {
        return this.puntos;
    }

    public void setPuntos(Long puntos) {
        this.puntos = puntos;
    }


    public Long getIdActividadDelDia() {
        return this.idActividadDelDia;
    }

    public void setIdActividadDelDia(Long idActividadDelDia) {
        this.idActividadDelDia = idActividadDelDia;
    }


    
}