package pg02.c01;

import java.util.Hashtable;
import java.util.Random;

public class Parque implements IParque {


	private int nPersonas;
	private Hashtable<String, Integer> contadorPersonasPuerta;
	
	public Parque() {
		this.nPersonas = 0;
		this.contadorPersonasPuerta = new Hashtable<String, Integer>();
		
	}
	
	public void entrarAlParque(String puerta) {
		nPersonas++;
		try {
			
			Thread.sleep(new Random().nextInt(5) * 1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		if (!contadorPersonasPuerta.containsKey(puerta)) {
			contadorPersonasPuerta.put(puerta, 0);
		} 

		int contador = contadorPersonasPuerta.get(puerta);
		contador ++;
		contadorPersonasPuerta.put(puerta, contador);

		
		mensajes(puerta);
		
		assert comprobarInvariante() : "Se ha jodido el invariante";
		
		
		
		
	}
	
	private void mensajes(String puerta) {
		System.out.printf("\n Entrada al parque por la puerta %s", puerta);
		System.out.printf("\n -->personas en el parque %d", nPersonas);
		for (String clave:contadorPersonasPuerta.keySet()) {
			int valor = contadorPersonasPuerta.get(clave);
			System.out.printf("\n ----> Por puerta %s %d", clave, valor);
		}
	}
	
	private boolean comprobarInvariante() {
		int contador = 0;
		
		for (String clave:contadorPersonasPuerta.keySet()) {
			int valor = contadorPersonasPuerta.get(clave);
			contador += valor;
		}
		
		return contador == this.nPersonas;
	}

}
