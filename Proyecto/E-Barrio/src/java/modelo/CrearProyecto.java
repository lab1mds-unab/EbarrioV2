/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;

/**
 *
 * @author Francisco Sáez Guerra
 */
public class CrearProyecto implements Serializable{
    private int idproyectos;
    private String razonsocial;
    private String rutsocial;
    private String organizacion;
    private String telefono;
    private String email;
    private String tipo;
    private String nombre;
    private String tarifa;
    private String destinatario;
    private int beneficiariodirecto;
    private int beneficiarioindirecto;
    private int dimensiones;
    private int duracion;
    private String region;
    private String estado;
    private int meta;
    private int dinero;
    private int aporte;
    private int manodeobra;
    private int materiales;
    private String aprobado;
    private int porcentaje;

    public CrearProyecto() {
    }

    public CrearProyecto(int idproyectos, String razonsocial, String rutsocial, String organizacion, String telefono, String email, String tipo, String nombre, String tarifa, String destinatario, int beneficiariodirecto, int beneficiarioindirecto, int dimensiones, int duracion, String region, String estado, int meta, int dinero, int aporte, int manodeobra, int materiales, String aprobado, int porcentaje) {
        this.idproyectos = idproyectos;
        this.razonsocial = razonsocial;
        this.rutsocial = rutsocial;
        this.organizacion = organizacion;
        this.telefono = telefono;
        this.email = email;
        this.tipo = tipo;
        this.nombre = nombre;
        this.tarifa = tarifa;
        this.destinatario = destinatario;
        this.beneficiariodirecto = beneficiariodirecto;
        this.beneficiarioindirecto = beneficiarioindirecto;
        this.dimensiones = dimensiones;
        this.duracion = duracion;
        this.region = region;
        this.estado = estado;
        this.meta = meta;
        this.dinero = dinero;
        this.aporte = aporte;
        this.manodeobra = manodeobra;
        this.materiales = materiales;
        this.aprobado = aprobado;
        this.porcentaje = porcentaje;
    }

    public int getIdproyectos() {
        return idproyectos;
    }

    public void setIdproyectos(int idproyectos) {
        this.idproyectos = idproyectos;
    }

    public String getRazonsocial() {
        return razonsocial;
    }

    public void setRazonsocial(String razonsocial) {
        this.razonsocial = razonsocial;
    }

    public String getRutsocial() {
        return rutsocial;
    }

    public void setRutsocial(String rutsocial) {
        this.rutsocial = rutsocial;
    }

    public String getOrganizacion() {
        return organizacion;
    }

    public void setOrganizacion(String organizacion) {
        this.organizacion = organizacion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTarifa() {
        return tarifa;
    }

    public void setTarifa(String tarifa) {
        this.tarifa = tarifa;
    }

    public String getDestinatario() {
        return destinatario;
    }

    public void setDestinatario(String destinatario) {
        this.destinatario = destinatario;
    }

    public int getBeneficiariodirecto() {
        return beneficiariodirecto;
    }

    public void setBeneficiariodirecto(int beneficiariodirecto) {
        this.beneficiariodirecto = beneficiariodirecto;
    }

    public int getBeneficiarioindirecto() {
        return beneficiarioindirecto;
    }

    public void setBeneficiarioindirecto(int beneficiarioindirecto) {
        this.beneficiarioindirecto = beneficiarioindirecto;
    }

    public int getDimensiones() {
        return dimensiones;
    }

    public void setDimensiones(int dimensiones) {
        this.dimensiones = dimensiones;
    }

    public int getDuracion() {
        return duracion;
    }

    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getMeta() {
        return meta;
    }

    public void setMeta(int meta) {
        this.meta = meta;
    }

    public int getDinero() {
        return dinero;
    }

    public void setDinero(int dinero) {
        this.dinero = dinero;
    }

    public int getAporte() {
        return aporte;
    }

    public void setAporte(int aporte) {
        this.aporte = aporte;
    }

    public int getManodeobra() {
        return manodeobra;
    }

    public void setManodeobra(int manodeobra) {
        this.manodeobra = manodeobra;
    }

    public int getMateriales() {
        return materiales;
    }

    public void setMateriales(int materiales) {
        this.materiales = materiales;
    }

    public String getAprobado() {
        return aprobado;
    }

    public void setAprobado(String aprobado) {
        this.aprobado = aprobado;
    }

    public int getPorcentaje() {
        return porcentaje;
    }

    public void setPorcentaje(int porcentaje) {
        this.porcentaje = porcentaje;
    }

    @Override
    public String toString() {
        return "CrearProyecto{" + "idproyectos=" + idproyectos + ", razonsocial=" + razonsocial + ", rutsocial=" + rutsocial + ", organizacion=" + organizacion + ", telefono=" + telefono + ", email=" + email + ", tipo=" + tipo + ", nombre=" + nombre + ", tarifa=" + tarifa + ", destinatario=" + destinatario + ", beneficiariodirecto=" + beneficiariodirecto + ", beneficiarioindirecto=" + beneficiarioindirecto + ", dimensiones=" + dimensiones + ", duracion=" + duracion + ", region=" + region + ", estado=" + estado + ", meta=" + meta + ", dinero=" + dinero + ", aporte=" + aporte + ", manodeobra=" + manodeobra + ", materiales=" + materiales + ", aprobado=" + aprobado + ", porcentaje=" + porcentaje + '}';
    }
    
    @Override
    public int hashCode() {
        int hash = 7;
        hash = 29 * hash + this.idproyectos;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final CrearProyecto other = (CrearProyecto) obj;
        if (this.idproyectos != other.idproyectos) {
            return false;
        }
        return true;
    }
}
