package com.newid.newid.dto;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class NewidPadreDTO {
	private String telefono;

    private String nombreCompleto;

    private String primerNombre;

    private String segundoNombre;

    private String primerApellido;

    private String segundoApellido;

    private Date fechaNacimiento;

    private Boolean parqueadero;

    private String genero;

    private Long edad;

    private Date fechaInscripcion;

    private String tipoDocumento;

    private String numeroDocumento;

    private String cantidadHijos;

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
