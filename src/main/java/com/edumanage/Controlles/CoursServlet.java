package com.edumanage.Controlles;

import com.edumanage.dao.coursDAO;
import com.edumanage.model.Cours;
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
public class CoursServlet extends HttpServlet {
    private coursDAO courDAO;

    @Override
    public void init() throws ServletException {
        courDAO = new coursDAO();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertCours(request, response);
                    break;
                case "/list":
                    listCours(request, response);
                    break;
                default:
                    response.sendRedirect("list");
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void listCours(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Cours> listCours = courDAO.selectAllCours();
        request.setAttribute("coursList", listCours);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Cours/AfficherCours.jsp");
        dispatcher.forward(request, response);
    }

    private void insertCours(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String nomcour = request.getParameter("nomcour");
        String description = request.getParameter("description");

        Cours newCours = new Cours(nomcour, description);
        courDAO.insertCours(newCours);
        response.sendRedirect("list");
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Cours/AjouterCours.jsp");
        dispatcher.forward(request, response);
    }


}
