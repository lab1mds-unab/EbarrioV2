/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author Francisco Sáez Guerra
 */
public class CrearProyectoValidar implements Validator {
    private static final String PATTERN_EMAIL = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
            + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
    
    private Pattern pattern;
    private Matcher matcher;
    
    @Override
    public boolean supports(Class<?> type) {
        return CrearProyecto.class.isAssignableFrom(type);
    }
    
    @Override
    public void validate(Object o, Errors errors) {
        CrearProyecto crearProyecto = (CrearProyecto)o;

        //Validación Razón Social
        if (crearProyecto.getRazonsocial()!= null && crearProyecto.getRazonsocial().isEmpty()) {
            errors.rejectValue("razonsocial", "razonsocial.incorrect", "Debe colocar Razón Social");
        }
        
        //Validación RUT Social
        if (crearProyecto.getRutsocial()!= null && crearProyecto.getRutsocial().isEmpty()) {
            errors.rejectValue("rutsocial", "rutsocial.incorrect", "Debe colocar RUT Social");
        }
        
        //Validación Organización
        if (crearProyecto.getOrganizacion().equals("Seleccione")) {
            errors.rejectValue("organizacion", "organizacion.incorrect", "Debe colocar un tipo de Organización");
        }
        
        //Validación teléfono
        if (crearProyecto.getTelefono()!= null && crearProyecto.getOrganizacion().isEmpty()) {
            errors.rejectValue("telefono", "telefono.incorrect", "Debe colocar un teléfono");
        }
        
        //Validación Email
        if (!(crearProyecto.getEmail()!= null && crearProyecto.getEmail().isEmpty())) 
        {
            this.pattern = Pattern.compile(PATTERN_EMAIL);
            this.matcher = pattern.matcher(crearProyecto.getEmail());
            
            if (!matcher.matches()) {
                errors.rejectValue("email", "email.incorrect", "El E-mail " + "'" + crearProyecto.getEmail()+ "'" + " no es válido");
            }
        }
        
        //Validación Tipo Proyecto
        if (crearProyecto.getTipo().equals("Seleccione")) {
            errors.rejectValue("tipo", "tipo.incorrect", "Debe colocar un tipo de Proyecto");
        }
        
        //Validación nombre Proyecto
        if (crearProyecto.getNombre()!= null && crearProyecto.getNombre().isEmpty()) {
            errors.rejectValue("nombre", "nombre.incorrect", "Debe colocar un nombre al Proyecto");
        }
        
        //Validación tarifa (Cobro a beneficiarios)
        if (crearProyecto.getTarifa()!= null && crearProyecto.getTarifa().isEmpty()) {
            errors.rejectValue("tarifa", "tarifa.incorrect", "Debe colocar si habrá algún cobro para beneficiarios");
        }
        
        //Validación destinatario
        if (crearProyecto.getTarifa()!= null && crearProyecto.getTarifa().isEmpty()) {
            errors.rejectValue("destinatario", "destinatario.incorrect", "Debe seleccionar a quién va dirigido el proyecto");
        }
    }
}
