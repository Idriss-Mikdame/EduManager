<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Liste des Étudiants</title>
    <!-- Ajout de Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- CSS personnalisé -->
    <style>
        body {
            background-color: #f0f2f5;
        }
        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #343a40;
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            border-collapse: separate;
            border-spacing: 0 15px;
        }
        th {
            background-color: #007bff;
            color: white;
            padding: 10px;
        }
        td {
            background-color: #f8f9fa;
            padding: 10px;
            text-align: center;
            vertical-align: middle;
        }
        .btn-sm {
            padding: 5px 10px;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h1>Liste des Étudiants</h1>
    <table class="table table-bordered">
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
        <c:forEach var="student" items="${listStudents}">
            <tr>
                <td>${student.id}</td>
                <td>${student.nom}</td>
                <td>${student.prenom}</td>
                <td>${student.email}</td>
                <td>${student.datenaiss}</td>
                <td>
                    <a href="students?action=edit&id=${student.id}" class="btn btn-warning btn-sm">Modifier</a>
                    <form action="students?action=delete" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="${student.id}">
                        <button type="submit" class="btn btn-danger btn-sm">Supprimer</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="/insert" class="btn btn-success">Ajouter un nouvel étudiant</a>
</div>
</body>
</html>
