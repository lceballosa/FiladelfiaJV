package com.newid.newid.models;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.*;


@Entity
@Table(name = "newid_asistencia")
@Setter
@Getter
public class NewIdAsistencia {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;

    @Column(name = "fecha")
    private Date fecha;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_joven")
	private NewidJoven joven;
}
