package com.edumanage.Controlles;

import com.edumanage.dao.StudentDAO;
import com.edumanage.model.Student;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/")
public class StudentServlet extends HttpServlet {
    private StudentDAO studentDAO;

    @Override
    public void init() {
        studentDAO = new StudentDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertEtudiant(request, response);
                    break;
                case "/list":
                    listEtudiant(request, response);
                    break;
                default:
                    response.sendRedirect("list");
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("AjouterStudent.jsp");
        dispatcher.forward(request, response);
    }

    private void insertEtudiant(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String datnaisse = request.getParameter("Datenaiss");

        Student newEtudiant = new Student(nom, prenom, email, datnaisse);
        studentDAO.insertEtudiant(newEtudiant);
        response.sendRedirect("list");
    }

    private void listEtudiant(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        List<Student> listUser = studentDAO.selectAllEtudiant();
        request.setAttribute("etudiantList", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Student/AfficherStudent.jsp");
        dispatcher.forward(request, response);
    }
}
