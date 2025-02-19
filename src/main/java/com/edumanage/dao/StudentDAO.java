package com.edumanage.dao;

import com.edumanage.model.Student;

import java.sql.*;

public class StudentDAO {

    private Connection connection;

    public StudentDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/edumanger", "root", "");

            if (this.connection == null) {
                throw new SQLException("Failed to establish database connection!");
            }

            try (Statement statement = connection.createStatement()) {
                String createTableSQL = "CREATE TABLE IF NOT EXISTS student (" +
                        "id INT AUTO_INCREMENT PRIMARY KEY, " +
                        "nom VARCHAR(100) NOT NULL, " +
                        "prenom VARCHAR(100) NOT NULL, " +
                        "email VARCHAR(255) NOT NULL, " +
                        "Datnaisse VARCHAR(100) NOT NULL, " +
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
    public static void createStudent(Student student) {
        if (student.getId() == 0) {
            System.err.println("Database connection is not initialized!");
            return;
        }

    }

}

