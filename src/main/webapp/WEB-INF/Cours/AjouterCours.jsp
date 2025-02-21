<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Course</title>
</head>
<body>
<h1>Add New Course</h1>
<form action="insertcour" method="post">
    <label for="nomcour">Course Name:</label>
    <input type="text" id="nomcour" name="nomcour" required>
    <br>
    <label for="description">Description:</label>
    <input type="text" id="description" name="description" required>
    <br>
    <input type="submit" value="Add Course">
</form>
</body>
</html>