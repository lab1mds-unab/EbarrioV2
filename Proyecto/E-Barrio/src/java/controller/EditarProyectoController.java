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
import modelo.CrearProyecto;
import modelo.CrearProyectoValidar;
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

//Controlador para la vista editarProyecto.htm // Vista para ADMINISTRADOR

@RequestMapping("editarProyecto.htm")
public class EditarProyectoController {
    CrearProyectoValidar crearProyectoValidar;
    private JdbcTemplate jdbcTemplate;

    public EditarProyectoController() {
        this.crearProyectoValidar = new CrearProyectoValidar();
        Conectar con = new Conectar();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
    }
    
    @RequestMapping(method=RequestMethod.GET)
    public ModelAndView editarProyecto(HttpServletRequest request)
    {
        ModelAndView mav = new ModelAndView();
        int id = Integer.parseInt(request.getParameter("id"));
        CrearProyecto dato = this.selectProyecto(id);
        mav.setViewName("editarProyecto");
        mav.addObject("crearProyecto", new CrearProyecto(id, dato.getRazonsocial(), dato.getRutsocial(), dato.getOrganizacion(), dato.getTelefono(), dato.getEmail(), dato.getTipo(), dato.getNombre(), dato.getTarifa(), dato.getDestinatario(), dato.getBeneficiariodirecto(), dato.getBeneficiarioindirecto(),
                dato.getDimensiones(), dato.getDuracion(), dato.getRegion(), dato.getEstado(), dato.getMeta(), dato.getDinero(), dato.getAporte(), dato.getManodeobra(), dato.getMateriales(), dato.getAprobado(), dato.getPorcentaje()));
        return mav;
    }
    
    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView editarProyecto(@ModelAttribute("crearProyecto") CrearProyecto c, BindingResult result, SessionStatus status, HttpServletRequest request) {
        
        this.crearProyectoValidar.validate(c, result);
        
        if (result.hasErrors()) {
            //Volvemos al formulario porque los datos ingresados por el usuario no son correctos
            //Es decir que se ejecutó la validación
            ModelAndView mav = new ModelAndView();
            int id=Integer.parseInt(request.getParameter("id"));
            CrearProyecto dato = this.selectProyecto(id);
            mav.setViewName("editarProyecto");
            mav.addObject("crearProyecto", new CrearProyecto());
            return mav;
        } else 
        {
            int id=Integer.parseInt(request.getParameter("id"));
            this.jdbcTemplate.update("update proyectos "
                                     + "set razonsocial=?,"
                                     + " rutsocial=?,"
                                     + " organizacion=?,"
                                     + " telefono=?,"
                                     + " email=?,"
                                     + " tipo=?,"
                                     + " nombre=?,"
                                     + " tarifa=?,"
                                     + " destinatario=?,"
                                     + " beneficiariodirecto=?,"
                                     + " beneficiarioindirecto=?,"
                                     + " dimensiones=?,"
                                     + " duracion=?,"
                                     + " region=?,"
                                     + " estado=?,"
                                     + " meta=?,"
                                     + " dinero=?,"                     
                                     + " aporte=?,"
                                     + " manodeobra=?,"
                                     + " materiales=?,"
                                     + " aprobado=?,"
                                     + " porcentaje=?"                    
                                     + " where "
                                     + "idproyectos=? ",
                                     c.getRazonsocial(),c.getRutsocial(),c.getOrganizacion(),c.getTelefono(),c.getEmail(),c.getTipo(), c.getNombre(), c.getTarifa(), c.getDestinatario(), c.getBeneficiariodirecto(),
                                     c.getBeneficiarioindirecto(), c.getDimensiones(), c.getDuracion(), c.getRegion(), c.getEstado(), c.getMeta(), c.getDinero(), c.getAporte(), c.getManodeobra(), c.getMateriales(),
                                     c.getAprobado(), c.getPorcentaje(),id);
            return new ModelAndView("redirect:/mantenedorProyectos.htm");
        }
    }

    public CrearProyecto selectProyecto(int id) 
    {
        final CrearProyecto cp = new CrearProyecto();
        String quer = "SELECT * FROM proyectos WHERE idproyectos='" + id+"'";
        return (CrearProyecto) jdbcTemplate.query(quer, new ResultSetExtractor<CrearProyecto>(){
            public CrearProyecto extractData(ResultSet rs) throws SQLException, DataAccessException{
                if (rs.next()) {
                    cp.setRazonsocial(rs.getString("razonsocial"));
                    cp.setRutsocial(rs.getString("rutsocial"));
                    cp.setOrganizacion(rs.getString("organizacion"));
                    cp.setTelefono(rs.getString("telefono"));
                    cp.setEmail(rs.getString("email"));
                    cp.setTipo(rs.getString("tipo"));
                    cp.setNombre(rs.getString("nombre"));
                    cp.setTarifa(rs.getString("tarifa"));
                    cp.setDestinatario(rs.getString("destinatario"));
                    cp.setBeneficiariodirecto(rs.getInt("beneficiariodirecto"));
                    cp.setBeneficiarioindirecto(rs.getInt("beneficiarioindirecto"));
                    cp.setDimensiones(rs.getInt("dimensiones"));
                    cp.setDuracion(rs.getInt("duracion"));
                    cp.setRegion(rs.getString("region"));
                    cp.setEstado(rs.getString("estado"));
                    cp.setMeta(rs.getInt("meta"));
                    cp.setDinero(rs.getInt("dinero"));
                    cp.setAporte(rs.getInt("aporte"));
                    cp.setManodeobra(rs.getInt("manodeobra"));
                    cp.setMateriales(rs.getInt("materiales"));
                    cp.setAprobado(rs.getString("aprobado"));
                    cp.setPorcentaje(rs.getInt("porcentaje"));
                }
                return cp;
            }
        });
    }
}