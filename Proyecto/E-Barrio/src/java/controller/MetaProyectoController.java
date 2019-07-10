/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import modelo.Conectar;
import modelo.CrearProyecto;
import modelo.CrearProyectoValidar;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
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

//Controlador de la vista metaProyecto.htm // Vista para TODO USUARIO

@RequestMapping("metaProyecto.htm")

public class MetaProyectoController {
    CrearProyectoValidar crearProyectoValidar;
    private JdbcTemplate jdbcTemplate;

    public MetaProyectoController() {
        this.crearProyectoValidar = new CrearProyectoValidar();
        Conectar con = new Conectar();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
    }
    
    @RequestMapping(method=RequestMethod.GET)
    public ModelAndView proyecto(HttpServletRequest request)
    {
        ModelAndView mav = new ModelAndView();
        int id = Integer.parseInt(request.getParameter("id"));
        CrearProyecto dato = this.selectProyecto(id);
        mav.setViewName("metaProyecto");
        mav.addObject("crearProyecto", new CrearProyecto(id, dato.getRazonsocial(), dato.getRutsocial(), dato.getOrganizacion(), dato.getTelefono(), dato.getEmail(), dato.getTipo(), dato.getNombre(), dato.getTarifa(), dato.getDestinatario(), dato.getBeneficiariodirecto(), dato.getBeneficiarioindirecto(),
                dato.getDimensiones(), dato.getDuracion(), dato.getRegion(), dato.getEstado(), dato.getMeta(), dato.getDinero(), dato.getAporte(), dato.getManodeobra(), dato.getMateriales(), dato.getAprobado(), dato.getPorcentaje()));
        return mav;
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
                }
                return cp;
            }
        });
    }
}
