<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Gestion des Étudiants et des Cours</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh; /* Pour que le footer reste en bas */
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
            flex-wrap: wrap;
        }
        .btn-custom {
            padding: 15px 30px;
            font-size: 18px;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
            border: none;
            color: #fff;
            text-align: center;
            text-decoration: none;
            display: inline-block;
        }
        .btn-custom:hover {
            transform: scale(1.05); /* Effet de zoom au survol */
            opacity: 0.9;
        }
        .btn-primary-custom {
            background-color: #007bff; /* Bleu pour Ajouter un Étudiant */
        }
        .btn-primary-custom:hover {
            background-color: #0056b3;
        }
        .btn-secondary-custom {
            background-color: #6c757d; /* Gris pour Ajouter un Cours */
        }
        .btn-secondary-custom:hover {
            background-color: #5a6268;
        }
        .btn-success-custom {
            background-color: #28a745; /* Vert pour Lister les Étudiants */
        }
        .btn-success-custom:hover {
            background-color: #218838;
        }
        .btn-info-custom {
            background-color: #17a2b8; /* Bleu clair pour Lister les Cours */
        }
        .btn-info-custom:hover {
            background-color: #138496;
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
        /* Footer Fixe */
        footer {
            background-color: #343a40;
            color: #ffffff;
            padding: 15px;
            text-align: center;
            margin-top: auto; /* Pour pousser le footer en bas */
            position: sticky;
            bottom: 0;
            width: 100%;
        }
        .btn-icon {
            margin-right: 8px;
        }
    </style>
</head>
<body>
<!-- Header -->
<header>
    <h1>Gestion des Étudiants et des Cours</h1>
</header>

<div class="container">
    <div class="btn-container">
        <a class="btn-custom btn-primary-custom" href="student/new">
            <i class="fas fa-user-plus btn-icon"></i>Ajouter un Étudiant
        </a>
        <a class="btn-custom btn-secondary-custom" href="cours/newcour">
            <i class="fas fa-book-open btn-icon"></i>Ajouter un Cours
        </a>
        <a class="btn-custom btn-success-custom" href="student/list">
            <i class="fas fa-list btn-icon"></i>Liste des Étudiants
        </a>
        <a class="btn-custom btn-info-custom" href="cours/listcour">
            <i class="fas fa-clipboard-list btn-icon"></i>Liste des Cours
        </a>
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

<!-- Footer Fixe -->
<footer>
    <p>&copy; 2025 Gestion des Étudiants et des Cours. Tous droits réservés.</p>
</footer>

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