package com.edumanage.dao;

import com.edumanage.Models.StudentCourse;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentCourseDAO {
    private Connection connection;

    public StudentCourseDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/edumanger", "root", "");

            if (this.connection == null) {
                throw new SQLException("Failed to establish database connection!");
            }

            try (Statement statement = connection.createStatement()) {
                String createTableSQL = "CREATE TABLE IF NOT EXISTS student_course (" +
                        "student_id INT NOT NULL, " +
                        "course_id INT NOT NULL, " +
                        "PRIMARY KEY (student_id, course_id), " +
                        "FOREIGN KEY (student_id) REFERENCES student(id), " +
                        "FOREIGN KEY (course_id) REFERENCES cours(id)" +
                        ");";
                statement.executeUpdate(createTableSQL);
                System.out.println("Table 'student_course' ensured.");
            }

        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Database connection error: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public void attachCourseToStudent(int studentId, int courseId) {
        String query = "INSERT INTO student_course (student_id, course_id) VALUES (?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, studentId);
            stmt.setInt(2, courseId);
            stmt.executeUpdate();
            System.out.println("Course attached to student successfully");
        } catch (SQLException e) {
            System.err.println("Error attaching course to student: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public void detachCourseFromStudent(int studentId, int courseId) {
        String query = "DELETE FROM student_course WHERE student_id = ? AND course_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, studentId);
            stmt.setInt(2, courseId);
            stmt.executeUpdate();
            System.out.println("Course detached from student successfully");
        } catch (SQLException e) {
            System.err.println("Error detaching course from student: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public List<Integer> getCoursesByStudentId(int studentId) {
        List<Integer> courseIds = new ArrayList<>();
        String query = "SELECT course_id FROM student_course WHERE student_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, studentId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                courseIds.add(rs.getInt("course_id"));
            }
        } catch (SQLException e) {
            System.err.println("Error fetching courses by student ID: " + e.getMessage());
            e.printStackTrace();
        }
        return courseIds;
    }
}