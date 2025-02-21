
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
    <title>List of Courses</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }

        h1 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 10px;
            border-bottom: 2px solid #3498db;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
            margin-bottom: 20px;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #3498db;
            color: white;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        a {
            text-decoration: none;
            padding: 6px 12px;
            border-radius: 4px;
            display: inline-block;
            margin: 2px;
        }

        td a {
            color: white;
            margin-right: 5px;
        }

        td a[href*="edit"] {
            background-color: #2ecc71;
        }

        td a[href*="delete"] {
            background-color: #e74c3c;
        }

        a[href*="newcour"] {
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            display: inline-block;
            margin-top: 10px;
            transition: background-color 0.3s;
        }

        a[href*="newcour"]:hover {
            background-color: #2980b9;
        }

        td a:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>
<h1>List of Courses</h1>
<table>
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
