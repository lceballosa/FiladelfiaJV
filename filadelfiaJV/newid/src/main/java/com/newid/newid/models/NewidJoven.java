package com.newid.newid.models;
import java.util.Date;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "newid_joven")
@Setter
@Getter
public class NewidJoven {

    @Id
	@Column(name = "telefono", unique = true, nullable = false)
	private String telefono;

    @Column(name = "nombre")
    private String nombre;

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
    @JoinColumn(name = "id_grupo_edad")
	private NewIdGrupoEdad grupoEdad;

    @Column(name = "genero")
    private String genero;

    @Column(name = "edad")
    private Long edad;
    
}
