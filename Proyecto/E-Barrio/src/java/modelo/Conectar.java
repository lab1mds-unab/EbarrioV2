/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

/**
 *
 * @author Francisco Sáez Guerra
 */
public class Conectar {

    public DriverManagerDataSource conectar() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/ebarrio");
        dataSource.setUsername("root");
        dataSource.setPassword("1234");
        return dataSource;
    }

    public PreparedStatement prepareStatement(String sql) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    String driver;
    String url;
    String uss;
    String contra;

    public Conectar() {
        driver = "com.mysql.jdbc.Driver";
        url = "jdbc:mysql://localhost:3306/ebarrio";
        uss = "root";
        contra = "1234";
    }

    public int loguear(String usu, String pass) {
        Connection conn;
        PreparedStatement pst;
        ResultSet rs;
        int nivel = 0;
        String sql = "select nivel from usuario where email='" + usu + "' and password='" + pass + "'";
        try {
            Class.forName(this.driver);
            conn = DriverManager.getConnection(
                    url,
                    uss,
                    contra
            );
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                nivel = rs.getInt(1);
            }
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        return nivel;
    }
}
