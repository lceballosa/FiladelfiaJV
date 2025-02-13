package com.newid.newid.models;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jakarta.persistence.*;

@Entity
@Table(name = "newid_padre")
public class NewidPadre {

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

    @Column(name = "genero")
    private String genero;

    @Column(name = "edad")
    private Long edad;

    @Column(name = "fecha_inscripcion")
    private Date fechaInscripcion;

    @Column(name = "tipo_documento")
    private String tipoDocumento;

    @Column(name = "numero_documento")
    private String numeroDocumento;

    @Column(name = "cantidad_hijos")
    private String cantidadHijos;

    @Column(name = "nombres_hijos")
    private String nombresHijos;



    public String getTipoDocumento() {
        return this.tipoDocumento;
    }

    public void setTipoDocumento(String tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }

    public String getNumeroDocumento() {
        return this.numeroDocumento;
    }

    public void setNumeroDocumento(String numeroDocumento) {
        this.numeroDocumento = numeroDocumento;
    }

    public String getCantidadHijos() {
        return this.cantidadHijos;
    }

    public void setCantidadHijos(String cantidadHijos) {
        this.cantidadHijos = cantidadHijos;
    }

    public String getNombresHijos() {
        return this.nombresHijos;
    }

    public void setNombresHijos(String nombresHijos) {
        this.nombresHijos = nombresHijos;
    }

    public Date getFechaInscripcion() {
        return this.fechaInscripcion;
    }

    public void setFechaInscripcion(Date fechaInscripcion) {
        this.fechaInscripcion = fechaInscripcion;
    }



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
