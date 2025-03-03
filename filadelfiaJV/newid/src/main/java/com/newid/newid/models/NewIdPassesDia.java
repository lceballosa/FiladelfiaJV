package com.newid.newid.models;
import jakarta.persistence.*;

@Entity
@Table(name = "newid_passes_dia")
public class NewIdPassesDia {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_passe", nullable = false)
    private NewIdPasse passe;

    @Column(name = "puntos")
    private Long puntos;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_actividad_del_dia", nullable = false)
    private NewIdActividadDelDia actividadDelDia;


    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public NewIdPasse getPasse() {
        return this.passe;
    }

    public void setPasse(NewIdPasse passe) {
        this.passe = passe;
    }

    public Long getPuntos() {
        return this.puntos;
    }

    public void setPuntos(Long puntos) {
        this.puntos = puntos;
    }


    public NewIdActividadDelDia getActividadDelDia() {
        return this.actividadDelDia;
    }

    public void setActividadDelDia(NewIdActividadDelDia actividadDelDia) {
        this.actividadDelDia = actividadDelDia;
    }



    
}
