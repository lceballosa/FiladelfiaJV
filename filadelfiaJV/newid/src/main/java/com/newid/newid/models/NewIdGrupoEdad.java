package com.newid.newid.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "newid_grupoedad")
@Setter
@Getter
public class NewIdGrupoEdad {


    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;

    @Column(name = "grupo_edad")
    private String grupoEdad;


    @Column(name = "valor_minimo")
    private Long valorMinimo;

    @Column(name = "valor_maximo")
    private Long valorMaximo;
    
    
}
