package com.newid.newid.dto;
import java.util.Date;

public class NewidJovenDTO {

	private String telefono;

    private String nombre;

    private Date fechaNacimiento;

    private Boolean parqueadero;

    private Boolean tieneMentor;

	private Long idMentor;

	private Long idGrupoEdad;

    private Long asistencias;

    private String genero;

    private String abreviaturaMentor;

    private String grupoEdad;

    private Long edad;

    private String fechaNacimientoString;

    

    
    

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

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
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

    public String getGrupoEdad() {
        return grupoEdad;
    }

    public void setGrupoEdad(String grupoEdad) {
        this.grupoEdad = grupoEdad;
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
