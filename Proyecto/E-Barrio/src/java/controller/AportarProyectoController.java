/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import modelo.Conectar;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Francisco Sáez Guerra
 */

//Controlador para la vista aporteProyecto.htm // Vista para USUARIO
//REQUIERE ATENCIÓN PARA HACERLA FUNCIONAR

public class AportarProyectoController {

    private JdbcTemplate jdbcTemplate;

    public AportarProyectoController() {
        Conectar con = new Conectar();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
    }

    @RequestMapping("aporteProyecto.htm")
    public ModelAndView aporteProyecto()
    {
       ModelAndView mav = new ModelAndView();
       String sql1="SELECT * FROM proyectos WHERE aprobado = 'Si'";
       List datosAporte = this.jdbcTemplate.queryForList(sql1);
       mav.addObject("proyectoAporte", datosAporte);
       mav.setViewName("aporteProyecto");
       return mav;
    }
}