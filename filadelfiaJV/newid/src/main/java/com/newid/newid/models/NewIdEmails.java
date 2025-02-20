package com.newid.newid.models;

import java.util.Date;

import jakarta.persistence.*;

@Entity
@Table(name = "newid_emails")
public class NewIdEmails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
    private Long id;

    @Column(name = "asunto", nullable = false)
    private String asunto;

    @Column(name = "cuerpo", nullable = false)
    private String cuerpo;
    

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAsunto() {
        return this.asunto;
    }

    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }

    public String getCuerpo() {
        return this.cuerpo;
    }

    public void setCuerpo(String cuerpo) {
        this.cuerpo = cuerpo;
    }

}
