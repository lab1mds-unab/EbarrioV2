/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.List;
import modelo.Conectar;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Francisco Sáez Guerra
 */

//Controlador para la vista consumoProyecto.htm // Vista para USUARIO

public class ConsumoProyectoController {
    private JdbcTemplate jdbcTemplate;

    public ConsumoProyectoController() {
        Conectar con = new Conectar();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
    }
    
    @RequestMapping("consumoProyecto.htm")
    public ModelAndView consumoProyecto()
    {
       ModelAndView mav = new ModelAndView();
       String sql1="SELECT * FROM proyectos WHERE idproyectos = '1'";
       String sql2="SELECT * FROM usuario WHERE email = 'c@unab.cl'";
       String sql3="SELECT * FROM consumohistorico WHERE emailuser = 'c@unab.cl'";
       String sql4="SELECT meta, (promValorMens -(promValorMens * CONCAT('0.', meta))) 'Total', promValorMens FROM consumohistorico, proyectos WHERE idproyectos = 1 AND emailuser = 'c@unab.cl';";
       List datosDetalleProyecto = this.jdbcTemplate.queryForList(sql1);
       List datosUsu = this.jdbcTemplate.queryForList(sql2);
       List datoConsumo = this.jdbcTemplate.queryForList(sql3);
       List prom = this.jdbcTemplate.queryForList(sql4);
       mav.addObject("datosDetalle", datosDetalleProyecto);
       mav.addObject("datosUser", datosUsu);
       mav.addObject("datoConsHist", datoConsumo);
       mav.addObject("promMens", prom);
       mav.setViewName("consumoProyecto");
       return mav;
    }
}
