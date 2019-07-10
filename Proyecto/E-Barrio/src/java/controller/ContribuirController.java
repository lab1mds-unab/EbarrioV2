/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.http.HttpServletRequest;
import modelo.Conectar;
import modelo.UsuarioProyecto;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Francisco Sáez Guerra
 */

//Controlador para la vista de tipo *Hidden* contribuirProyecto.htm // Vista para USUARIO
//REQUIERE ATENCIÓN PARA HACERLA FUNCIONAR

public class ContribuirController {
    private JdbcTemplate jdbcTemplate;

    public ContribuirController() {
        Conectar con = new Conectar();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
    }
    
    @RequestMapping("contribuirProyecto.htm")
    public ModelAndView contribuir (HttpServletRequest request)
    {
        //int id=Integer.parseInt(request.getParameter("id"));
        //this.jdbcTemplate.update("INSERT INTO usuarioproyecto (id, idusuario, idproyecto) values (?,?,?)");
        return new ModelAndView("redirect:/proyectos.htm");
    }
    
}
