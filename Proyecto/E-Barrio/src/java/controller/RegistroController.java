/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import static java.lang.System.out;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;
import modelo.Conectar;
import modelo.Registro;
import modelo.RegistroValidar;
import org.springframework.http.HttpStatus;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Francisco Sáez Guerra
 */

//Controlador de la vista registro.htm // Vista TODO USUARIO
@Controller
@RequestMapping("registro.htm")

public class RegistroController {

    RegistroValidar registroValidar;
    private JdbcTemplate jdbcTemplate;

    public RegistroController() {
        this.registroValidar = new RegistroValidar();
        Conectar con = new Conectar();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());

    }

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView registro() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("registro");
        mav.addObject("registro", new Registro());
        return mav;
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView registro(@ModelAttribute("registro") Registro r, BindingResult result, SessionStatus status) throws Exception {

        this.registroValidar.validate(r, result);

        if (result.hasErrors()) {
            //Volvemos al formulario porque los datos ingresados por el usuario no son correctos
            //Es decir que se ejecutó la validación
            ModelAndView mav = new ModelAndView();
            mav.setViewName("registro");
            mav.addObject("registro", new Registro());
            return mav;
        } else {
            // Se debe mejorar esta parte cuando alguien ingresa un correo ya registrado a una vista más amigable o a un mensaje de Alerta en pantalla.
            try {
                this.jdbcTemplate.update("insert into usuario (nombre, password, email, nivel) values (?,?,?,?)",
                        r.getNombre(), r.getPassword(), r.getEmail(), r.getNivel());

                return new ModelAndView("redirect:/regisExito.htm");
            } catch (Exception e) { //Solución momentánea a Excepción para que no se repita un EMAIL ingresado.
                throw new Exception("Lo sentimos, el Email ya ha sido ingresado");
            }
        }
    }
}
