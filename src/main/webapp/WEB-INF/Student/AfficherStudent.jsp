<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
    <title>List of Students</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
            padding: 20px;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        .table {
            background-color: #ffffff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .btn-custom {
            margin-right: 5px;
        }
        .container {
            max-width: 900px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="text-primary">List of Students</h1>
    <table class="table table-striped table-bordered text-center">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Date of Birth</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="student" items="${etudiantList}">
            <tr>
                <td>${student.id}</td>
                <td>${student.nom}</td>
                <td>${student.prenom}</td>
                <td>${student.email}</td>
                <td>${student.datenaiss}</td>
                <td>
                    <a href="edit?id=${student.id}" class="btn btn-sm btn-warning btn-custom">Edit</a>
                    <a href="delete?id=${student.id}" class="btn btn-sm btn-danger btn-custom" onclick="return confirm('Are you sure?');">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="text-center">
        <a href="new" class="btn btn-success">Add New Student</a>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>