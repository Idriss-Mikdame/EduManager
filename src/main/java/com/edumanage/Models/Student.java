package com.edumanage.Models;

public class Student {
    private int id;
    private String nom;
    private String prenom;
    private String email;
    private String datenaiss;

    public Student() {}

    public Student(String nom, String prenom, String email, String datenaiss) {
        this.nom = nom;
        this.prenom = prenom;
        this.email = email;
        this.datenaiss = datenaiss;
    }

    public Student(int id, String nom, String prenom, String email, String datenaiss) {
        this.id = id;
        this.nom = nom;
        this.prenom = prenom;
        this.email = email;
        this.datenaiss = datenaiss;
    }

    // Getters and Setters
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDatenaiss() {
        return datenaiss;
    }

    public void setDatenaiss(String datenaiss) {
        this.datenaiss = datenaiss;
    }
}