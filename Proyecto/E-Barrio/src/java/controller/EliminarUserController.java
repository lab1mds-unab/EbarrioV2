/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.http.HttpServletRequest;
import modelo.Conectar;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Francisco Sáez Guerra
 */

//Controlador para la vista de tipo *Hidden* eliminarUsuario.htm // Vista para ADMINISTRADOR

public class EliminarUserController {
    private JdbcTemplate jdbcTemplate;

    public EliminarUserController() {
        Conectar con = new Conectar();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
    }
    
    @RequestMapping("eliminarUsuario.htm")
    public ModelAndView eliminarUser(HttpServletRequest request)
    {
        int id=Integer.parseInt(request.getParameter("id"));
        this.jdbcTemplate.update("delete from usuario " + "where " + "id=? ", id);
        return new ModelAndView("redirect:/mantenedorUser.htm");
    }
    
}
