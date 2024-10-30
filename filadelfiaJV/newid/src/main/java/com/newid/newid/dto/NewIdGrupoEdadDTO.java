package com.newid.newid.dto;

import jakarta.persistence.Column;

public class NewIdGrupoEdadDTO {

	private Long id;
    private String grupoEdad;
    private Long valorMinimo;
    private Long valorMaximo;
    
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getGrupoEdad() {
        return grupoEdad;
    }
    public void setGrupoEdad(String grupoEdad) {
        this.grupoEdad = grupoEdad;
    }
    public Long getValorMinimo() {
        return valorMinimo;
    }
    public void setValorMinimo(Long valorMinimo) {
        this.valorMinimo = valorMinimo;
    }
    public Long getValorMaximo() {
        return valorMaximo;
    }
    public void setValorMaximo(Long valorMaximo) {
        this.valorMaximo = valorMaximo;
    }

    
    
}
