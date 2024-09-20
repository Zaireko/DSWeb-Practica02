/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.uv.dsweb.practica02;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Asus
 */
@WebServlet("/usuarios")
public class UsuarioServlet extends HttpServlet {

    private UsuarioDAO usuarioDAO;

    @Override
    public void init() {
        usuarioDAO = new UsuarioDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String operation = req.getParameter("action");
        try {
            if ("eliminar".equals(operation)) {
                int userId = Integer.parseInt(req.getParameter("id"));
                usuarioDAO.eliminarUsuario(userId);
                resp.sendRedirect("usuarios?mensaje=Usuario eliminado con éxito");
            } else if ("editar".equals(operation)) {
                String idParam = req.getParameter("id");
                if (idParam != null && !idParam.isEmpty()) {
                    int userId = Integer.parseInt(idParam);
                    Usuario user = usuarioDAO.obtenerUsuarioPorId(userId);
                    req.setAttribute("usuario", user);
                    req.getRequestDispatcher("/editar.jsp").forward(req, resp);
                } else {
                    resp.sendRedirect("usuarios?mensaje=ID no válido");
                }
            } else {
                List<Usuario> userList = usuarioDAO.listarUsuarios();
                req.setAttribute("usuarios", userList);
                req.getRequestDispatcher("/listar.jsp").forward(req, resp);
            }
        } catch (SQLException e) {
            throw new ServletException("Error: ", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String operation = req.getParameter("action");
        try {
            if ("crear".equals(operation)) {
                String nombre = req.getParameter("nombre");
                String telefono = req.getParameter("telefono");
                String direccion = req.getParameter("direccion");
                usuarioDAO.agregarUsuario(new Usuario(0, nombre, telefono, direccion));
                resp.sendRedirect("usuarios?mensaje=Usuario creado con éxito");
            } else if ("editar".equals(operation)) {
                String idParam = req.getParameter("id");
                if (idParam != null && !idParam.isEmpty()) {
                    int userId = Integer.parseInt(idParam);
                    String nombre = req.getParameter("nombre");
                    String telefono = req.getParameter("telefono");
                    String direccion = req.getParameter("direccion");
                    usuarioDAO.actualizarUsuario(new Usuario(userId, nombre, telefono, direccion));
                    resp.sendRedirect("usuarios?mensaje=Usuario actualizado con éxito");
                } else {
                    resp.sendRedirect("usuarios?mensaje=ID no válido");
                }
            }
        } catch (SQLException e) {
            throw new ServletException("Error : ", e);
        }
    }
}