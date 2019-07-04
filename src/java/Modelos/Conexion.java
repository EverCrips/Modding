//Diseñado by: Ignacio Viacava - Cristopher Perez - KING MAFIRE DEADLINE GOD LABARCA.
package Modelos;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    private String USERNAME="root";
    private String PASS="";
    private String HOST="localhost";
    private String DB="moddingmafires";
    private String CLASSNAME="com.mysql.jdbc.Driver";
    
    private String URL="jdbc:mysql://"+HOST+"/"+DB;
    //"jdbc:mysql://localhost/SistemaEmpaques";
    
    private Connection con;
    
    //CONSTRUCTOR CONEXION, PARA REALIZAR LA CONEXION
    public Conexion(){
        try {
            Class.forName(CLASSNAME);
            con = DriverManager.getConnection(URL,USERNAME,PASS);
        } catch (ClassNotFoundException e) {
            System.err.println("ERROR : "+e);
        }catch (SQLException e){
            System.err.println("ERROR : "+e);
        }
    }//FIN CONSTRUCTOR CONEXION
    
    //METODO PARA OBTENER LA CONEXION
    public Connection getConexion(){
        return con;
    }//FIN METODO CONEXION
    
    //MAIN PARA VERIFICAR CONEXION
    public static void main(String[] args){
        Conexion con = new Conexion();
    }//FIN MAIN
}
