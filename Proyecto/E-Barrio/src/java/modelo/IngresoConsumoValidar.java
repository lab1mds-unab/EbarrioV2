/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author Francisco Sáez Guerra
 */
public class IngresoConsumoValidar implements Validator {
    
    @Override
    public boolean supports(Class<?> type) {
        return IngresoConsumo.class.isAssignableFrom(type);
    }
    
    public void validate(Object o, Errors errors) {
        IngresoConsumo ingresoConsumo = (IngresoConsumo)o;

        //Validacion Número de Cliente
        if (ingresoConsumo.getNumcliente()!= null && ingresoConsumo.getNumcliente().isEmpty()) {
            errors.rejectValue("numcliente", "numcliente.incorrect", "Debe colocar el Número de Cliente");
        }
        
        //Validacion Distribuidora
        if (ingresoConsumo.getDistribuidora()!= null && ingresoConsumo.getDistribuidora().isEmpty()) {
            errors.rejectValue("distribuidora", "distribuidora.incorrect", "Debe seleccionar una Distribuidora");
        }
        
        //Validacion Nombre de Cliente
        if (ingresoConsumo.getNomusuario()!= null && ingresoConsumo.getNomusuario().isEmpty()) {
            errors.rejectValue("nomusuario", "nomusuario.incorrect", "Debe ingresar el nombre de Cliente");
        }
        
        //Validacion Nombre de Cliente
        if (ingresoConsumo.getInmueble()!= null && ingresoConsumo.getInmueble().isEmpty()) {
            errors.rejectValue("inmueble", "inmueble.incorrect", "Debe seleccionar el tipo de inmueble");
        }
        
        //Validacion Dirección
        if (ingresoConsumo.getDireccion()!= null && ingresoConsumo.getDireccion().isEmpty()) {
            errors.rejectValue("direccion", "direccion.incorrect", "Debe ingresar la dirección del inmueble");
        }
        
        //Validacion Número Medidor
        if (ingresoConsumo.getMedidor()== 0) {
            errors.rejectValue("medidor", "medidor.incorrect", "Debe ingresar el Número de Medidor");
        }
    }
}
