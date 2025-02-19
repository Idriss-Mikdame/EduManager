package com.edumanage.model;

import java.util.List;

public class Student {
    int id;
    String nom;
    String prenom;
    String email;
    String Datenaiss;

    public Student(int id, String nom, String prenom, String email, String datenaiss) {
        this.id = id;
        this.nom = nom;
        this.prenom = prenom;
        this.email = email;
        Datenaiss = datenaiss;
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getDatenaiss() {
        return Datenaiss;
    }

    public void setDatenaiss(String datenaiss) {
        Datenaiss = datenaiss;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
