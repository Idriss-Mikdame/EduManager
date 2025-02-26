package com.edumanage.dao;

import com.edumanage.Models.Student;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {
    private Connection connection;

    public StudentDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Connecting to database...");
            this.connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/edumanger", "root", "");
            if (this.connection == null) {
                throw new SQLException("Failed to establish database connection!");
            }

            try (Statement statement = connection.createStatement()) {
                String createTableSQL = "CREATE TABLE IF NOT EXISTS student (" +
                        "id INT AUTO_INCREMENT PRIMARY KEY, " +
                        "nom VARCHAR(100) NOT NULL, " +
                        "email VARCHAR(100) NOT NULL, " +
                        "prenom VARCHAR(255) NOT NULL, " +
                        "datenaissance VARCHAR(100) NOT NULL" +
                        ");";
                statement.executeUpdate(createTableSQL);
                System.out.println("Table 'student' ensured.");
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException("Failed to initialize StudentDAO: " + e.getMessage(), e);
        }
    }

    public void insertEtudiant(Student student) {
        if (connection == null) {
            System.err.println("Database connection not established!");
            return;
        }

        String query = "INSERT INTO student (nom, prenom, email, datenaissance) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, student.getNom());
            stmt.setString(2, student.getPrenom());
            stmt.setString(3, student.getEmail());
            stmt.setString(4, student.getDatenaiss());
            stmt.executeUpdate();
            System.out.println("Student inserted successfully: " + student.getNom());
        } catch (SQLException e) {
            System.err.println("Error inserting student: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public List<Student> selectAllEtudiant() {
        List<Student> etudiantList = new ArrayList<>();
        String query = "SELECT id, nom, prenom, email, datenaissance FROM student";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet rs = preparedStatement.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String nom = rs.getString("nom");
                String prenom = rs.getString("prenom");
                String email = rs.getString("email");
                String datenaissance = rs.getString("datenaissance");

                etudiantList.add(new Student(id, nom, prenom, email, datenaissance));
            }
        } catch (SQLException e) {
            System.err.println("Error fetching students: " + e.getMessage());
            e.printStackTrace();
        }
        return etudiantList;
    }

    public void updateStudent(Student student) {
        String query = "UPDATE student SET nom = ?, prenom = ?, email = ?, datenaissance = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, student.getNom());
            stmt.setString(2, student.getPrenom());
            stmt.setString(3, student.getEmail());
            stmt.setString(4, student.getDatenaiss());
            stmt.setInt(5, student.getId());
            stmt.executeUpdate();
            System.out.println("Student updated successfully: " + student.getNom());
        } catch (SQLException e) {
            System.err.println("Error updating student: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public void deleteStudent(int id) {
        String query = "DELETE FROM student WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
            System.out.println("Student deleted successfully: ID " + id);
        } catch (SQLException e) {
            System.err.println("Error deleting student: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public Student selectStudentById(int id) {
        String query = "SELECT id, nom, prenom, email, datenaissance FROM student WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Student(rs.getInt("id"), rs.getString("nom"), rs.getString("prenom"),
                        rs.getString("email"), rs.getString("datenaissance"));
            }
        } catch (SQLException e) {
            System.err.println("Error fetching student by ID: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    // Optional: Close connection when done
    public void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
                System.out.println("Database connection closed.");
            }
        } catch (SQLException e) {
            System.err.println("Error closing connection: " + e.getMessage());
        }
    }
}