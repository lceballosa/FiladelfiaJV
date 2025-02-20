package com.newid.newid.dto;

import java.util.List;

public class EmailRequestDTO {
    private List<String> to;  // Accepts multiple email addresses
    private String subject;
    private String body;
    private Long id;

    // Constructors
    public EmailRequestDTO() {}

    public EmailRequestDTO(List<String> to, String subject, String body) {
        this.to = to;
        this.subject = subject;
        this.body = body;
    }

    // Getters and Setters
    public List<String> getTo() {
        return to;
    }

    public void setTo(List<String> to) {
        this.to = to;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }


    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

}

