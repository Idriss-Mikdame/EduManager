package com.edumanage.Controllers;

import com.edumanage.Models.Cours;
import com.edumanage.dao.coursDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/cours/*")
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
        String action = request.getRequestURI();
        System.out.println(action);
        try {
            if (action == null || action.equals("/")) {
                listCours(request, response);
            } else {
                switch (action) {
                    case "/cours/newcour":
                        showNewForm(request, response);
                        break;
                    case "/cours/insertcour":
                        insertCours(request, response);
                        break;
                    case "/cours/listcour":
                        listCours(request, response);
                        break;
                    case "/cours/edit":
                        showEditForm(request, response);
                        break;
                    case "/cours/update":
                        updateCours(request, response);
                        break;
                    case "/cours/delete":
                        deleteCours(request, response);
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
        response.sendRedirect("listcour");
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/Cours/AjouterCours.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Cours existingCours = courDAO.selectCoursById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Cours/ModifierCours.jsp");
        request.setAttribute("cours", existingCours);
        dispatcher.forward(request, response);
    }

    private void updateCours(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nomcour = request.getParameter("nomcour");
        String description = request.getParameter("description");

        Cours cours = new Cours(id, nomcour, description);
        courDAO.updateCours(cours);
        response.sendRedirect("listcour");
    }

    private void deleteCours(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        courDAO.deleteCours(id);
        response.sendRedirect("listcour");
    }
}