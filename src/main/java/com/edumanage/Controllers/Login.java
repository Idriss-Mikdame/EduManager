package com.edumanage.Controllers;

import com.edumanage.Models.Admin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;

@WebServlet("/idriss")
public class Login extends HttpServlet {
    private HashMap<String, String> admins = new HashMap<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public Login() {
        super();
        admins.put("idriss", "12345");
        admins.put("ali", "ali123");
        admins.put("aicha", "54321");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String msg;

        if (username == null || password == null || username.trim().isEmpty() || password.trim().isEmpty()) {
            msg = "Username or password is empty :)";
            request.setAttribute("message", msg);
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } else {
            // Correction de la vÃ©rification du mot de passe
            if (admins.containsKey(username) && admins.containsValue(password)) {
                Admin admin = new Admin();
                admin.setUsername(username);
                admin.setPassword(password);

                request.getSession().setAttribute("admin", admin);
                //  request.setAttribute("client", client);

                response.sendRedirect("index.jsp");
                // this.getServletContext().getRequestDispatcher("/espace_member.jsp").forward(request, response);
            } else {
                msg = "Username or password is incorrect. :(";
                request.setAttribute("message", msg);
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        }
    }
}
