package com.edumanage.Controlles;

import com.edumanage.dao.StudentDAO;
import com.edumanage.model.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/createe")
public class StudentServlet extends HttpServlet {
    private StudentDAO studentDAO;

    private static final String AJOUTER_STUDENT_JSP = "/WEB-INF/Student/AjouterStudent.jsp";
    private static final String AFFICHER_STUDENT_JSP = "/WEB-INF/Student/AfficherStudent.jsp";
    private static final String MODIFIER_STUDENT_JSP = "/WEB-INF/Student/ModifierStudent.jsp";

    @Override
    public void init() throws ServletException {
        try {
            studentDAO = new StudentDAO();
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Initialization failed", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "afficher";
        }

        try {
            switch (action) {
                case "add":
                    ajouter(request, response);
                    break;
                case "update":
                    modifier(request, response);
                    break;
                case "delete":
                    supprimer(request, response);
                    break;
                default:
                    afficher(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }

    private void afficher(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Student> students = studentDAO.getAllStudents();
        request.setAttribute("students", students);
        request.getRequestDispatcher(AFFICHER_STUDENT_JSP).forward(request, response);
    }

    private void supprimer(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        studentDAO.deleteStudent(id);
        response.sendRedirect("students");
    }

    private void modifier(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Student student = studentDAO.getStudent(id);
        request.setAttribute("student", student);
        request.getRequestDispatcher(MODIFIER_STUDENT_JSP).forward(request, response);
    }

    private void ajouter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(AJOUTER_STUDENT_JSP).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String datenaiss = request.getParameter("Datenaiss");
        String parm = request.getParameter("par");

        Student student = new Student(nom, prenom, email, datenaiss);

        try {
            if ("add".equals(parm)) {
                studentDAO.createStudent(student);
            } else if ("modifier".equals(parm)) {
                int id = Integer.parseInt(request.getParameter("id"));
                student.setId(id);
                studentDAO.updateStudent(student);
            }
            response.sendRedirect("students");
        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }
}