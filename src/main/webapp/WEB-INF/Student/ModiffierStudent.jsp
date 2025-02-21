<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Student</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #343a40;
            margin-bottom: 30px;
            font-weight: bold;
        }
        form {
            max-width: 500px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border: 1px solid #dee2e6;
        }
        label {
            font-weight: bold;
            color: #495057;
            margin-bottom: 5px;
            display: block;
        }
        input[type="text"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ced4da;
            border-radius: 5px;
            font-size: 16px;
        }
        input[type="text"]:focus,
        input[type="email"]:focus {
            border-color: #80bdff;
            outline: none;
            box-shadow: 0 0 5px rgba(128, 189, 255, 0.5);
        }
        input[type="submit"] {
            background-color: #ffc107;
            color: #000000;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }
        input[type="submit"]:hover {
            background-color: #e0a800;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Edit Student</h1>
    <form action="update" method="post">
        <input type="hidden" name="id" value="${student.id}">
        <div class="form-group">
            <label for="nom">First Name:</label>
            <input type="text" id="nom" name="nom" value="${student.nom}" required>
        </div>
        <div class="form-group">
            <label for="prenom">Last Name:</label>
            <input type="text" id="prenom" name="prenom" value="${student.prenom}" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="${student.email}" required>
        </div>
        <div class="form-group">
            <label for="datenaissance">Date of Birth:</label>
            <input type="text" id="datenaissance" name="datenaissance" value="${student.datenaiss}" required>
        </div>
        <input type="submit" value="Update Student">
    </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
