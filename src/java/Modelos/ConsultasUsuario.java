/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author MSINote
 */
public class ConsultasUsuario extends Conexion{
    
    //MODIFICAR DATOS USUARIO
    public boolean modificarDatos(String id, String nombre, String apellidos, String celular, String correo){
        boolean modificar = false;
        PreparedStatement pst = null;
        try {
            String consulta = "update usuarios set nombreUsuario='"+nombre+"', apellidosUsuario='"+apellidos+"', celularUsuario='"+celular+"', "+
                        "emailUsuario='"+correo+"' where idUsuario='"+id+"' ";
            pst = getConexion().prepareStatement(consulta);
            
            if(pst.executeUpdate()==1){
                modificar = true;
            }
        } catch (Exception ex) {
            System.err.println("Error: +"+ex);
        }finally{
            try {
                if(getConexion()!=null)getConexion().close();
                if(pst!=null)pst.close();
            } catch (Exception e) {
                System.err.println("ERROR : "+e);
            }
        }
        return modificar;
    }
        //MODIFICAR DATOS USUARIO
    public boolean modificarDatosAdmin(String id, String nombre, String apellidos,String runUser, String celular, String correo, String pass){
        boolean modificar = false;
        PreparedStatement pst = null;
        try {
            String consulta = "update usuarios set nombreUsuario='"+nombre+"', apellidosUsuario='"+apellidos+"',runUsuario='"+runUser+"', celularUsuario='"+celular+"', "+
                        "emailUsuario='"+correo+"', passUsuario='"+pass+"' where idUsuario='"+id+"' ";
            pst = getConexion().prepareStatement(consulta);
            
            if(pst.executeUpdate()==1){
                modificar = true;
            }
        } catch (Exception ex) {
            System.err.println("Error: +"+ex);
        }finally{
            try {
                if(getConexion()!=null)getConexion().close();
                if(pst!=null)pst.close();
            } catch (Exception e) {
                System.err.println("ERROR : "+e);
            }
        }
        return modificar;
    }
    //MÉTODO PARA OBTENER TODOS LOS DATOS DEL USUARIO
    public ArrayList ObtenerFullDatosUsuarios(String id){
        ArrayList lista = new ArrayList();
        String idUsuario="", nombreUsuario="", apellidosUsuario="", runUsuario="", celularUsuario="", emailUsuario="",
                 passUsuario="", categoriaUsuario="";
        PreparedStatement pst =null;
        ResultSet rs = null;
        try {
            String consulta = "select us.idUsuario, us.nombreUsuario, us.apellidosUsuario, us.runUsuario, us.celularUsuario, us.emailUsuario, us.passUsuario, cat.nombreCategoria "+
                                "from usuarios us, categorias cat where us.idUsuario='"+id+"' and us.estadoUsuario=1"+
                                        " and us.idCategoriaUsuario=cat.idCategoria";
            
            pst = getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
            if(rs.next()){
                do{
                    idUsuario = rs.getString("idUsuario");
                    nombreUsuario = rs.getString("nombreUsuario");
                    apellidosUsuario = rs.getString("apellidosUsuario");
                    runUsuario = rs.getString("runUsuario");
                    celularUsuario = rs.getString("celularUsuario");
                    emailUsuario = rs.getString("emailUsuario");
                    passUsuario = rs.getString("passUsuario");
                    categoriaUsuario = rs.getString("nombreCategoria");
                    lista.add(idUsuario);
                    lista.add(nombreUsuario);
                    lista.add(apellidosUsuario);
                    lista.add(runUsuario);
                    lista.add(celularUsuario);
                    lista.add(emailUsuario);
                    lista.add(passUsuario);
                    lista.add(categoriaUsuario);
                }while(rs.next());
            }else{
                lista.add("null");
            }
        } catch (Exception e) {
            System.err.println("ERROR1: "+e);
        }finally{
            try {
                if(getConexion() != null)getConexion().close();
                if(pst != null)pst.close();
                if(rs != null)rs.close();
            } catch (Exception e) {
                System.err.println("ERROR2 : "+e);
            }
        }
        
        return lista;
    }
    
    //MÉTODO PARA CONTRASTAR SI ES EL MISMO CORREO
    public boolean contrastarCorreo(String id, String correo) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        boolean existe = false;

