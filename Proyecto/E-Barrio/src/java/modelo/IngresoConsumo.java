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
public class IngresoConsumo implements Serializable {
    private int id;
    private String emailuser;
    private String numcliente;
    private String distribuidora;
    private String nomusuario;
    private String inmueble;
    private String direccion;
    private int medidor;
    private String mes1, mes2, mes3, mes4, mes5, mes6;
    private int kwh1, kwh2, kwh3, kwh4, kwh5, kwh6;
    private int valor1, valor2, valor3, valor4, valor5, valor6;
    private double promKwh, promValorMens;

    public IngresoConsumo() {
    }

    public IngresoConsumo(int id, String emailuser, String numcliente, String distribuidora, String nomusuario, String inmueble, String direccion, int medidor, String mes1, String mes2, String mes3, String mes4, String mes5, String mes6, int kwh1, int kwh2, int kwh3, int kwh4, int kwh5, int kwh6, int valor1, int valor2, int valor3, int valor4, int valor5, int valor6, double promKwh, double promValorMens) {
        this.id = id;
        this.emailuser = emailuser;
        this.numcliente = numcliente;
        this.distribuidora = distribuidora;
        this.nomusuario = nomusuario;
        this.inmueble = inmueble;
        this.direccion = direccion;
        this.medidor = medidor;
        this.mes1 = mes1;
        this.mes2 = mes2;
        this.mes3 = mes3;
        this.mes4 = mes4;
        this.mes5 = mes5;
        this.mes6 = mes6;
        this.kwh1 = kwh1;
        this.kwh2 = kwh2;
        this.kwh3 = kwh3;
        this.kwh4 = kwh4;
        this.kwh5 = kwh5;
        this.kwh6 = kwh6;
        this.valor1 = valor1;
        this.valor2 = valor2;
        this.valor3 = valor3;
        this.valor4 = valor4;
        this.valor5 = valor5;
        this.valor6 = valor6;
        this.promKwh = promKwh;
        this.promValorMens = promValorMens;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmailuser() {
        return emailuser;
    }

    public void setEmailuser(String emailuser) {
        this.emailuser = emailuser;
    }
    
    public String getNumcliente() {
        return numcliente;
    }

    public void setNumcliente(String numcliente) {
        this.numcliente = numcliente;
    }

    public String getDistribuidora() {
        return distribuidora;
    }

    public void setDistribuidora(String distribuidora) {
        this.distribuidora = distribuidora;
    }

    public String getNomusuario() {
        return nomusuario;
    }

    public void setNomusuario(String nomusuario) {
        this.nomusuario = nomusuario;
    }

    public String getInmueble() {
        return inmueble;
    }

    public void setInmueble(String inmueble) {
        this.inmueble = inmueble;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getMedidor() {
        return medidor;
    }

    public void setMedidor(int medidor) {
        this.medidor = medidor;
    }

    public String getMes1() {
        return mes1;
    }

    public void setMes1(String mes1) {
        this.mes1 = mes1;
    }

    public String getMes2() {
        return mes2;
    }

    public void setMes2(String mes2) {
        this.mes2 = mes2;
    }

    public String getMes3() {
        return mes3;
    }

    public void setMes3(String mes3) {
        this.mes3 = mes3;
    }

    public String getMes4() {
        return mes4;
    }

    public void setMes4(String mes4) {
        this.mes4 = mes4;
    }

    public String getMes5() {
        return mes5;
    }

    public void setMes5(String mes5) {
        this.mes5 = mes5;
    }

    public String getMes6() {
        return mes6;
    }

    public void setMes6(String mes6) {
        this.mes6 = mes6;
    }

    public int getKwh1() {
        return kwh1;
    }

    public void setKwh1(int kwh1) {
        this.kwh1 = kwh1;
    }

    public int getKwh2() {
        return kwh2;
    }

    public void setKwh2(int kwh2) {
        this.kwh2 = kwh2;
    }

    public int getKwh3() {
        return kwh3;
    }

    public void setKwh3(int kwh3) {
        this.kwh3 = kwh3;
    }

    public int getKwh4() {
        return kwh4;
    }

    public void setKwh4(int kwh4) {
        this.kwh4 = kwh4;
    }

    public int getKwh5() {
        return kwh5;
    }

    public void setKwh5(int kwh5) {
        this.kwh5 = kwh5;
    }

    public int getKwh6() {
        return kwh6;
    }

    public void setKwh6(int kwh6) {
        this.kwh6 = kwh6;
    }

    public int getValor1() {
        return valor1;
    }

    public void setValor1(int valor1) {
        this.valor1 = valor1;
    }

    public int getValor2() {
        return valor2;
    }

    public void setValor2(int valor2) {
        this.valor2 = valor2;
    }

    public int getValor3() {
        return valor3;
    }

    public void setValor3(int valor3) {
        this.valor3 = valor3;
    }

    public int getValor4() {
        return valor4;
    }

    public void setValor4(int valor4) {
        this.valor4 = valor4;
    }

    public int getValor5() {
        return valor5;
    }

    public void setValor5(int valor5) {
        this.valor5 = valor5;
    }

    public int getValor6() {
        return valor6;
    }

    public void setValor6(int valor6) {
        this.valor6 = valor6;
    }

    public double getPromKwh() {
        return promKwh;
    }

    public void setPromKwh(double promKwh) {
        this.promKwh = promKwh;
    }

    public double getPromValorMens() {
        return promValorMens;
    }

    public void setPromValorMens(double promValorMens) {
        this.promValorMens = promValorMens;
    }

    @Override
    public String toString() {
        return "IngresoConsumo{" + "id=" + id + ", emailuser=" + emailuser + ", numcliente=" + numcliente + ", distribuidora=" + distribuidora + ", nomusuario=" + nomusuario + ", inmueble=" + inmueble + ", direccion=" + direccion + ", medidor=" + medidor + ", mes1=" + mes1 + ", mes2=" + mes2 + ", mes3=" + mes3 + ", mes4=" + mes4 + ", mes5=" + mes5 + ", mes6=" + mes6 + ", kwh1=" + kwh1 + ", kwh2=" + kwh2 + ", kwh3=" + kwh3 + ", kwh4=" + kwh4 + ", kwh5=" + kwh5 + ", kwh6=" + kwh6 + ", valor1=" + valor1 + ", valor2=" + valor2 + ", valor3=" + valor3 + ", valor4=" + valor4 + ", valor5=" + valor5 + ", valor6=" + valor6 + ", promKwh=" + promKwh + ", promValorMens=" + promValorMens + '}';
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 17 * hash + this.id;
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
        final IngresoConsumo other = (IngresoConsumo) obj;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }
}
