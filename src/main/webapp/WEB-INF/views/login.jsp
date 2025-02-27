<%@ page import="java.io.PrintWriter" %>
<%--
  Created by IntelliJ IDEA.
  User: Admine
  Date: 25/02/2025
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            /* Subtle gradient background animation */
            background: linear-gradient(45deg, #f3f3f3, #e9e9e9, #f3f3f3);
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .login-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
            transform: translateY(20px);
            opacity: 0;
            animation: fadeInUp 0.8s ease forwards;
        }

        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .login-container h2 {
            margin-bottom: 20px;
            color: #333;
            position: relative;
        }

        .login-container h2:after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: -5px;
            left: 50%;
            background-color: #28a745;
            transform: translateX(-50%);
            animation: underline 1.5s ease forwards;
            animation-delay: 0.5s;
        }

        @keyframes underline {
            to { width: 50px; }
        }

        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 15px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            transition: all 0.3s ease;
            opacity: 0;
            transform: translateX(-10px);
        }

        .login-container input[type="text"] {
            animation: slideIn 0.5s ease forwards;
            animation-delay: 0.3s;
        }

        .login-container input[type="password"] {
            animation: slideIn 0.5s ease forwards;
            animation-delay: 0.5s;
        }

        @keyframes slideIn {
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .login-container input[type="text"]:focus,
        .login-container input[type="password"]:focus {
            border-color: #28a745;
            box-shadow: 0 0 8px rgba(40, 167, 69, 0.2);
            outline: none;
        }

        .login-container button[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #28a745;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
            opacity: 0;
            transform: translateY(10px);
            animation: fadeIn 0.5s ease forwards;
            animation-delay: 0.7s;
        }

        @keyframes fadeIn {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .login-container button[type="submit"]:hover {
            background-color: #218838;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .login-container button[type="submit"]:active {
            transform: translateY(0);
        }

        .error-message {
            color: #e74c3c;
            margin-top: 15px;
            font-size: 14px;
            animation: shake 0.5s cubic-bezier(.36,.07,.19,.97) both;
        }

        @keyframes shake {
            10%, 90% { transform: translate3d(-1px, 0, 0); }
            20%, 80% { transform: translate3d(2px, 0, 0); }
            30%, 50%, 70% { transform: translate3d(-4px, 0, 0); }
            40%, 60% { transform: translate3d(4px, 0, 0); }
        }
    </style>
</head>

<body>
<div class="login-container">
    <h2>Welcome Back</h2>
    <form action="login" method="post">
        <input type="text" placeholder="Username" name="username" required>
        <input type="password" placeholder="Password" name="password" required>
        <% if (request.getAttribute("error") != null) { %>
        <p class="error-message"><%= request.getAttribute("error") %></p>
        <% } %>
        <button type="submit">Login</button>
    </form>
</div>
</body>
</html>