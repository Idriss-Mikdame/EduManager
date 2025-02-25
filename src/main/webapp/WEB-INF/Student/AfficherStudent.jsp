<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html lang="en">
<head>
    <title>Student Management System</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Custom CSS -->
    <style>
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            padding: 30px 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .dashboard-container {
            max-width: 1500px;
            margin: 0 auto;
            padding: 20px;
        }

        .card {
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            border: none;
            overflow: hidden;
        }

        .card-header {
            background: #3f51b5;
            color: white;
            padding: 20px;
            font-weight: 600;
            font-size: 1.5rem;
            border-bottom: none;
        }

        .table {
            margin-bottom: 0;
        }

        .table thead th {
            background-color: #f8f9fa;
            border-bottom: 2px solid #dee2e6;
            color: #495057;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 0.5px;
        }

        .btn-action {
            border-radius: 50px;
            padding: 8px 16px;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-size: 0.75rem;
            margin: 0 5px;
            display: inline-block;
        }

        .btn-edit {
            background-color: #4caf50;
            border-color: #4caf50;
            color: white;
        }

        .btn-edit:hover {
            background-color: #388e3c;
            border-color: #388e3c;
        }

        .btn-delete {
            background-color: #f44336;
            border-color: #f44336;
            color: white;
        }

        .btn-delete:hover {
            background-color: #d32f2f;
            border-color: #d32f2f;
        }

        .btn-add {
            background-color: #2196f3;
            border-color: #2196f3;
            color: white;
            padding: 12px 30px;
            font-size: 0.9rem;
            border-radius: 50px;
            margin-top: 20px;
            box-shadow: 0 4px 8px rgba(33, 150, 243, 0.3);
        }

        .btn-add:hover {
            background-color: #1976d2;
            border-color: #1976d2;
        }

        .student-count {
            background-color: #ff9800;
            color: white;
            border-radius: 50px;
            padding: 6px 15px;
            font-size: 0.8rem;
            font-weight: 600;
            margin-left: 10px;
        }

        .empty-state {
            padding: 40px;
            text-align: center;
            color: #6c757d;
        }

        /* Table Row Hover Effect */
        tbody tr:hover {
            background-color: rgba(33, 150, 243, 0.1);
        }

        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
        }
    </style>
</head>
<body>
<div class="dashboard-container">
    <div class="card">
        <div class="card-header d-flex justify-content-between align-items-center">
            <div>
                <i class="fas fa-user-graduate me-2"></i> Student Management
                <span class="student-count">
                    <c:set var="count" value="${etudiantList.size()}" />
                    <c:out value="${count}" /> Students
                </span>
            </div>
            <a href="new" class="btn btn-light">
                <i class="fas fa-plus me-2"></i> New Student
            </a>
        </div>
        <div class="card-body p-0">
            <c:choose>
                <c:when test="${empty etudiantList}">
                    <div class="empty-state">
                        <i class="fas fa-users fa-3x mb-3 text-muted"></i>
                        <h4>No Students Found</h4>
                        <p>Add new students to get started</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Email</th>
                                <th>Date of Birth</th>
                                <th class="text-center">Actions</th>
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
                                    <td class="text-center action-buttons">
                                        <a href="edit?id=${student.id}" class="btn btn-action btn-edit">
                                            <i class="fas fa-pencil-alt me-1"></i> Edit
                                        </a>
                                        <a href="delete?id=${student.id}" class="btn btn-action btn-delete"
                                           onclick="return confirm('Are you sure you want to delete this student?');">
                                            <i class="fas fa-trash-alt me-1"></i> Delete
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <div class="text-center">
        <a href="new" class="btn btn-add">
            <i class="fas fa-plus-circle me-2"></i> Add New Student
        </a>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>