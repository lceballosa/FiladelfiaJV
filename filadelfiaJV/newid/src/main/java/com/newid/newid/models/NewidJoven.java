package com.newid.newid.models;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jakarta.persistence.*;

@Entity
@Table(name = "newid_joven")
public class NewidJoven {

    @Id
	@Column(name = "telefono", unique = true, nullable = false)
	private String telefono;

    @Column(name = "nombre_completo")
    private String nombreCompleto;

    @Column(name = "primer_nombre")
    private String primerNombre;

    @Column(name = "segundo_nombre")
    private String segundoNombre;

    @Column(name = "primer_apellido")
    private String primerApellido;

    @Column(name = "segundo_apellido")
    private String segundoApellido;

    @Column(name = "fecha_nacimiento")
    private Date fechaNacimiento;

    @Column(name = "parqueadero")
    private Boolean parqueadero;

    @Column(name = "mentor")
    private Boolean tieneMentor;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_mentor")
	private NewidMentor mentor;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_grupo_edad",nullable = false)
	private NewIdGrupoEdad grupoEdad;

    @Column(name = "genero")
    private String genero;

    @Column(name = "edad")
    private Long edad;


    public String getTelefono() {
        return this.telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getNombreCompleto() {
        return this.nombreCompleto;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    public String getPrimerNombre() {
        return this.primerNombre;
    }

    public void setPrimerNombre(String primerNombre) {
        this.primerNombre = primerNombre;
    }

    public String getSegundoNombre() {
        return this.segundoNombre;
    }

    public void setSegundoNombre(String segundoNombre) {
        this.segundoNombre = segundoNombre;
    }

    public String getPrimerApellido() {
        return this.primerApellido;
    }

    public void setPrimerApellido(String primerApellido) {
        this.primerApellido = primerApellido;
    }

    public String getSegundoApellido() {
        return this.segundoApellido;
    }

    public void setSegundoApellido(String segundoApellido) {
        this.segundoApellido = segundoApellido;
    }

    public Date getFechaNacimiento() {
        return this.fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public Boolean isParqueadero() {
        return this.parqueadero;
    }

    public Boolean getParqueadero() {
        return this.parqueadero;
    }

    public void setParqueadero(Boolean parqueadero) {
        this.parqueadero = parqueadero;
    }

    public Boolean isTieneMentor() {
        return this.tieneMentor;
    }

    public Boolean getTieneMentor() {
        return this.tieneMentor;
    }

    public void setTieneMentor(Boolean tieneMentor) {
        this.tieneMentor = tieneMentor;
    }

    public NewidMentor getMentor() {
        return this.mentor;
    }

    public void setMentor(NewidMentor mentor) {
        this.mentor = mentor;
    }

    public NewIdGrupoEdad getGrupoEdad() {
        return this.grupoEdad;
    }

    public void setGrupoEdad(NewIdGrupoEdad grupoEdad) {
        this.grupoEdad = grupoEdad;
    }

    public String getGenero() {
        return this.genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public Long getEdad() {
        return this.edad;
    }

    public void setEdad(Long edad) {
        this.edad = edad;
    }


    
}
