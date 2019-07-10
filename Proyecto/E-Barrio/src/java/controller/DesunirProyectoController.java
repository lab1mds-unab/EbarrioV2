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

//Controlador para la vista de tipo *Hidden* desunirProyecto.htm // Vista para USUARIO

public class DesunirProyectoController {
    private JdbcTemplate jdbcTemplate;

    public DesunirProyectoController() {
        Conectar con = new Conectar();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
    }
    
    @RequestMapping("desunirProyecto.htm")
    public ModelAndView desunirProyecto (HttpServletRequest request)
    {
        int id=Integer.parseInt(request.getParameter("id"));
        this.jdbcTemplate.update("delete from usuarioproyecto " + "where " + "id=? ", id);
        return new ModelAndView("redirect:/proyectos.htm");
    }
    
}
