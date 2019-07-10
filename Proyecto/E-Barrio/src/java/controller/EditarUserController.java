/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import modelo.Registro;
import modelo.RegistroValidar;
import modelo.Conectar;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
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

//Controlador para la vista editarUsuario.htm // Vista para ADMINISTRADOR

@RequestMapping("editarUsuario.htm")
public class EditarUserController {
    RegistroValidar registroValidar;
    private JdbcTemplate jdbcTemplate;

    public EditarUserController() {
        this.registroValidar = new RegistroValidar();
        Conectar con = new Conectar();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
    }
    
    @RequestMapping(method=RequestMethod.GET)
    public ModelAndView editarUsuario(HttpServletRequest request)
    {
        ModelAndView mav = new ModelAndView();
        int id = Integer.parseInt(request.getParameter("id"));
        Registro dato = this.selectRegistro(id);
        mav.setViewName("editarUsuario");
        mav.addObject("registro", new Registro(id, dato.getNombre(), dato.getPassword(), dato.getEmail(), dato.getNivel(), dato.getEstado()));
        return mav;
    }
    
    @RequestMapping(method = RequestMethod.POST)
    //Se llama a la Clase Registro, porque esa es la que tiene el Validator cuando un usuario crea su cuenta.
    public ModelAndView editarUsuario(@ModelAttribute("registro") Registro r, BindingResult result, SessionStatus status, HttpServletRequest request) {
        
        this.registroValidar.validate(r, result);
        
        if (result.hasErrors()) {
            //Volvemos al formulario porque los datos ingresados por el usuario no son correctos
            //Es decir que se ejecutó la validación
            ModelAndView mav = new ModelAndView();
            int id=Integer.parseInt(request.getParameter("id"));
            Registro dato = this.selectRegistro(id);
            mav.setViewName("editarUsuario");
            mav.addObject("registro", new Registro());
            return mav;
        } else 
        {
            int id=Integer.parseInt(request.getParameter("id"));
            this.jdbcTemplate.update("update usuario "
                                     + "set nombre=?,"
                                     + " password=?,"
                                     + " email=?,"
                                     + " nivel=?,"
                                     + " estado=?"                   
                                     + " where "
                                     + "id=? ",
                                     r.getNombre(), r.getPassword(), r.getEmail(), r.getNivel(), r.getEstado(),id);
            return new ModelAndView("redirect:/mantenedorUser.htm");
        }
    }
    
    public Registro selectRegistro(int id) 
    {
        final Registro r = new Registro();
        String quer = "SELECT * FROM usuario WHERE id='" + id+"'";
        return (Registro) jdbcTemplate.query(quer, new ResultSetExtractor<Registro>(){
            public Registro extractData(ResultSet rs) throws SQLException, DataAccessException{
                if (rs.next()) {
                    r.setNombre(rs.getString("nombre"));
                    r.setPassword(rs.getString("password"));
                    r.setEmail(rs.getString("email"));
                    r.setNivel(rs.getInt("nivel"));
                    r.setEstado(rs.getString("estado"));
                }
                return r;
            }
        });
    }
}