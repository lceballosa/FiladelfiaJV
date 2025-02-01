package com.newid.newid.models;
import jakarta.persistence.*;

@Entity
@Table(name = "newid_seguridad")
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

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public NewidMentor getMentor() {
        return this.mentor;
    }

    public void setMentor(NewidMentor mentor) {
        this.mentor = mentor;
    }

    public NewIdGrupoEdad getGrupoEdad() {
        return this.grupoEdad;
    }

    public void setGrupoEdad(NewIdGrupoEdad grupoEdad) {
        this.grupoEdad = grupoEdad;
    }

    
    
}
