<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Listado de Usuarios</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            margin: 0 auto;
            border-collapse: collapse;
            width: 80%;
            max-width: 800px;
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        a {
            color: #4CAF50;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        .actions {
            display: flex;
            justify-content: space-between;
        }
        .action-button {
            width: 48%;
            text-align: center;
            padding: 6px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .action-button:hover {
            background-color: #45a049;
        }
        .add-user-link {
            display: block;
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
            color: #4CAF50;
        }
    </style>
</head>
<body>
    <h2>Usuarios</h2>
    <a href="crear.jsp" class="add-user-link">Agregar Usuario</a>
    <table>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Teléfono</th>
            <th>Dirección</th>
            <th>Acciones</th>
        </tr>
        <c:forEach var="usuario" items="${usuarios}">
            <tr>
                <td>${usuario.id}</td>
                <td>${usuario.nombre}</td>
                <td>${usuario.telefono}</td>
                <td>${usuario.direccion}</td>
                <td class="actions">
                    <a href="usuarios?action=editar&id=${usuario.id}" class="action-button">Editar</a>
                    <a href="usuarios?action=eliminar&id=${usuario.id}" class="action-button">Eliminar</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
