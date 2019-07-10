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

//Controlador para la vista de tipo *Hidden* eliminarProyecto.htm // Vista para ADMINISTRADOR

public class EliminarProyectoController {
    private JdbcTemplate jdbcTemplate;

    public EliminarProyectoController() {
        Conectar con = new Conectar();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
    }
    
    @RequestMapping("eliminarProyecto.htm")
    public ModelAndView eliminarProyecto (HttpServletRequest request)
    {
        int id=Integer.parseInt(request.getParameter("id"));
        this.jdbcTemplate.update("delete from proyectos " + "where " + "idproyectos=? ", id);
        return new ModelAndView("redirect:/mantenedorProyectos.htm");
    }
    
}
