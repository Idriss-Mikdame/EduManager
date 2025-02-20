<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee List</title>
    <!-- Add Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Custom CSS -->
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
    <h1>Listes des EmployÃ©es</h1>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Prenom</th>
            <th>Email</th>
            <th>Poste</th>
            <th>Salaire</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="person" items="${ListP}">
            <tr>
                <td>${person.id}</td>
                <td>${person.nom}</td>
                <td>${person.prenom}</td>
                <td>${person.email}</td>
                <td>${person.poste}</td>
                <td>${person.salaire}</td>
                <td>
                    <a href="update?id=${person.id}" class="btn btn-warning btn-sm">Modifier</a>
                    <form action="delete" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="${person.id}">
                        <button type="submit" class="btn btn-danger btn-sm">Supprimer</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="create" class="btn btn-success">Add New Employee</a>
</div>
</body>
</html>