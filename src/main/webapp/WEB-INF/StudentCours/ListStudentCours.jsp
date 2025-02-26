<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Gestion des Étudiants et des Cours</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        h1, h2 {
            text-align: center;
            color: #343a40;
            margin-bottom: 30px;
            font-weight: bold;
        }
        .container {
            margin-top: 20px;
            margin-bottom: 50px;
        }
        .card {
            margin-bottom: 20px;
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #007bff;
            color: white;
            font-weight: bold;
            border-radius: 10px 10px 0 0 !important;
        }
        .table {
            margin-bottom: 0;
        }
        .table th {
            background-color: #f8f9fa;
            color: #495057;
        }
        .btn-action {
            margin-right: 5px;
        }
        footer {
            background-color: #343a40;
            color: #ffffff;
            padding: 15px;
            text-align: center;
            margin-top: auto;
            position: sticky;
            bottom: 0;
            width: 100%;
        }
        .btn-back {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Gestion des Étudiants et des Cours</h1>

    <a href="${pageContext.request.contextPath}/" class="btn btn-secondary btn-back">
        <i class="fas fa-arrow-left"></i> Retour à l'accueil
    </a>

    <a href="${pageContext.request.contextPath}/studentcours/attach" class="btn btn-primary mb-3">
        <i class="fas fa-link"></i> Associer un Étudiant à un Cours
    </a>

    <div class="card">
        <div class="card-header">
            Liste des Étudiants
        </div>
        <div class="card-body">
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Prénom</th>
                    <th>Email</th>
                    <th>Date de Naissance</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="student" items="${studentList}">
                    <tr>
                        <td><c:out value="${student.id}" /></td>
                        <td><c:out value="${student.nom}" /></td>
                        <td><c:out value="${student.prenom}" /></td>
                        <td><c:out value="${student.email}" /></td>
                        <td><c:out value="${student.datenaiss}" /></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/studentcours/studentCourses?id=${student.id}" class="btn btn-info btn-sm btn-action">
                                <i class="fas fa-book"></i> Voir les Cours
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <div class="card">
        <div class="card-header">
            Liste des Cours
        </div>
        <div class="card-body">
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Nom du Cours</th>
                    <th>Description</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="course" items="${courseList}">
                    <tr>
                        <td><c:out value="${course.id}" /></td>
                        <td><c:out value="${course.nomducours}" /></td>
                        <td><c:out value="${course.description}" /></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<footer>
    <p>&copy; 2025 Gestion des Étudiants et des Cours. Tous droits réservés.</p>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>