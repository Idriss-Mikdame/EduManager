<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Gestion des Étudiants et des Cours</title>
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
        .btn-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 30px;
        }
        .btn-custom {
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btn-custom:hover {
            opacity: 0.9;
        }
        .form-container {
            max-width: 500px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border: 1px solid #dee2e6;
            display: none; /* Hidden by default */
        }
        .form-container.active {
            display: block; /* Show when active */
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
            background-color: #28a745;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }
        input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Gestion des Étudiants et des Cours</h1>
    <div class="btn-container">
        <button class="btn-custom btn-primary" onclick="showForm('studentForm')">Ajouter un Étudiant</button>
        <button class="btn-custom btn-secondary" onclick="showForm('courseForm')">Ajouter un Cours</button>
    </div>

    <!-- Formulaire pour ajouter un étudiant -->
    <div id="studentForm" class="form-container">
        <h2>Ajouter un Étudiant</h2>
        <form action="insertStudent" method="post">
            <div class="form-group">
                <label for="nom">First Name:</label>
                <input type="text" id="nom" name="nom" required>
            </div>
            <div class="form-group">
                <label for="prenom">Last Name:</label>
                <input type="text" id="prenom" name="prenom" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="datenaissance">Date of Birth:</label>
                <input type="text" id="datenaissance" name="datenaissance" required>
            </div>
            <input type="submit" value="Ajouter l'Étudiant">
        </form>
    </div>

    <!-- Formulaire pour ajouter un cours -->
    <div id="courseForm" class="form-container">
        <h2>Ajouter un Cours</h2>
        <form action="insertCourse" method="post">
            <div class="form-group">
                <label for="courseName">Nom du Cours:</label>
                <input type="text" id="courseName" name="courseName" required>
            </div>
            <div class="form-group">
                <label for="courseCode">Code du Cours:</label>
                <input type="text" id="courseCode" name="courseCode" required>
            </div>
            <div class="form-group">
                <label for="courseDescription">Description:</label>
                <input type="text" id="courseDescription" name="courseDescription" required>
            </div>
            <input type="submit" value="Ajouter le Cours">
        </form>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Custom JS -->
<script>
    function showForm(formId) {
        // Hide all forms
        document.querySelectorAll('.form-container').forEach(form => {
            form.classList.remove('active');
        });
        // Show the selected form
        document.getElementById(formId).classList.add('active');
    }
</script>
</body>
</html>