        try {
            String consulta = "select emailUsuario from usuarios where idUsuario="+id+" and emailUsuario LIKE '%"+ correo +"%' ";
            pst = getConexion().prepareStatement(consulta);
            //SE GUARDA LA CONEXION EN EL RESULSET
            rs = pst.executeQuery();
            //SI EXISTE UN REGISTRO CAMBIAMOS RETURN
            if (rs.absolute(1)) {
                existe = true;
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
                if (rs != null) {
                    rs.close();
                }

            } catch (Exception e) {
                System.err.println("ERROR : " + e);
            }
        }
        return existe;
    }
    
    //MODIFICAR DATOS USUARIO
    public boolean modificarPass(String id, String pass){
        boolean modificar = false;
        PreparedStatement pst = null;
        try {
            String consulta = "update usuarios set passUsuario='"+pass+"' where idUsuario='"+id+"' ";
            pst = getConexion().prepareStatement(consulta);
            
            if(pst.executeUpdate()==1){
                modificar = true;
            }
        } catch (Exception ex) {
            System.err.println("Error: +"+ex);
        }finally{
            try {
                if(getConexion()!=null)getConexion().close();
                if(pst!=null)pst.close();
            } catch (Exception e) {
                System.err.println("ERROR : "+e);
            }
        }
        return modificar;
    }
    
    //ELIMINAR DIRECCION
    public boolean eliminarDireccion(String idDireccion){
        boolean eliminar = false;
        PreparedStatement pst = null;
        try {
            String consulta = "delete from direcciones where idDireccion='"+idDireccion+"' ";
            pst = getConexion().prepareStatement(consulta);
            
            if(pst.executeUpdate()==1){
                eliminar = true;
            }
        } catch (Exception ex) {
            System.err.println("Error: +"+ex);
        }finally{
            try {
                if(getConexion()!=null)getConexion().close();
                if(pst!=null)pst.close();
            } catch (Exception e) {
                System.err.println("ERROR : "+e);
            }
        }
        return eliminar;
    }
    
    //ELIMINAR USUARIO BY ADMIN
    public boolean eliminarUsuario(String id){
        boolean eliminar = false;
        PreparedStatement pst = null;
        try {
            String consulta = "delete from usuarios where idUsuario='"+id+"' ";
            pst = getConexion().prepareStatement(consulta);
            
            if(pst.executeUpdate()==1){
                eliminar = true;
            }
        } catch (Exception ex) {
            System.err.println("Error: +"+ex);
        }finally{
            try {
                if(getConexion()!=null)getConexion().close();
                if(pst!=null)pst.close();
            } catch (Exception e) {
                System.err.println("ERROR : "+e);
            }
        }
        return eliminar;
    }
    
    //MÉTODO PARA OBTENER TODOS LOS DATOS DE DIRECCIONES DEL USUARIO
    public ArrayList ObtenerFullDatosDirecciones(String correo){
        ArrayList lista = new ArrayList();
        String idDireccion="", nombreDireccion="", ciudadDireccion="", regionDireccion="", comunaDireccion="";
        PreparedStatement pst =null;
        ResultSet rs = null;
        try {
            String consulta = "select dir.idDireccion, dir.nombreDireccion, dir.ciudadDireccion, dir.regionDireccion, dir.comunaDireccion "+
                                "from direcciones dir, usuarios us where us.emailUsuario LIKE '%"+ correo +"%' and estadoUsuario=1"+
                                        " and dir.idUsuarioDireccion=us.idUsuario";
            
            pst = getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
            if(rs.next()){
                do{
                    idDireccion = rs.getString("idDireccion");
                    nombreDireccion = rs.getString("nombreDireccion");
                    ciudadDireccion = rs.getString("ciudadDireccion");
                    regionDireccion = rs.getString("regionDireccion");
                    comunaDireccion = rs.getString("comunaDireccion");
                    lista.add(idDireccion);
                    lista.add(nombreDireccion);
                    lista.add(ciudadDireccion);
                    lista.add(regionDireccion);
                    lista.add(comunaDireccion);
                }while(rs.next());
            }else{
                lista.add("null");
            }
        } catch (Exception e) {
            System.err.println("ERROR1: "+e);
        }finally{
            try {
                if(getConexion() != null)getConexion().close();
                if(pst != null)pst.close();
                if(rs != null)rs.close();
            } catch (Exception e) {
                System.err.println("ERROR2 : "+e);
            }
        }
        
        return lista;
    }
    
    
    public static void main(String args[]){
        ConsultasUsuario con = new ConsultasUsuario();
        //System.out.println(con.contrastarCorreo("1", "inventado@gmail.com"));
        //System.out.println(con.modificarDatosAdmin("3", "Malicona", "Versati","19.827.341-2" ,"+(569)11222244", "inventado@gmail.com"));
        //System.out.println(con.ObtenerFullDatosUsuarios("1"));
        //System.out.println(con.eliminarDireccion("5"));
    }
    
}
