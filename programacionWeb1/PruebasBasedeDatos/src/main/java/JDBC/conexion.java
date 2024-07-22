/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package JDBC;

import java.sql.Connection;
import java.sql.DriverManager;

public class conexion {

    public static void main(String[] args) {
        conexion();
    }

    public static void conexion() {
        Connection conn = null;
        String driver = "com.mysql.jdbc.Driver";
        try {
            Class.forName(driver);
            System.out.println("Driver cargado con exito");
            try {
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ProgramacionWeb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "Widow1234");
                if (conn != null) {
                    System.out.println("Conexion realizada con exito");
                }
            } catch (Exception e) {
                System.out.println("Ha ocurrido un error al intentar conectar con la base de datos," + e.getMessage());
            }
        } catch (Exception e) {
            System.out.println("Ha ocurrido un error al cargar el driver," + e.getMessage());

        }
    }
}
