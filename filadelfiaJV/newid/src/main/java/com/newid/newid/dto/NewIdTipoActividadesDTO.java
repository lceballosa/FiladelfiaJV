package com.newid.newid.dto;

import jakarta.persistence.*;


public class NewIdTipoActividadesDTO {

    private Long id;

    private String nombre;

    private String descripcion;


    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return this.nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return this.descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }



    
}
