<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Usuario</title>
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
        form {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 400px;
            margin: 0 auto;
        }
        label {
            display: block;
            margin: 10px 0 5px;
            color: #333;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        button[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        button[type="submit"]:hover {
            background-color: #45a049;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #333;
            text-decoration: none;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>Editar Usuario</h2>

    <form action="usuarios" method="post">
        <input type="hidden" name="action" value="editar">
        <input type="hidden" name="id" value="${usuario.id}">
        
        <label>Nombre:</label>
        <input type="text" name="nombre" value="${usuario.nombre}" required>
        
        <label>Teléfono:</label>
        <input type="text" name="telefono" value="${usuario.telefono}" required>
        
        <label>Dirección:</label>
        <input type="text" name="direccion" value="${usuario.direccion}" required>
        
        <button type="submit">Actualizar</button>
    </form>

    <a href="usuarios" class="back-link">Volver al listado de usuarios</a>
</body>
</html>
