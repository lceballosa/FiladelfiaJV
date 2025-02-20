package com.newid.newid.models;

import jakarta.persistence.*;

@Entity
@Table(name = "newid_passe")
public class NewIdPasse {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
    private Long id;

    @Column(name = "tipo")
    private String tipo;



    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTipo() {
        return this.tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    
}
