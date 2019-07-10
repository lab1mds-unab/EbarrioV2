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

//Controlador para la vista de tipo *Hidden* bloquearUser.htm // Vista para ADMINISTRADOR

public class BloquearUserController {
    private JdbcTemplate jdbcTemplate;

    public BloquearUserController() {
        Conectar con = new Conectar();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
    }
    
    @RequestMapping("bloquearUser.htm")
    public ModelAndView bloquear(HttpServletRequest request)
    {
        int id=Integer.parseInt(request.getParameter("id"));
        this.jdbcTemplate.update("update usuario set nivel= '0' " + "where " + "id=? ", id);
        this.jdbcTemplate.update("update usuario set estado= 'off' " + "where " + "id=? ", id);
        return new ModelAndView("redirect:/mantenedorUser.htm");
    }
    
}
