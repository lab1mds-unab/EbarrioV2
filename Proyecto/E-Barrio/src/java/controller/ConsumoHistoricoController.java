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

//Controlador para la vista consumoHistorico.htm // Vista para USUARIO

public class ConsumoHistoricoController {
    private JdbcTemplate jdbcTemplate;
    
    public ConsumoHistoricoController() {
        Conectar con = new Conectar();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
    }
    
    @RequestMapping("consumoHistorico.htm")
    public ModelAndView consumoHistorico()
    {
       ModelAndView mav = new ModelAndView();
       String sql="SELECT emailuser, nombre, mes1, mes2, mes3, mes4, mes5, mes6, "
               + "kwh1, kwh2, kwh3, kwh4, kwh5, kwh6, "
               + "valor1, valor2, valor3, valor4, valor5, valor6, numcliente, distribuidora, direccion, inmueble, medidor, promKwh, promValorMens "
               + "FROM consumohistorico INNER JOIN usuario WHERE consumohistorico.emailuser = usuario.email";
       List datosUserConsumo = this.jdbcTemplate.queryForList(sql);
       mav.addObject("ConsuHist", datosUserConsumo);
       mav.setViewName("consumoHistorico");
       return mav;
    }
    
    //Sentencia SQL para Test de obtención de Datos Específicos. Probar en MySQL:
    //SELECT emailuser 'Correo Uusuario', mes1 'Primer Mes', mes2 'Segundo Mes', mes3 'Tercer Mes', mes4 'Cuarto Mes', mes5 'Quinto Mes', mes6 'Sexto Mes', kwh1 'Consumo Mes 1', kwh2 'Consumo Mes 2', kwh3 'Consumo Mes 3', kwh4 'Consumo Mes 4', kwh5 'Consumo Mes 5', kwh6 'Consumo Mes 6', CONCAT('$',valor1) 'Total Mes 1', CONCAT('$',valor2) 'Total Mes 2', CONCAT('$',valor3) 'Total Mes 3', CONCAT('$',valor4) 'Total Mes 4', CONCAT('$',valor5) 'Total Mes 5', CONCAT('$',valor6) 'Total Mes 6' FROM consumohistorico INNER JOIN usuario WHERE consumohistorico.emailuser = usuario.email;

}