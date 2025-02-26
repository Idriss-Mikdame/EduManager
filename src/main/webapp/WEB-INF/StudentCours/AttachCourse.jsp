<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Associer un Étudiant à un Cours</title>
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
        .form-container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border: 1px solid #dee2e6;
        }
        label {
            font-weight: bold;
            color: #495057;
            margin-bottom: 10px;
            display: block;
        }
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ced4da;
            border-radius: 5px;
            font-size: 16px;
        }
        select:focus {
            border-color: #80bdff;
            outline: none;
            box-shadow: 0 0 5px rgba(128, 189, 255, 0.5);
        }
        .btn-submit {
            background-color: #28a745;
            color: #ffffff;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-weight: bold;
        }
        .btn-submit:hover {
            background-color: #218838;
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
    <h1>Associer un Étudiant à un Cours</h1>

    <a href="${pageContext.request.contextPath}/studentcours/list" class="btn btn-secondary btn-back">
        <i class="fas fa-arrow-left"></i> Retour à la liste
    </a>

    <div class="form-container">
        <form action="${pageContext.request.contextPath}/studentcours/attachCourse" method="post">
            <div class="mb-3">
                <label for="studentId">Sélectionner un Étudiant :</label>
                <select id="studentId" name="studentId" class="form-select" required>
                    <option value="">-- Choisir un étudiant --</option>
                    <c:forEach var="student" items="${studentList}">
                        <option value="${student.id}">
                                ${student.nom} ${student.prenom} (${student.email})
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="mb-3">
                <label for="courseId">Sélectionner un Cours :</label>
                <select id="courseId" name="courseId" class="form-select" required>
                    <option value="">-- Choisir un cours --</option>
                    <c:forEach var="course" items="${courseList}">
                        <option value="${course.id}">
                                ${course.nomducours} - ${course.description}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <button type="submit" class="btn-submit">
                <i class="fas fa-link"></i> Associer
            </button>
        </form>
    </div>
</div>

<footer>
    <p>&copy; 2025 Gestion des Étudiants et des Cours. Tous droits réservés.</p>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>