<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Student</title>
</head>
<body>
<h1>Edit Student</h1>
<form action="update" method="post">
    <input type="hidden" name="id" value="${student.id}">
    <label for="nom">First Name:</label>
    <input type="text" id="nom" name="nom" value="${student.nom}" required>
    <br>
    <label for="prenom">Last Name:</label>
    <input type="text" id="prenom" name="prenom" value="${student.prenom}" required>
    <br>
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" value="${student.email}" required>
    <br>
    <label for="datenaissance">Date of Birth:</label>
    <input type="text" id="datenaissance" name="datenaissance" value="${student.datenaiss}" required>
    <br>
    <input type="submit" value="Update Student">
</form>
</body>
</html>