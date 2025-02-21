<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Course</title>
</head>
<body>
<h1>Edit Course</h1>
<form action="update" method="post">
    <input type="hidden" name="id" value="${cours.id}">
    <label for="nomcour">Course Name:</label>
    <input type="text" id="nomcour" name="nomcour" value="${cours.nomducours}" required>
    <br>
    <label for="description">Description:</label>
    <input type="text" id="description" name="description" value="${cours.description}" required>
    <br>
    <input type="submit" value="Update Course">
</form>
</body>
</html>