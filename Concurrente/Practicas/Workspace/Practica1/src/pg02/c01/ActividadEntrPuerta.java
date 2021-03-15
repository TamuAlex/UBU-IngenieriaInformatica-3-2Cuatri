package pg02.c01;

import java.util.Random;

public class ActividadEntrPuerta implements Runnable {
	private static final int NUMENTRADAS = 20;
	private String nombre;
	private IParque parque;
	
	public ActividadEntrPuerta(String nombre, IParque parque) {
		this.nombre = nombre;
		this.parque = parque;
	}

	public void run() {
		for (int i = 0; i<NUMENTRADAS; i++) {
			parque.entrarAlParque(nombre);
			
			try {
				
				Thread.sleep(new Random().nextInt(5) * 1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
}
