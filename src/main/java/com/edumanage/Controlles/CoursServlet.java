package com.edumanage.Controlles;

import com.edumanage.dao.StudentDAO;
import com.edumanage.dao.coursDAO;
import com.edumanage.model.Cours;
import com.edumanage.model.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;


@WebServlet("/create")
    public class CoursServlet extends HttpServlet {
        private coursDAO courDAO ;

        @Override
        public void init() {
            courDAO = new coursDAO();
        }

        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.getRequestDispatcher("/WEB-INF/Cours/AjouterCours.jsp").forward(request, response);
        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            int id = Integer.parseInt(request.getParameter("id"));
            String nomducours = request.getParameter("NomCours");
            String Description= request.getParameter("Description");


            Cours cour = new Cours(id, nomducours, Description);
            coursDAO.createCours(cour); // Utiliser l'instance au lieu de la classe

            response.sendRedirect(request.getContextPath() + "/read");
        }

    }







