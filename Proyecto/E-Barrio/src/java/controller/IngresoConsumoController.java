/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import modelo.Conectar;
import java.util.List;
import modelo.IngresoConsumo;
import modelo.IngresoConsumoValidar;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
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

//Controlador para la vista ingresoConsumo.htm // Vista para USUARIO

@Controller
@RequestMapping("ingresoConsumo.htm")
public class IngresoConsumoController {
    
    IngresoConsumoValidar ingresoConsumoValidar;
    private JdbcTemplate jdbcTemplate;

    public IngresoConsumoController() {
        this.ingresoConsumoValidar = new IngresoConsumoValidar();
        Conectar con = new Conectar();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());

    }

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView ingresoConsumo() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("ingresoConsumo");
        mav.addObject("ingresoConsumo", new IngresoConsumo());
        return mav;
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView ingresoConsumo(@ModelAttribute("ingresoConsumo") IngresoConsumo i, BindingResult result, SessionStatus status) {

        this.ingresoConsumoValidar.validate(i, result);
        
        if (result.hasErrors()) {
            //Volvemos al formulario porque los datos ingresados por el usuario no son correctos
            //Es decir que se ejecutó la validación
            ModelAndView mav = new ModelAndView();
            mav.setViewName("ingresoConsumo");
            mav.addObject("ingresoConsumo", new IngresoConsumo());
            return mav;
        } else {
            this.jdbcTemplate.update("insert into consumohistorico (emailuser, numcliente, distribuidora, nomusuario, inmueble, direccion, medidor, mes1, mes2, mes3, mes4, mes5, mes6, kwh1, kwh2, kwh3, "
                    + "kwh4, kwh5, kwh6, valor1, valor2, valor3, valor4, valor5, valor6, promKwh, promValorMens) "
                    + "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
                    i.getEmailuser(), i.getNumcliente(), i.getDistribuidora(), i.getNomusuario(), i.getInmueble(), i.getDireccion(), i.getMedidor(), i.getMes1(), i.getMes2(), i.getMes3(), i.getMes4(), i.getMes5(), 
                    i.getMes6(), i.getKwh1(), i.getKwh2(), i.getKwh3(), i.getKwh4(), i.getKwh5(), i.getKwh6(), i.getValor1(), i.getValor2(), i.getValor3(), i.getValor4(), i.getValor5(), i.getValor6(),
                    i.getPromKwh(), i.getPromValorMens()
            );

            return new ModelAndView("redirect:/ingresoConsumo.htm");
        }
    }
}