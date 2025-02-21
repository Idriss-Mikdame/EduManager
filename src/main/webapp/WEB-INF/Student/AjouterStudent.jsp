<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Student</title>
</head>
<body>
<h1>Add New Student</h1>
<form action="insert" method="post">
    <label for="nom">First Name:</label>
    <input type="text" id="nom" name="nom" required>
    <br>
    <label for="prenom">Last Name:</label>
    <input type="text" id="prenom" name="prenom" required>
    <br>
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required>
    <br>
    <label for="datenaissance">Date of Birth:</label>
    <input type="text" id="datenaissance" name="datenaissance" required>
    <br>
    <input type="submit" value="Add Student">
</form>
</body>
</html>