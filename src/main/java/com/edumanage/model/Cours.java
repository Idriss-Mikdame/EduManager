package com.edumanage.model;

public class Cours {
    int id;
    String nomducours;
    String description;

    public Cours(int id, String nomducours, String description) {
        this.id = id;
        this.nomducours = nomducours;
        this.description = description;
    }

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
