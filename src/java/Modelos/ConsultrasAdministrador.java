//Diseñado by: Ignacio Viacava - Cristopher Perez - KING MAFIRE DEADLINE GOD LABARCA.
package Modelos;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ConsultrasAdministrador extends Conexion {

//CONTAR TOTALIDAD COTIZACIONES  POR ID
    public int contar(String ID){
        int aux=0;
        PreparedStatement pst =null;
        ResultSet rs = null;
        try {
            String consulta = "select * from cotizaciones where idUsuarioCotizacion='"+ID+"'";
            pst = getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
            if(rs.next()){
                do{
                    aux++;
                }while(rs.next());
            }
        } catch (Exception e) {
            System.err.println("ERROR: "+e);
        }finally{
            try {
                if(getConexion() != null)getConexion().close();
                if(pst != null)pst.close();
                if(rs != null)rs.close();
            } catch (Exception e) {
                System.err.println("ERROR : "+e);
            }
        }
        System.err.println("Datos lomito '"+ID+"' : "+aux);
        return aux;
    }

//CONTAR TOTALIDAD COTIZACIONES TOTAL
    public int contatotal(){
        int aux=0;
        PreparedStatement pst =null;
        ResultSet rs = null;
        try {
            String consulta = "select * from cotizaciones";
            pst = getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
            if(rs.next()){
                do{
                    aux++;
                }while(rs.next());
            }
        } catch (Exception e) {
            System.err.println("ERROR: "+e);
        }finally{
            try {
                if(getConexion() != null)getConexion().close();
                if(pst != null)pst.close();
                if(rs != null)rs.close();
            } catch (Exception e) {
                System.err.println("ERROR : "+e);
            }
        }
        System.err.println(+aux);
        return aux;
    }    
    
//CONTAR  DETALLECOTIZACIONES  
    public int detallecontar(String ID){
        int aux=0;
        PreparedStatement pst =null;
        ResultSet rs = null;
        try {
            String consulta = "select * from detallecotizaciones where idCotizacionDetalle='"+ID+"'";
            pst = getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
            if(rs.next()){
                do{
                    aux++;
                }while(rs.next());
            }
        } catch (Exception e) {
            System.err.println("ERROR: "+e);
        }finally{
            try {
                if(getConexion() != null)getConexion().close();
                if(pst != null)pst.close();
                if(rs != null)rs.close();
            } catch (Exception e) {
                System.err.println("ERROR : "+e);
            }
        }
        System.err.println("Datos lomito '"+ID+"' : "+aux);
        return aux;
    }    
    
public ArrayList cotizaciones(String ID){
        ArrayList lista = new ArrayList();
        String idCoti;
        String estadoCoti;
        String nombreCoti;
        String descripcionCoti;
        String iduserCoti;
        String montoCoti;
        PreparedStatement pst =null;
        ResultSet rs = null;
        try {
            String consulta = "select numeroCotizacion, estadoCotizacion, nombreCotizacion, descripcionCotizacion, idUsuarioCotizacion, montoCotizacion from cotizaciones where idUsuarioCotizacion='"+ID+"'";
            pst = getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
            if(rs.next()){
                do{
                    idCoti = rs.getString("numeroCotizacion");
                    estadoCoti= rs.getString("estadoCotizacion");
                    nombreCoti= rs.getString("nombreCotizacion");
                    descripcionCoti= rs.getString("descripcionCotizacion");
                    iduserCoti= rs.getString("idUsuarioCotizacion");
                    montoCoti= rs.getString("montoCotizacion");
                    lista.add(idCoti);
                    lista.add(estadoCoti);
                    lista.add(nombreCoti);
                    lista.add(descripcionCoti);
                    lista.add(iduserCoti);
                    lista.add(montoCoti);
                }while(rs.next());
            }else{
                lista.add("null");
            }
        } catch (Exception e) {
            System.err.println("ERROR: "+e);
        }finally{
            try {
                if(getConexion() != null)getConexion().close();
                if(pst != null)pst.close();
                if(rs != null)rs.close();
            } catch (Exception e) {
                System.err.println("ERROR : "+e);
            }
        }
        System.err.println("Datos lomito '"+ID+"' : "+lista);
        return lista;
    }

// TOTAL COTIZACIONS
public ArrayList totalcotizaciones(){
        ArrayList lista = new ArrayList();
        String idCoti;
        String estadoCoti;
        String nombreCoti;
        String descripcionCoti;
        String iduserCoti;
        String montoCoti;
        PreparedStatement pst =null;
        ResultSet rs = null;
        try {
            String consulta = "select * from cotizaciones";
            pst = getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
            if(rs.next()){
                do{
                    idCoti = rs.getString("numeroCotizacion");
                    estadoCoti= rs.getString("estadoCotizacion");
                    nombreCoti= rs.getString("nombreCotizacion");
                    descripcionCoti= rs.getString("descripcionCotizacion");
                    iduserCoti= rs.getString("idUsuarioCotizacion");
                    montoCoti= rs.getString("montoCotizacion");
                    lista.add(idCoti);
                    lista.add(estadoCoti);
                    lista.add(nombreCoti);
                    lista.add(descripcionCoti);
                    lista.add(iduserCoti);
                    lista.add(montoCoti);
                }while(rs.next());
            }else{
                lista.add("null");
            }
        } catch (Exception e) {
            System.err.println("ERROR: "+e);
        }finally{
            try {
                if(getConexion() != null)getConexion().close();
                if(pst != null)pst.close();
                if(rs != null)rs.close();
            } catch (Exception e) {
                System.err.println("ERROR : "+e);
            }
        }
        System.err.println(lista);
        return lista;
    }


//DATOS DETALLECOTIZACIONES
public ArrayList detallecotizaciones(String ID){
        ArrayList lista = new ArrayList();
        String numeroCotiDetalle;
        Date fechaCotiDetalle;
        String estadoCotiDetalle;
        String descripcionCotiDetalle;
        String idCotiDetalle;
        PreparedStatement pst =null;
        ResultSet rs = null;
        try {
            String consulta = "select numeroCotizacionDetalle, fechaDetalle, estadoDetalle, descripcionCotizacion, idCotizacionDetalle from detallecotizaciones where idCotizacionDetalle='"+ID+"'";
            pst = getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
            if(rs.next()){
                do{
                    numeroCotiDetalle = rs.getString("numeroCotizacionDetalle");
                    fechaCotiDetalle= rs.getDate("fechaDetalle");
                    estadoCotiDetalle= rs.getString("estadoDetalle");
                    descripcionCotiDetalle= rs.getString("descripcionCotizacion");
                    idCotiDetalle= rs.getString("idCotizacionDetalle");
                    lista.add(numeroCotiDetalle);
                    lista.add(fechaCotiDetalle);
                    lista.add(estadoCotiDetalle);
                    lista.add(descripcionCotiDetalle);
                    lista.add(idCotiDetalle);
                }while(rs.next());
            }else{
                lista.add("null");
            }
        } catch (Exception e) {
            System.err.println("ERROR: "+e);
        }finally{
            try {
                if(getConexion() != null)getConexion().close();
                if(pst != null)pst.close();
                if(rs != null)rs.close();
            } catch (Exception e) {
                System.err.println("ERROR : "+e);
            }
        }
        System.err.println("Datos lomito '"+ID+"' : "+lista);
        return lista;
    }
    
//MÉTODO PARA REGISTRAR UN NUEVA COTI 
    public Boolean registrarCoti(String estadoCoti, String nombreCoti, String descripcionCoti, String usuarioCoti, String montoCoti) {
        boolean registrar = false;
        PreparedStatement pst = null;
        try {
            String consulta = "insert into cotizaciones (estadoCotizacion, nombreCotizacion, descripcionCotizacion, idUsuarioCotizacion, montoCotizacion) values "+
                  "(' "+estadoCoti+" ', ' "+nombreCoti+" ', ' "+descripcionCoti+" ', ' "+usuarioCoti+" ', ' "+montoCoti+" ')";  

            pst = getConexion().prepareStatement(consulta);
            if (pst.executeUpdate() == 1) {
                registrar = true;
            }
        } catch (Exception e) {
            System.err.println("ERROR : " + e);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {
                System.err.println("ERROR : " + e);
            }
        }
        return registrar;
    }
//MÉTODO PARA REGISTRAR UN NUEVA DETALLE
    public Boolean registrarCotiDetalle(Date fecha, String estadoCoti, String descripcionCoti, String idCotiDetalle) {
        boolean registrar = false;
        PreparedStatement pst = null;
        try {
            String consulta = "insert into detallecotizaciones (fechaDetalle, estadoDetalle, descripcionCotizacion, idCotizacionDetalle) values "+
                  "(' "+fecha+" ', ' "+estadoCoti+" ', ' "+descripcionCoti+" ', ' "+idCotiDetalle+" ')";  

            pst = getConexion().prepareStatement(consulta);
            if (pst.executeUpdate() == 1) {
                registrar = true;
            }
        } catch (Exception e) {
            System.err.println("ERROR : " + e);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {
                System.err.println("ERROR : " + e);
            }
        }
        return registrar;
    }
    
    //PRUEBA
    public static void main(String[] args) {
        ConsultrasAdministrador con = new ConsultrasAdministrador();
        //System.out.println(con.registrarCotiDetalle(java.sql.Date.valueOf("2018-06-16"),"INTENTANDO","PortasSDASDdasd","1"));
        //System.out.println(con.registrarCliente("Mariana", "Lopez Mardin", "12.122.111-3", "+56911221144", "prueba@hotmail.com", "pass123456"));
        //System.out.println(con.registrarDireccion("Villa El Remanso, psj Mariano LaTorre #1487", "Los Andes", "V Valparaíso", "Los Andes", 1));
        //System.out.println(con.existeCorreo("inventado@gmail.com"));  
        //System.out.println(con.ObtenerFullDatosDirecciones("inventado@gmail.cl", "asdfg123456"));
        //System.out.println(con.ObtenerFullDatosCotizaciones("inventado@gmail.cl", "asdfg123456"));
        System.out.println(con.totalcotizaciones());
    }
    
}
