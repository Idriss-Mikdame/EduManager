<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
    <title>List of Courses</title>
</head>
<body>
<h1>List of Courses</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Course Name</th>
        <th>Description</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="cours" items="${coursList}">
        <tr>
            <td>${cours.id}</td>
            <td>${cours.nomducours}</td>
            <td>${cours.description}</td>
            <td>
                <a href="edit?id=${cours.id}">Edit</a>
                <a href="delete?id=${cours.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="newcour">Add New Course</a>
</body>
</html>