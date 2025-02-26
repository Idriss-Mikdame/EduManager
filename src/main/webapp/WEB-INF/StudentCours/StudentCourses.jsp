<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Cours de l'Étudiant</title>
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
        h1, h2, h3 {
            color: #343a40;
            margin-bottom: 20px;
            font-weight: bold;
        }
        h1 {
            text-align: center;
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
        .student-info {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }
        .student-info p {
            margin-bottom: 5px;
            font-size: 16px;
        }
        .student-info strong {
            color: #495057;
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
        .no-courses {
            padding: 20px;
            text-align: center;
            color: #6c757d;
            font-style: italic;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Cours de l'Étudiant</h1>

    <a href="${pageContext.request.contextPath}/studentcours/list" class="btn btn-secondary btn-back">
        <i class="fas fa-arrow-left"></i> Retour à la liste
    </a>

    <div class="student-info">
        <h3>Informations de l'Étudiant</h3>
        <p><strong>ID:</strong> ${student.id}</p>
        <p><strong>Nom:</strong> ${student.nom}</p>
        <p><strong>Prénom:</strong> ${student.prenom}</p>
        <p><strong>Email:</strong> ${student.email}</p>
        <p><strong>Date de Naissance:</strong> ${student.datenaiss}</p>
    </div>

    <div class="card">
        <div class="card-header">
            Cours de ${student.prenom} ${student.nom}
        </div>
        <div class="card-body">
            <c:if test="${empty studentCourses}">
                <div class="no-courses">
                    <p>Cet étudiant n'est inscrit à aucun cours.</p>
                </div>
            </c:if>

            <c:if test="${not empty studentCourses}">
                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nom du Cours</th>
                        <th>Description</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="course" items="${studentCourses}">
                        <tr>
                            <td><c:out value="${course.id}" /></td>
                            <td><c:out value="${course.nomducours}" /></td>
                            <td><c:out value="${course.description}" /></td>
                            <td>
                                <a href="${pageContext.request.contextPath}/studentcours/detachCourse?studentId=${student.id}&courseId=${course.id}"
                                   class="btn btn-danger btn-sm btn-action"
                                   onclick="return confirm('Êtes-vous sûr de vouloir désinscrire cet étudiant de ce cours?');">
                                    <i class="fas fa-unlink"></i> Désinscrire
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>

            <div class="mt-3">
                <a href="${pageContext.request.contextPath}/studentcours/attach" class="btn btn-primary">
                    <i class="fas fa-plus-circle"></i> Inscrire à un nouveau cours
                </a>
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