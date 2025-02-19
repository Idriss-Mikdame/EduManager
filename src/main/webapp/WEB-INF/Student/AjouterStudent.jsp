<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Employee</title>
    <!-- Add Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }
        h1 {
            color: #343a40;
            text-align: center;
        }
        .form-group label {
            color: #495057;
            font-weight: 600;
        }
        .form-control {
            border-radius: 20px;
        }
        .btn-custom {
            background-color: #6c757d;
            border-color: #6c757d;
            border-radius: 20px;
            width: 100%;
        }
        .btn-custom:hover {
            background-color: #5a6268;
            border-color: #545b62;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h1 style="color: #007bff">Ajouter un Student </h1>
    <form action="createe" method="post">
        <div class="form-group">
            <label for="name">Nom:</label>
            <input type="text" class="form-control" name="nom" id="name">
        </div>
        <div class="form-group">
            <label for="prenom">Prénom:</label>
            <input type="text" class="form-control" name="prenom" id="prenom">
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="text" class="form-control" name="email" id="email">
        </div>
        <div class="form-group">
            <label for="poste">Datenaiss:</label>
            <input type="text" class="form-control" name="Datenaiss" id="poste">
        </div>
        <button type="submit" class="btn btn-custom" style="background-color: cadetblue">Entrer</button>
    </form>
</div>
</body>
</html>