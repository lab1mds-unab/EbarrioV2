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
public class RegistroValidar implements Validator{
    private static final String PATTERN_EMAIL = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
            + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
    
    private Pattern pattern;
    private Matcher matcher;
    
    @Override
    public boolean supports(Class<?> type) {
        return Registro.class.isAssignableFrom(type);
    }
    
    @Override
    public void validate(Object o, Errors errors) {
        Registro registro = (Registro)o;

        //Validacion nombre
        if (registro.getNombre()!= null && registro.getNombre().isEmpty()) {
            errors.rejectValue("nombre", "nombre.incorrect", "Debe colocar un nombre válido");
        }
        
        //Validacion password
        if (registro.getPassword()!= null && registro.getPassword().isEmpty()) {
            errors.rejectValue("password", "password.incorrect", "Debe colocar un password");
        }
        
        //Validación Email
        if (!(registro.getEmail()!= null && registro.getEmail().isEmpty())) 
        {
            this.pattern = Pattern.compile(PATTERN_EMAIL);
            this.matcher = pattern.matcher(registro.getEmail());
            
            if (!matcher.matches()) {
                errors.rejectValue("email", "email.incorrect", "El E-mail " + "'" + registro.getEmail()+ "'" + " no es válido");
            }
        }
    }
}

