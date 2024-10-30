package com.newid.newid.models;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;



@Entity
@Table(name = "newid_seguridad")
@Setter
@Getter
public class NewIdSeguridad {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;

    @Column(name = "contrasenia")
    private String contrasenia;
    
}
