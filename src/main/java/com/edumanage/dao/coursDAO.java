package com.edumanage.dao;

import com.edumanage.model.Cours;
import com.edumanage.model.Student;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class coursDAO {

    private Connection connection;

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
                        "description VARCHAR(255) NOT NULL" +
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

    // Insert a new course into the database
    public void insertCours(Cours cours) {
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

    // Select all courses from the database
    public List<Cours> selectAllCours() {
        List<Cours> coursList = new ArrayList<>();
        String query = "SELECT id, nomducours, description FROM student"; // Fixed column names

        try (PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet rs = preparedStatement.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String nomducours = rs.getString("nomducours");
                String description = rs.getString("description");


                coursList.add(new Cours(id, nomducours, description));
            }
        } catch (SQLException e) {
            System.err.println("Error fetching students: " + e.getMessage());
            e.printStackTrace();
        }
        return coursList;
    }



}
