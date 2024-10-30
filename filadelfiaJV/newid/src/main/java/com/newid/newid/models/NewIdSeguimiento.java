package com.newid.newid.models;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.*;

@Entity
@Table(name = "newid_seguimiento")
@Setter
@Getter
public class NewIdSeguimiento {


    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;

    @Column(name = "fecha")
    private Date fecha;

    @Column(name = "observacion")
    private String observacion;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_joven")
	private NewidJoven joven;

    
}
