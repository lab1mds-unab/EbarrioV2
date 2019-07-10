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
public class UsuarioProyecto implements Serializable {
    private int id;
    private int idusuario;
    private int idproyectos;

    public UsuarioProyecto() {
    }

    public UsuarioProyecto(int id, int idusuario, int idproyectos) {
        this.id = id;
        this.idusuario = idusuario;
        this.idproyectos = idproyectos;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }

    public int getIdproyectos() {
        return idproyectos;
    }

    public void setIdproyectos(int idproyectos) {
        this.idproyectos = idproyectos;
    }

    @Override
    public String toString() {
        return "UsuarioProyecto{" + "id=" + id + ", idusuario=" + idusuario + ", idproyectos=" + idproyectos + '}';
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 71 * hash + this.id;
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
        final UsuarioProyecto other = (UsuarioProyecto) obj;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }

}
