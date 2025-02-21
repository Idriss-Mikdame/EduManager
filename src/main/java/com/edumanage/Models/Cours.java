package com.edumanage.Models;

public class Cours {
    private int id;
    private String nomducours;
    private String description;

    public Cours() {}

    public Cours(String nomducours, String description) {
        this.nomducours = nomducours;
        this.description = description;
    }

    public Cours(int id, String nomducours, String description) {
        this.id = id;
        this.nomducours = nomducours;
        this.description = description;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNomducours() {
        return nomducours;
    }

    public void setNomducours(String nomducours) {
        this.nomducours = nomducours;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}