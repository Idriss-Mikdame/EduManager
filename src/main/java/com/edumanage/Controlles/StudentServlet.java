package com.edumanage.Controlles;

import com.edumanage.dao.StudentDAO;
import com.edumanage.model.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/createe")
public class StudentServlet extends HttpServlet {
    private StudentDAO studentDAO;

    @Override
    public void init() {
        studentDAO = new StudentDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/Student/AjouterStudent.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String Datenaiss = request.getParameter("Datenaiss");

        Student student = new Student(id, nom, prenom, email, Datenaiss);
        studentDAO.createStudent(student); // Utiliser l'instance au lieu de la classe

        response.sendRedirect(request.getContextPath() + "/read");
    }

}
@WebServlet("/read")
public class Read extends HttpServlet {
    private StudentDAO studentDAO;

    @Override
    public void init() {
        studentDAO = new StudentDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Student> Listp = Student.getAllstudent();
        request.setAttribute("ListP", Listp);
        request.getRequestDispatcher("/WEB-INF/ListP.jsp").forward(request, response);
    }
}
