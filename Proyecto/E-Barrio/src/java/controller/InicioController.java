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
public class InicioController {
    private JdbcTemplate jdbcTemplate;
    
    public InicioController()
    {
        //
        Conectar con = new Conectar();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
    }
    
    //Controlador de la Vista index.htm // Vista para TODO USUARIO
    @RequestMapping("index.htm")
    public ModelAndView index()
    {
       ModelAndView mav = new ModelAndView();
       String sql1="SELECT * FROM proyectos WHERE aprobado = 'Si'";
       List datosIndex = this.jdbcTemplate.queryForList(sql1);
       mav.addObject("index", datosIndex);
       mav.setViewName("index");
       return mav;
    }
    
    //Controlador de la vista inicio.htm // Vista para USUARIO
    @RequestMapping("inicio.htm")
    public ModelAndView inicio()
    {
       ModelAndView mav = new ModelAndView();
       mav.setViewName("inicio");
       return mav;
    }
    
    //Controlador de la vista inicioAdmin.htm // Vista para ADMINISTRADOR
    @RequestMapping("inicioAdmin.htm")
    public ModelAndView inicioAdmin()
    {
       ModelAndView mav = new ModelAndView();
       mav.setViewName("inicioAdmin");
       return mav;
    }
    
    //Controlador de la vista huellaCarbono.htm // Vista para USUARIO
    @RequestMapping("huellaCarbono.htm")
    public ModelAndView huellaCarbono(){
        ModelAndView mav = new ModelAndView();
        return mav;
    }
    
    //Controlador de la vista login.htm // Vista para USUARIO
    @RequestMapping("login.htm")
    public ModelAndView login(){
        ModelAndView mav = new ModelAndView();
        return mav;
    }
    
    //Controlador de la vista loginAdmin.htm // Vista para ADMINISTRADOR
    @RequestMapping("loginAdmin.htm")
    public ModelAndView loginAdmin(){
        ModelAndView mav = new ModelAndView();
        return mav;
    }
    
    //Controlador de la vista regisExito.htm // Vista para TODO USUARIO
    @RequestMapping("regisExito.htm")
    public ModelAndView regisExito(){
        ModelAndView mav = new ModelAndView();
        return mav;
    }
    
    //Controlador de la vista mantenedorUser.htm // Vista para ADMINISTRADOR
    @RequestMapping("mantenedorUser.htm")
    public ModelAndView mantenedorUser(){
        ModelAndView mav = new ModelAndView();
        String sql1="select * from usuario";
        List datosUser = this.jdbcTemplate.queryForList(sql1);
        mav.addObject("usuario", datosUser);
        mav.setViewName("mantenedorUser");
        return mav;
    }
    
    //Controlador de la vista de Proyectos.htm // Vista para USUARIO
    @RequestMapping("proyectos.htm")
    public ModelAndView proyectos(){
        ModelAndView mav = new ModelAndView();
        String sql1="SELECT id, idproyecto, idproyectos, nombre, meta FROM usuarioproyecto, proyectos WHERE idproyecto = idproyectos";
        List listProyect = this.jdbcTemplate.queryForList(sql1);
        mav.addObject("proyectoContribuido", listProyect);
        mav.setViewName("proyectos");
        return mav;
    }
    
    //Controlador de la vista regisProye.htm // Vista para USUARIO
    @RequestMapping("regisProye.htm")
    public ModelAndView regisProye(){
        ModelAndView mav = new ModelAndView();
        return mav;
    }
    
    //Controlador de la vista tutorial.htm // Vista para ADMINISTRADOR y USUARIO
    @RequestMapping("tutorial.htm")
    public ModelAndView tutorial(){
        ModelAndView mav = new ModelAndView();
        return mav;
    }
    
    //Controlador de la vista listaProyectos.htm // Vista para USUARIO
    @RequestMapping("listaProyectos.htm")
    public ModelAndView listaProyectos(){
        ModelAndView mav = new ModelAndView();
        String sql1="SELECT * FROM proyectos WHERE aprobado = 'Si' AND estado = 'En proceso fase 1'";
        List datosProyecto = this.jdbcTemplate.queryForList(sql1);
        mav.addObject("listaProyectos", datosProyecto);
        mav.setViewName("listaProyectos");
        return mav;
    }
    
    //Controller de la vista mantenedorProyectos.htm // Vista para ADMINISTRADOR
    @RequestMapping("mantenedorProyectos.htm")
    public ModelAndView mantenedorProyectos(){
        ModelAndView mav = new ModelAndView();
        String sql1="SELECT * FROM proyectos WHERE aprobado = 'No'";
        String sql2="SELECT * FROM proyectos WHERE aprobado = 'Si' AND estado = 'En proceso fase 1'";
        String sql3="SELECT * FROM proyectos WHERE aprobado = 'Si' AND estado = 'Terminado Fase 1'";
        String sql4="SELECT * FROM proyectos WHERE aprobado = 'Si' AND estado = 'Adjudicado Fase 2'";
        List datosPostFase1 = this.jdbcTemplate.queryForList(sql1);
        List datosProceFase1 =this.jdbcTemplate.queryForList(sql2);
        List datosTermFase1 = this.jdbcTemplate.queryForList(sql3);
        List datosAdjFase2 = this.jdbcTemplate.queryForList(sql4);
        mav.addObject("postFase1", datosPostFase1);
        mav.addObject("ProceFase1", datosProceFase1);
        mav.addObject("TermFase1", datosTermFase1);
        mav.addObject("AdjuFase2", datosAdjFase2);
        mav.setViewName("mantenedorProyectos");
        return mav;
    }
    
}
