package com.edumanage.dao;

import com.edumanage.model.Cours;
import java.sql.*;

public class coursDAO {

    private Connection connection;

    public coursDAO() {
        try {
            // Chargement du driver MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Établissement de la connexion à la base de données
            this.connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/edumanger", "root", "");

            if (this.connection == null) {
                throw new SQLException("Failed to establish database connection!");
            }

            // Création de la table 'cours' si elle n'existe pas déjà
            try (Statement statement = connection.createStatement()) {
                String createTableSQL = "CREATE TABLE IF NOT EXISTS cours (" +
                        "id INT AUTO_INCREMENT PRIMARY KEY, " +
                        "nomducours VARCHAR(100) NOT NULL, " +
                        "description VARCHAR(100) NOT NULL" +
                        ");";
                statement.executeUpdate(createTableSQL);
                System.out.println("Table 'cours' created successfully");
            }

        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Database connection error: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // Méthode pour insérer un nouveau cours dans la base de données
    public void createCours(Cours cours) {
        if (connection == null) {
            System.err.println("Database connection not established!");
            return;
        }

        String query = "INSERT INTO cours (nomducours, description) VALUES (?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, cours.getNomducours());
            stmt.setString(2, cours.getDescription());
            stmt.executeUpdate();
            System.out.println("Cours inserted successfully");
        } catch (SQLException e) {
            System.err.println("Error inserting cours: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // Méthode pour fermer la connexion à la base de données
    public void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
                System.out.println("Database connection closed successfully");
            } catch (SQLException e) {
                System.err.println("Error closing database connection: " + e.getMessage());
                e.printStackTrace();
            }
        }
    }
}
