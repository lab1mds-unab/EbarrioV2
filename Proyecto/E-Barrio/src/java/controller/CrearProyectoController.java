/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import static java.lang.System.out;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.swing.JOptionPane;
import modelo.Conectar;
import modelo.CrearProyecto;
import modelo.CrearProyectoValidar;
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

//Controlador para la vista crearProyecto.htm // Vista para USUARIO

@Controller
@RequestMapping("crearProyecto.htm")
public class CrearProyectoController {

    CrearProyectoValidar crearProyectoValidar;
    private JdbcTemplate jdbcTemplate;

    public CrearProyectoController() {
        this.crearProyectoValidar = new CrearProyectoValidar();
        Conectar con = new Conectar();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());

    }

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView crearProyecto() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("crearProyecto");
        mav.addObject("crearProyecto", new CrearProyecto());
        return mav;
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView crearProyecto(@ModelAttribute("crearProyecto") CrearProyecto c, BindingResult result, SessionStatus status) {

        this.crearProyectoValidar.validate(c, result);

        if (result.hasErrors()) {
            //Volvemos al formulario porque los datos ingresados por el usuario no son correctos
            //Es decir que se ejecutó la validación
            ModelAndView mav = new ModelAndView();
            mav.setViewName("crearProyecto");
            mav.addObject("crearProyecto", new CrearProyecto());
            return mav;
        } else {
            this.jdbcTemplate.update("insert into proyectos (razonsocial, rutsocial, organizacion, telefono, email, tipo, nombre, tarifa, destinatario, beneficiariodirecto, beneficiarioindirecto, "
                    + "dimensiones, duracion, region, meta, dinero, aporte, manodeobra, materiales, porcentaje) "
                    + "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
                    c.getRazonsocial(), c.getRutsocial(), c.getOrganizacion(), c.getTelefono(), c.getEmail(), c.getTipo(), c.getNombre(), c.getTarifa(), c.getDestinatario(),
                    c.getBeneficiariodirecto(), c.getBeneficiarioindirecto(), c.getDimensiones(), c.getDuracion(), c.getRegion(), c.getMeta(), c.getDinero(), c.getAporte(),
                    c.getManodeobra(), c.getMateriales(), c.getPorcentaje()
            );

            return new ModelAndView("redirect:/regisProye.htm");
        }
    }
}