package com.newid.newid.dto;
import java.util.Date;

import jakarta.persistence.Column;

public class NewidJovenDTO {

	private String telefono;

    private String nombreCompleto;

    private Date fechaNacimiento;

    private Boolean parqueadero;

    private Boolean tieneMentor;

	private Long idMentor;

	private Long idGrupoEdad;

    private Long asistencias;

    private String genero;

    private String abreviaturaMentor;

    private String grupoEdadNombre;

    private Long edad;

    private String fechaNacimientoString;

    private String primerNombre;

    private String segundoNombre;

    private String primerApellido;

    private String segundoApellido;

    private Date fechaInscripcion;

    private NewIdContactoDTO contacto;


    public NewIdContactoDTO getContacto() {
        return this.contacto;
    }

    public void setContacto(NewIdContactoDTO contacto) {
        this.contacto = contacto;
    }

    public Date getFechaInscripcion() {
        return this.fechaInscripcion;
    }

    public void setFechaInscripcion(Date fechaInscripcion) {
        this.fechaInscripcion = fechaInscripcion;
    }

    public String getPrimerNombre() {
        return primerNombre;
    }

    public String getNombreCompleto() {
        return this.nombreCompleto;
    }


    public Boolean isParqueadero() {
        return this.parqueadero;
    }

    public Boolean isTieneMentor() {
        return this.tieneMentor;
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

    

    
    

    public String getAbreviaturaMentor() {
        return abreviaturaMentor;
    }

    public void setAbreviaturaMentor(String abreviaturaMentor) {
        this.abreviaturaMentor = abreviaturaMentor;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getNombrecompleto() {
        return nombreCompleto;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public Boolean getParqueadero() {
        return parqueadero;
    }

    public void setParqueadero(Boolean parqueadero) {
        this.parqueadero = parqueadero;
    }

    public Boolean getTieneMentor() {
        return tieneMentor;
    }

    public void setTieneMentor(Boolean tieneMentor) {
        this.tieneMentor = tieneMentor;
    }

    public Long getIdMentor() {
        return idMentor;
    }

    public void setIdMentor(Long idMentor) {
        this.idMentor = idMentor;
    }

    public Long getIdGrupoEdad() {
        return idGrupoEdad;
    }

    public void setIdGrupoEdad(Long idGrupoEdad) {
        this.idGrupoEdad = idGrupoEdad;
    }

    public Long getAsistencias() {
        return asistencias;
    }

    public void setAsistencias(Long asistencias) {
        this.asistencias = asistencias;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getGrupoEdadNombre() {
        return grupoEdadNombre;
    }

    public void setGrupoEdadNombre(String grupoEdad) {
        this.grupoEdadNombre = grupoEdad;
    }

    public Long getEdad() {
        return edad;
    }

    public void setEdad(Long edad) {
        this.edad = edad;
    }

    public String getFechaNacimientoString() {
        return fechaNacimientoString;
    }

    public void setFechaNacimientoString(String fechaNacimientoString) {
        this.fechaNacimientoString = fechaNacimientoString;
    }

    

    

    
    
}
