package com.newid.newid.models;

import java.util.Date;

import jakarta.persistence.*;

@Entity
@Table(name = "newid_actividad_del_dia")

public class NewIdActividadDelDia {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_tipo_actividad", nullable = false)
    private NewIdTipoActividades newIdTipoActividades;

    @Column(name = "fecha")
    private Date fecha;



    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public NewIdTipoActividades getNewIdTipoActividades() {
        return this.newIdTipoActividades;
    }

    public void setNewIdTipoActividades(NewIdTipoActividades newIdTipoActividades) {
        this.newIdTipoActividades = newIdTipoActividades;
    }

    public Date getFecha() {
        return this.fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    
}
