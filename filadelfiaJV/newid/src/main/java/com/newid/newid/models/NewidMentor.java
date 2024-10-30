package com.newid.newid.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Entity
@Table(name = "newid_mentor")
@Setter
@Getter
public class NewidMentor {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;

    @Column(name = "nombre")
    private String nombre;

    @Column(name = "edad")
    private Long edad;

    @Column(name = "fecha_nacimiento")
    private Date fechaNacimiento;

    @Column(name = "telefono")
    private String telefono;

    @Column(name = "abreviatura")
    private String abreviatura;

    
}
