package com.newid.newid.models;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.*;

@Entity
@Table(name = "newid_grupoedad") 
public class NewIdGrupoEdad {


    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;

    @Column(name = "grupo_edad",nullable = false)
    private String grupoEdadNombre;

    
    @Column(name = "valor_minimo")
    private Long valorMinimo;

    @Column(name = "valor_maximo")
    private Long valorMaximo;

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getGrupoEdadNombre() {
        return this.grupoEdadNombre;
    }

    public void setGrupoEdadNombre(String grupoEdadNombre) {
        this.grupoEdadNombre = grupoEdadNombre;
    }

    public Long getValorMinimo() {
        return this.valorMinimo;
    }

    public void setValorMinimo(Long valorMinimo) {
        this.valorMinimo = valorMinimo;
    }

    public Long getValorMaximo() {
        return this.valorMaximo;
    }

    public void setValorMaximo(Long valorMaximo) {
        this.valorMaximo = valorMaximo;
    }

    
    
    
}
