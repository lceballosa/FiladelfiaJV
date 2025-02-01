package com.newid.newid.models;
import jakarta.persistence.*;

import java.util.*;

@Entity
@Table(name = "newid_seguimiento")
public class NewIdSeguimiento {


    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;

    @Column(name = "fecha")
    private Date fecha;

    @Column(name = "observacion")
    private String observacion;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "telefono")
	private NewidJoven joven;


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

    public String getObservacion() {
        return this.observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public NewidJoven getJoven() {
        return this.joven;
    }

    public void setJoven(NewidJoven joven) {
        this.joven = joven;
    }
    
}
