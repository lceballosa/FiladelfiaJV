package com.newid.newid.dto;

public class NewIdMentorGrupoEdadDTO {

	private Long id;

	private NewidMentorDTO mentor;

	private NewIdGrupoEdadDTO grupoEdad;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public NewidMentorDTO getMentor() {
        return mentor;
    }

    public void setMentor(NewidMentorDTO mentor) {
        this.mentor = mentor;
    }

    public NewIdGrupoEdadDTO getGrupoEdad() {
        return grupoEdad;
    }

    public void setGrupoEdad(NewIdGrupoEdadDTO grupoEdad) {
        this.grupoEdad = grupoEdad;
    }

    
    
}
