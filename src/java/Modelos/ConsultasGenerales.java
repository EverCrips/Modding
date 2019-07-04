//Diseñado by: Ignacio Viacava - Cristopher Perez - KING MAFIRE DEADLINE GOD LABARCA.
package Modelos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ConsultasGenerales extends Conexion {

    //MÉTODO PARA REGISTRAR UN NUEVO CLIENTE 
    public Boolean registrarCliente(String nombreCliente, String apellidosCliente, String runCliente, String celularCliente, String emailCliente, String passCliente) {
        boolean registrar = false;
        PreparedStatement pst = null;
        try {
            String consulta = "insert into usuarios (estadoUsuario, nombreUsuario, apellidosUsuario, runUsuario, celularUsuario, emailUsuario, passUsuario, idCategoriaUsuario) values "+
                  "(1, ' "+nombreCliente+" ', ' "+apellidosCliente+" ', ' "+runCliente+" ', ' "+celularCliente+" ', ' "+emailCliente+" ', ' "+passCliente+" ', 2)";  

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
    
    //MÉTODO PARA REGISTRAR LA DIRECCIÓN AL CLIENTE 
    public Boolean registrarDireccion(String nombreDireccion, String ciudadDireccion, String regionDireccion, String comunaDireccion, int idCliente) {
        boolean registrar = false;
        PreparedStatement pst = null;
        try {
            String consulta = "insert into direcciones (nombreDireccion, ciudadDireccion, regionDireccion, comunaDireccion, idUsuarioDireccion) values "+
                  "(' "+nombreDireccion+" ', ' "+ciudadDireccion+" ', ' "+regionDireccion+" ', ' "+comunaDireccion+" ', ' "+idCliente+" ')";  

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
    
    //MÉTODO PARA VERIFICAR SI EXISTE UN CORREO O NO
    public boolean existeCorreo(String correo) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        boolean existe = false;

        try {
            String consulta = "select emailUsuario from usuarios where emailUsuario LIKE '%"+ correo +"%' and estadoUsuario=1";
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
    
    //MÉTODO PARA CONTRASTAR CORREO CON CONTRASEÑA
    public boolean contrastarCorreoPass(String correo, String pass) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        boolean existe = false;

        try {
            String consulta = "select emailUsuario from usuarios where emailUsuario LIKE '%"+ correo +"%' and passUsuario LIKE '%"+ pass +"%' ";
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
    
    //OBTENER EL ÚLTIMO CODIGO REGISTRO CLIENTE
    public String obtenerCodigoCliente() {
        PreparedStatement pst = null;
        ResultSet rs = null;
        String codigo ="";

        try {
            String consulta = "select idUsuario from usuarios order by idUsuario desc";
            pst = getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
            if(rs.next()){
                codigo = rs.getString("idUsuario");
            }else{
                codigo = null;
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
        return codigo;
    }
    
    //MÉTODO PARA OBTENER TODOS LOS DATOS DEL USUARIO
    public ArrayList ObtenerFullDatosUsuarios(String correo, String contraseña){
        ArrayList lista = new ArrayList();
        String idUsuario="", nombreUsuario="", apellidosUsuario="", runUsuario="", celularUsuario="", emailUsuario="",
                 passUsuario="", categoriaUsuario="";
        PreparedStatement pst =null;
        ResultSet rs = null;
        try {
            String consulta = "select us.idUsuario, us.nombreUsuario, us.apellidosUsuario, us.runUsuario, us.celularUsuario, us.emailUsuario, us.passUsuario, cat.nombreCategoria "+
                                "from usuarios us, categorias cat where emailUsuario LIKE '%"+ correo +"%' and passUsuario LIKE '%"+ contraseña +"%' and estadoUsuario=1"+
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
    
    //MÉTODO PARA OBTENER TODOS LOS DATOS DE DIRECCIONES DEL USUARIO
    public ArrayList ObtenerFullDatosDirecciones(String correo, String contraseña){
        ArrayList lista = new ArrayList();
        String idDireccion="", nombreDireccion="", ciudadDireccion="", regionDireccion="", comunaDireccion="";
        PreparedStatement pst =null;
        ResultSet rs = null;
        try {
            String consulta = "select dir.idDireccion, dir.nombreDireccion, dir.ciudadDireccion, dir.regionDireccion, dir.comunaDireccion "+
                                "from direcciones dir, usuarios us where us.emailUsuario LIKE '%"+ correo +"%' and us.passUsuario LIKE '%"+ contraseña +"%' and estadoUsuario=1"+
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
    
    //MÉTODO PARA OBTENER TODOS LOS DATOS DE COTIZACIONES DEL USUARIO
    public ArrayList ObtenerFullDatosCotizaciones(String correo, String contraseña){
        ArrayList lista = new ArrayList();
        String numeroCotizacion="", estadoCotizacion="", nombreCotizacion="", descripcionCotizacion="";
        PreparedStatement pst =null;
        ResultSet rs = null;
        try {
            String consulta = "select cot.numeroCotizacion, cot.estadoCotizacion, cot.nombreCotizacion, cot.descripcionCotizacion "+
                                "from cotizaciones cot, usuarios us where us.emailUsuario LIKE '%"+ correo +"%' and us.passUsuario LIKE '%"+ contraseña +"%' and us.estadoUsuario=1"+
                                        " and us.idUsuario=cot.idUsuarioCotizacion";
            
            pst = getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
            if(rs.next()){
                do{
                    numeroCotizacion = rs.getString("numeroCotizacion");
                    estadoCotizacion = rs.getString("estadoCotizacion");
                    nombreCotizacion = rs.getString("nombreCotizacion");
                    descripcionCotizacion = rs.getString("descripcionCotizacion");
                    lista.add(numeroCotizacion);
                    lista.add(estadoCotizacion);
                    lista.add(nombreCotizacion);
                    lista.add(descripcionCotizacion);
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
    
    //MÉTODO PARA OBTENER TODOS LOS DATOS DE COTIZACIONES DEL USUARIO
    public ArrayList ObtenerFullDatosDetallesCotizaciones(String correo, int idCotizacion){
        ArrayList lista = new ArrayList();
        String numeroCotizacionDetalle="", fechaDetalle="", estadoDetalle="", descripcionCotizacion="";
        PreparedStatement pst =null;
        ResultSet rs = null;
        try {
            String consulta = "select det.numeroCotizacionDetalle, det.fechaDetalle, det.estadoDetalle, det.descripcionCotizacion "+
                                "from detallecotizaciones det, cotizaciones cot, usuarios us where us.emailUsuario LIKE '%"+ correo +"%' and cot.numeroCotizacion='"+ idCotizacion +"' and us.estadoUsuario=1"+
                                        " and us.idUsuario=cot.idUsuarioCotizacion and det.idCotizacionDetalle=cot.numeroCotizacion";
            
            pst = getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
            if(rs.next()){
                do{
                    numeroCotizacionDetalle = rs.getString("numeroCotizacionDetalle");
                    fechaDetalle = rs.getString("fechaDetalle");
                    estadoDetalle = rs.getString("estadoDetalle");
                    descripcionCotizacion = rs.getString("descripcionCotizacion");
                    lista.add(numeroCotizacionDetalle);
                    lista.add(fechaDetalle);
                    lista.add(estadoDetalle);
                    lista.add(descripcionCotizacion);
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
    
    //PRUEBA
    public static void main(String[] args) {
        ConsultasGenerales con = new ConsultasGenerales();
        System.out.println(con.registrarCliente("Mariano", "Pérez Vargas", "12.122.122-5", "+(569)11222244", "inventado@gmail.com", "pass123456"));
        //System.out.println(con.registrarCliente("Mariana", "Lopez Mardin", "12.122.111-3", "+56911221144", "prueba@hotmail.com", "pass123456"));
        //System.out.println(con.registrarDireccion("Villa El Remanso, psj Mariano LaTorre #1487", "Los Andes", "V Valparaíso", "Los Andes", 1));
        //System.out.println(con.existeCorreo("inventado@gmail.com"));  
        //System.out.println(con.ObtenerFullDatosDirecciones("inventado@gmail.cl", "asdfg123456"));
        //System.out.println(con.ObtenerFullDatosCotizaciones("inventado@gmail.cl", "asdfg123456"));
        
    }
    
}
