package com.newid.newid.models;


import java.util.Date;

import jakarta.persistence.*;

@Entity
@Table(name = "newid_joven_passes")
public class NewIdJovenPasses {
    

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_joven", nullable = false)
    private NewidJoven joven;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_passe", nullable = false)
    private NewIdPasse passe;

    @Column(name = "fecha", nullable = false)
    private Date fecha;


    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public NewidJoven getJoven() {
        return this.joven;
    }

    public void setJoven(NewidJoven joven) {
        this.joven = joven;
    }

    public NewIdPasse getPasse() {
        return this.passe;
    }

    public void setPasse(NewIdPasse passe) {
        this.passe = passe;
    }


    public Date getFecha() {
        return this.fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    

}
