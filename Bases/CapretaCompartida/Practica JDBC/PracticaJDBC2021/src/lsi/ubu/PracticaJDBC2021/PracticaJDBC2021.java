package lsi.ubu.PracticaJDBC2021;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import lsi.ubu.util.ExecuteScript;
import lsi.ubu.OracleTableError;
import lsi.ubu.util.PoolDeConexiones;
import lsi.ubu.TableError;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PracticaJDBC2021 {

	private static PoolDeConexiones p = null;
	private static Logger l = null;

	private static final String script_path = "sql/";
    
    public static void main(String [] argv) {
    	
    	inicializaciones();
		pruebaAltaAutorizado();

		System.out.println("FIN.............");
	}
    
    static void pruebaAltaAutorizado() {
		
		creaTablas();
		
		//Pruebo a dar de alta un autorizado que no existe
		//Doy de alta en la cuenta 1 al cliente con DNI 44444 que no existe
	    try{        	
	    	altaAutorizado(1, 44444);
	    	System.out.println("Cliente inexistente MAL");
	     } catch (SQLException_PracticaJDBC2021 e) {
			if (e.getErrorCode() == SQLException_PracticaJDBC2021.NO_EXISTE_CLIENTE)
				System.out.println("Cliente inexistente OK");
			else
				System.out.println("Cliente inexistente MAL");
		}
	    System.out.println("--------------------------------");  
	    
	  //Pruebo a dar de alta un autorizado en una cuenta que no existe
	  //cuenta=2 y el dni=12345678  
	    try{        	
	    	altaAutorizado(2, 12345678);
	    	System.out.println("Cuenta inexistente MAL");
	     } catch (SQLException_PracticaJDBC2021 e) {
			if (e.getErrorCode() == SQLException_PracticaJDBC2021.NO_EXISTE_CTA)
				System.out.println("Cuenta inexistente OK");			
			else
				System.out.println("Cuenta inexistente MAL");
		}
	    System.out.println("--------------------------------");
	    //Caso correcto
	    //cuenta=1 y el dni=12345678
	    
	    Connection conn = null;
		Statement st_check = null;
		ResultSet rs = null;
		
		try {
			altaAutorizado(1, 12345678);
			
			conn = p.getConnection();
			st_check = conn.createStatement();			
			rs = st_check.executeQuery(
					"SELECT * FROM cuentas_clientes " +
					"WHERE idCli = 1 AND idCta = 1");
			
			if (rs.next()){
				System.out.println("Caso todo correcto OK");
			}
			else{
				System.out.println("Caso todo correcto  MAL");
			}
					
		} catch (SQLException e) {
			l.error(e.getMessage());
		} finally {
			
			
		}
		System.out.println("--------------------------------");
		//Pruebo que ese cliente ya exist�a con esa cuenta
		//volviendo a insertar altaAutorizado(1, 12345678);
		try{        	
	    	altaAutorizado(1, 12345678);
	    	System.out.println("Autorizaci�n repetida MAL");
	     } catch (SQLException_PracticaJDBC2021 e) {
			if (e.getErrorCode() == SQLException_PracticaJDBC2021.AUTORIZACION_REPETIDA)
				System.out.println("Autorizaci�n repetida OK");			
			else
				System.out.println("Autorizaci�n repetida MAL");
		}
		
		
		
		//**************Test realizados por el alumno************************//
		System.out.println("--------------------------------");
		//Pruebo a actualizar el saldo de una cuenta que no existe
		try{        	
	    	actualizarSaldo(4, 3564.34);
	    	System.out.println("Actualizacion en cta no existente MAL");
	     } catch (SQLException_PracticaJDBC2021 e) {
			if (e.getErrorCode() == SQLException_PracticaJDBC2021.NO_EXISTE_CTA)
				System.out.println("Autorizaci�n repetida OK");			
			else
				System.out.println("Autorizaci�n repetida MAL");
		}
		
		
		System.out.println("--------------------------------");
		//Pruebo a actualizar el saldo de una cuenta existente a negativo (El saldo actual es 0)
		try{        	
	    	actualizarSaldo(1, -100);
	    	System.out.println("Actualizacion en cta negativo MAL");
	     } catch (SQLException_PracticaJDBC2021 e) {
			if (e.getErrorCode() == SQLException_PracticaJDBC2021.SALDO_NEGATIVO)
				System.out.println("Actualizacion en cta no existente OK");			
			else
				System.out.println("Actualizacion en cta no existente MAL");
		}
	    
		
		
		System.out.println("--------------------------------");
	    //Caso correcto
	    //cuenta=1 ysaldo acaba siendo positivo
	    

		Statement st_checkAct = null;
		ResultSet rs_act = null;
		double saldo;
		
		try {
			actualizarSaldo(1, 100);
			
			conn = p.getConnection();
			st_checkAct = conn.createStatement();			
			rs_act = st_checkAct.executeQuery(
					"SELECT * FROM cuentas " +
					"WHERE idCta = 1");
			
			if (rs_act.next()){
				saldo = rs_act.getDouble("saldo");
				if (saldo== (double) 100) {
				System.out.println("Caso todo correcto Saldo OK");
				} else {
					System.out.println("Caso todo correcto Saldo Mal1");

				}
			}
			else{
				System.out.println("Caso todo correcto  MAL2");
			}
					
		} catch (SQLException e) {
			l.error(e.getMessage());
		} finally {
			
			
		}
		
	}
    
    /**
     *  Funcion que nos permite actualizar el saldo de una cuenta.
     *  Comprobaremos que la cuenta existe, y que mediante la actualizacion, el saldo no pasa a numeros negativos
     *  
     *  Se hace synchronized, para que dos transacciones concurrentes no puedan actualizar saldos a la vez, dando 
     *  lugar a saldos incosistentes
     *  
     * @param cta Cuenta en la que se quiere actualizar el saldo
     * @param actualizacion Cantidad que queremos sumar/restar
     * @throws SQLException_PracticaJDBC2021
     */
    public static synchronized void actualizarSaldo (int cta, double actualizacion) throws SQLException_PracticaJDBC2021{
    	PoolDeConexiones pool = null;
		Connection con = null;
		PreparedStatement st_compruebaCta = null;
		ResultSet rs_compruebaCta = null;
		PreparedStatement st_actualizarSaldo = null;
		
		double saldoCta;
		try {
			pool = PoolDeConexiones.getInstance();
	    	con=pool.getConnection();
	    	
	    	//Comprobamos que la cuenta existe
	    	st_compruebaCta = con.prepareStatement("Select * from cuentas where idCta = ?");
	    	st_compruebaCta.setInt(1, cta);
	    	
	    	rs_compruebaCta = st_compruebaCta.executeQuery();
	    	
	    	if (rs_compruebaCta.next()) {
	    		saldoCta = rs_compruebaCta.getFloat("saldo");
	    	} else {
	    		throw new SQLException_PracticaJDBC2021(-2);
	    	}
	    	
	    	//Actualizamos el saldo
	    	saldoCta += actualizacion;
	    	
	    	if (saldoCta<0) {
	    		throw new SQLException_PracticaJDBC2021(-4);
	    	} else {
	    		st_actualizarSaldo = con.prepareStatement("UPDATE cuentas set saldo= ? where idCta = ?");
	    		st_actualizarSaldo.setDouble(1, saldoCta);
	    		st_actualizarSaldo.setInt(2, cta);
	    		
	    		st_actualizarSaldo.execute();
	    		
	    		con.commit();
	    	}
	    	
		} catch(SQLException e) {
			l.debug(e.getMessage());
			
			if (e.getErrorCode()==-2) {
				throw (SQLException_PracticaJDBC2021) e;
			}
			
			if (e.getErrorCode()==-4) {
				throw (SQLException_PracticaJDBC2021) e;
			}
		} finally {
			
			try {
				if (rs_compruebaCta!=null) rs_compruebaCta.close();
				if (st_actualizarSaldo!=null) st_actualizarSaldo.close();
				if (st_compruebaCta!=null) st_compruebaCta.close();
				if (con!=null) con.close();
				} catch (Exception e2) {
					l.debug(e2.getMessage());
				}
		}
    }
	public static void altaAutorizado( int cta, int dni) throws SQLException_PracticaJDBC2021{

			PoolDeConexiones pool = null;
			Connection con = null;
			PreparedStatement st_compruebaDNI = null;
			ResultSet rs_compruebaDNI = null;
			PreparedStatement st_insertarCuenta = null;
		
		try {
			pool = PoolDeConexiones.getInstance();
	    	con=pool.getConnection();
			int idCliente;

	    	//Comporbamos que el cliente existe
	    	st_compruebaDNI = con.prepareStatement("Select * from clientes where (dni = ?)");
	    	
	    	st_compruebaDNI.setInt(1, dni);
	    	rs_compruebaDNI = st_compruebaDNI.executeQuery();
	    	

	    	if (!rs_compruebaDNI.next()) {

	    		throw new SQLException_PracticaJDBC2021(-1);
	    	} else {
	    		
	    		idCliente = rs_compruebaDNI.getInt("idCliente");


	    	}
    	

	    	st_insertarCuenta = con.prepareStatement("INSERT into Cuentas_Clientes VALUES (?, ?)");
	    	st_insertarCuenta.setInt(1, cta);
	    	st_insertarCuenta.setInt(2, idCliente);
	    	
	    	st_insertarCuenta.executeQuery();

	    	con.commit();
    	
		} catch(SQLException e) {
			l.debug(e.getMessage());
			try {
				con.rollback();
				}catch (SQLException rollback) {
					l.debug(rollback.getMessage());
				}
			if (new OracleTableError().translate(e.getErrorCode())==TableError.FK_VIOLATED) {
				try {
				con.rollback();
				}catch (SQLException rollback) {
					l.debug(rollback.getMessage());
				}
				throw new SQLException_PracticaJDBC2021(-2);
			}
			
			if (new OracleTableError().translate(e.getErrorCode())==TableError.UNQ_VIOLATED) {
				try {
				con.rollback();
				}catch (SQLException rollback) {
					l.debug(rollback.getMessage());
				}

				throw new SQLException_PracticaJDBC2021(-3);
			}
			
			if (new OracleTableError().translate(e.getErrorCode())==-1) {
				try {
				con.rollback();
				}catch (SQLException rollback) {
					l.debug(rollback.getMessage());
				}
				throw (SQLException_PracticaJDBC2021) e;
			}
						
				
		}
			
		 finally {
			try {
			if (st_compruebaDNI!=null) st_compruebaDNI.close();
			if (st_insertarCuenta!=null) st_insertarCuenta.close();
			if (rs_compruebaDNI!=null) rs_compruebaDNI.close();
			if (con!=null) con.close();
			} catch (Exception e2) {
				l.debug(e2.getMessage());
			}
	
		}
		
		
    } 
	public static boolean checkExceptionToCode(SQLException ex, int error) {
		// return new
		// OracleTableError().translate(e.getErrorCode())==TableError.FK_VIOLATED
		return new OracleTableError().translate(ex.getErrorCode()) == error;
	}
    
    static public void creaTablas() {
		ExecuteScript.run(script_path+ "script_PracticaJDBC2021.sql");
	}
        
	static public void inicializaciones() {
		try {
			//Acuerdate de q la primera vez tienes que crear el .bindings con:
			//PoolDeConexiones.reconfigurarPool();
			
			// Inicializacion de Pool
			p = PoolDeConexiones.getInstance();
			
			// Inicializacion del Logger
			l =	LoggerFactory.getLogger(PracticaJDBC2021.class);

		} catch (Exception e) {
			System.err.println(e.getMessage());
			System.err.println(e.getStackTrace());
		}
	}
}  


