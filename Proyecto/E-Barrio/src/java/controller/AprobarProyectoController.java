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

//Controlador para la vista de tipo *Hidden* aprobarProyecto.htm // Vista para ADMINISTRADOR
//Controlador para la vista de tipo *Hidden* terminarProyecto.htm // Vista para ADMINISTRADOR
//Controlador para la vista de tipo *Hidden* adjudicarProyecto.htm // Vista para ADMINISTRADOR

public class AprobarProyectoController {
    private JdbcTemplate jdbcTemplate;

    public AprobarProyectoController() {
        Conectar con = new Conectar();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
    }
    
    @RequestMapping("aprobarProyecto.htm")
    public ModelAndView aprobar(HttpServletRequest request)
    {
        int id=Integer.parseInt(request.getParameter("id"));
        this.jdbcTemplate.update("update proyectos set estado= 'En proceso fase 1' " + "where " + "idproyectos=? ", id);
        this.jdbcTemplate.update("update proyectos set aprobado= 'Si' " + "where " + "idproyectos=? ", id);
        return new ModelAndView("redirect:/mantenedorProyectos.htm");
    }
    
    @RequestMapping("terminarProyecto.htm")
    public ModelAndView terminar(HttpServletRequest request)
    {
        int id=Integer.parseInt(request.getParameter("id"));
        this.jdbcTemplate.update("update proyectos set estado= 'Terminado Fase 1' " + "where " + "idproyectos=? ", id);
        this.jdbcTemplate.update("update proyectos set aprobado= 'Si' " + "where " + "idproyectos=? ", id);
        return new ModelAndView("redirect:/mantenedorProyectos.htm");
    }
    
    @RequestMapping("adjudicarProyecto.htm")
    public ModelAndView adjudicar(HttpServletRequest request)
    {
        int id=Integer.parseInt(request.getParameter("id"));
        this.jdbcTemplate.update("update proyectos set estado= 'Adjudicado Fase 2' " + "where " + "idproyectos=? ", id);
        this.jdbcTemplate.update("update proyectos set aprobado= 'Si' " + "where " + "idproyectos=? ", id);
        return new ModelAndView("redirect:/mantenedorProyectos.htm");
    }
    
}
