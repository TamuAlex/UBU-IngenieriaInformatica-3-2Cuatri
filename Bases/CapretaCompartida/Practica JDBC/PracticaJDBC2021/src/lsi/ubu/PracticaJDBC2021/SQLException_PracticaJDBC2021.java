package lsi.ubu.PracticaJDBC2021;

import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SQLException_PracticaJDBC2021 extends SQLException {

	
	
	private static final long serialVersionUID = 1L;
	
	public static final int NO_EXISTE_CLIENTE = -1;
	public static final int NO_EXISTE_CTA = -2;
	public static final int AUTORIZACION_REPETIDA = -3;
	public static final int SALDO_NEGATIVO = -4;
	
	private int codigo; // = -1;
	private String mensaje;

	private static Logger l = null;	

	public SQLException_PracticaJDBC2021(int code) {
		codigo = code;

		switch(codigo) {
		case -1: mensaje="No existe cliente con ese DNI"; break;
		case -2: mensaje="No existe ese nro de cuenta corriente"; break;
		case -3: mensaje="Autorizacion Repetida"; break;
		case -4: mensaje="El saldo no puede ser negativo"; break;
		}
		
		
		
		
		l =	LoggerFactory.getLogger(SQLException_PracticaJDBC2021.class);	
		l.error(mensaje);

		// Traza_de_pila
		for (StackTraceElement ste : Thread.currentThread().getStackTrace()) {
			l.info(ste.toString());
		}
	}

	@Override
	public String getMessage() { // Redefinicion del metodo de la clase
									// Exception
		return mensaje;
	}

	@Override
	public int getErrorCode() { // Redefinicion del metodo de la clase
								// SQLException
		return codigo;
	}

}
