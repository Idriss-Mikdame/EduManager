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
        .welcome-section {
            text-align: center;
            margin-bottom: 40px;
        }
        .welcome-section p {
            font-size: 18px;
            color: #6c757d;
            max-width: 800px;
            margin: 0 auto;
            line-height: 1.6;
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
        .btn-warning-custom {
            background-color: #ffc107; /* Jaune pour Gestion des Inscriptions */
        }
        .btn-warning-custom:hover {
            background-color: #e0a800;
        }
        .card-container {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin-top: 30px;
            margin-bottom: 50px;
            flex-wrap: wrap;
        }
        .card {
            width: 18rem;
            border: none;
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }
        .card-img-top {
            height: 160px;
            background-color: #e9ecef;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .card-img-icon {
            font-size: 60px;
            color: #6c757d;
        }
        .card-body {
            padding: 20px;
        }
        .card-title {
            font-weight: bold;
            text-align: center;
            margin-bottom: 15px;
            color: #343a40;
        }
        .card-text {
            color: #6c757d;
            text-align: center;
            margin-bottom: 20px;
        }
        .card-link-container {
            text-align: center;
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
        header{
            display: flex;
            justify-content: space-around;
        }

        a{color: #007bff;
          text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
<!-- Header -->
<header>
    <div class="d-flex">
                <span class="navbar-text me-3">
                    <i class="fa-solid fa-user-circle me-1"></i> ${sessionScope.username}
                </span><form action="logout" method="post">
        <button type="submit" class="btn btn-logout">
            <i class="fa-solid fa-sign-out-alt me-1"></i> Déconnexion
        </button>

    </div>
</header>

<div class="container">
    <div class="welcome-section">
        <p>Bienvenue dans l'application de gestion des étudiants et des cours. Cette plateforme vous permet de gérer efficacement les inscriptions des étudiants aux différents cours disponibles.</p>
    </div>

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
        <a class="btn-custom btn-warning-custom" href="studentcours/list">
            <i class="fas fa-link btn-icon"></i>Gestion des Inscriptions
        </a>
    </div>

    <div class="card-container">
        <!-- Card for Students -->
        <div class="card">
            <div class="card-img-top">
                <i class="fas fa-user-graduate card-img-icon"></i>
            </div>
            <div class="card-body">
                <h5 class="card-title">Gestion des Étudiants</h5>
                <p class="card-text">Ajoutez, modifiez ou supprimez des informations sur les étudiants.</p>
                <div class="card-link-container">
                    <a href="student/list" class="btn btn-success">
                        <i class="fas fa-arrow-right"></i> Accéder
                    </a>
                </div>
            </div>
        </div>

        <!-- Card for Courses -->
        <div class="card">
            <div class="card-img-top">
                <i class="fas fa-book card-img-icon"></i>
            </div>
            <div class="card-body">
                <h5 class="card-title">Gestion des Cours</h5>
                <p class="card-text">Gérez le catalogue de cours disponibles pour les étudiants.</p>
                <div class="card-link-container">
                    <a href="cours/listcour" class="btn btn-info">
                        <i class="fas fa-arrow-right"></i> Accéder
                    </a>
                </div>
            </div>
        </div>

        <!-- Card for Enrollments -->
        <div class="card">
            <div class="card-img-top">
                <i class="fas fa-link card-img-icon"></i>
            </div>
            <div class="card-body">
                <h5 class="card-title">Gestion des Inscriptions</h5>
                <p class="card-text">Associez des étudiants à des cours et gérez les inscriptions.</p>
                <div class="card-link-container">
                    <a href="studentcours/list" class="btn btn-warning">
                        <i class="fas fa-arrow-right"></i> Accéder
                    </a>
                </div>
            </div>
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