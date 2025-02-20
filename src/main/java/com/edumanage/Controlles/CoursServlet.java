package com.edumanage.Controlles;

import com.edumanage.dao.coursDAO;
import com.edumanage.model.Cours;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/create")
public class CoursServlet extends HttpServlet {
    private coursDAO courDAO;

    @Override
    public void init() throws ServletException {
        // Initialisation de l'instance de coursDAO dans le champ d'instance
        courDAO = new coursDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/Cours/AjouterCours.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Si le formulaire fournit un id, on le récupère ; sinon, on utilisera l'auto-incrémentation de la BDD
        int id = 0;
        String idParam = request.getParameter("id");
        if (idParam != null && !idParam.isEmpty()) {
            try {
                id = Integer.parseInt(idParam);
            } catch (NumberFormatException e) {
                // Optionnel : gérer l'erreur de format ici
                e.printStackTrace();
            }
        }
        String nomducours = request.getParameter("NomCours");
        String description = request.getParameter("Description");

        Cours cour = new Cours(id, nomducours, description);
        courDAO.createCours(cour); // Utilisation de l'instance DAO initialisée dans init()

        response.sendRedirect(request.getContextPath() + "/read");
    }

}
