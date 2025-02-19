package com.edumanage.dao;

import com.edumanage.model.Cours;
import com.edumanage.model.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class coursDAO {
    private static Connection connection;

    public coursDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/edumanger", "root", "");

            if (this.connection == null) {
                throw new SQLException("Failed to establish database connection!");
            }

            try (Statement statement = connection.createStatement()) {
                String createTableSQL = "CREATE TABLE IF NOT EXISTS cours (" +
                        "id INT AUTO_INCREMENT PRIMARY KEY, " +
                        "nomducours VARCHAR(100) NOT NULL, " +
                        "description VARCHAR(100) NOT NULL, " +
                        ");";

                statement.executeUpdate(createTableSQL);
                System.out.println("Table 'person' created successfully");
            }

        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Database connection error: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public static void createCours(Cours cour) {
        if (connection == null) {
            System.err.println("Database connection is not initialized!");
            return;
        }

        String query = "INSERT INTO person (nom, prenom, email, Datnaiss) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, cour.getNomducours());
            stmt.setString(2, cour.getDescription());
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error inserting person: " + e.getMessage());
            e.printStackTrace();
        }

    }


}
