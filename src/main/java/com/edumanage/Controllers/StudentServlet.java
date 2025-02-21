package com.edumanage.Controllers;

import com.edumanage.dao.StudentCourseDAO;
import com.edumanage.dao.StudentDAO;
import com.edumanage.Models.Student;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/student/*")
public class StudentServlet extends HttpServlet {
    private StudentDAO studentDAO;

    @Override
    public void init() {
        studentDAO = new StudentDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getRequestURI();
        System.out.println(action);
        try {
            if (action == null || action.equals("/")) {
                listEtudiant(request, response);
            } else {
                switch (action) {
                    case "/student/new":
                        showNewForm(request, response);
                        break;
                    case "/student/insert":
                        insertEtudiant(request, response);
                        break;
                    case "/student/list":
                        listEtudiant(request, response);
                        break;
                    case "/student/edit":
                        showEditForm(request, response);
                        break;
                    case "/student/update":
                        updateStudent(request, response);
                        break;
                    case "/student/delete":
                        deleteStudent(request, response);
                        break;
                    case "/student/attachCourse":
                        attachCourseToStudent(request, response);
                        break;
                    case "/student/detachCourse":
                        detachCourseFromStudent(request, response);
                        break;
                    default:
                        response.sendError(HttpServletResponse.SC_NOT_FOUND);
                        break;
                }
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Student/AjouterStudent.jsp");
        dispatcher.forward(request, response);
    }

    private void insertEtudiant(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String datnaisse = request.getParameter("datenaissance");

        Student newEtudiant = new Student(nom, prenom, email, datnaisse);
        studentDAO.insertEtudiant(newEtudiant);
        response.sendRedirect("list");
    }

    private void listEtudiant(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Student> listUser = studentDAO.selectAllEtudiant();
        request.setAttribute("etudiantList", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Student/AfficherStudent.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Student existingStudent = studentDAO.selectStudentById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Student/ModiffierStudent.jsp");
        request.setAttribute("student", existingStudent);
        dispatcher.forward(request, response);
    }

    private void updateStudent(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String datenaissance = request.getParameter("datenaissance");

        Student student = new Student(id, nom, prenom, email, datenaissance);
        studentDAO.updateStudent(student);
        response.sendRedirect("list");
    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        studentDAO.deleteStudent(id);
        response.sendRedirect("list");
    }

    private void attachCourseToStudent(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        StudentCourseDAO studentCourseDAO = new StudentCourseDAO();
        studentCourseDAO.attachCourseToStudent(studentId, courseId);
        response.sendRedirect("list");
    }

    private void detachCourseFromStudent(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        StudentCourseDAO studentCourseDAO = new StudentCourseDAO();
        studentCourseDAO.detachCourseFromStudent(studentId, courseId);
        response.sendRedirect("list");
    }
}