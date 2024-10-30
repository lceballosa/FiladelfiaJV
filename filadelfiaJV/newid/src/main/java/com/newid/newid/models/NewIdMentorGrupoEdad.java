package com.newid.newid.models;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "newid_seguridad")
@Setter
@Getter
public class NewIdMentorGrupoEdad {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_mentor")
	private NewidMentor mentor;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_grupo_edad")
	private NewIdGrupoEdad grupoEdad;
    
}
