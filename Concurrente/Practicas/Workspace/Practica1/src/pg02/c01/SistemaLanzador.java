package pg02.c01;

public class SistemaLanzador {

	public static void main(String args[])  {
		
		IParque parque = new Parque();
		
		Thread puertaA = new Thread(new ActividadEntrPuerta("A", parque));
		Thread puertaB = new Thread(new ActividadEntrPuerta("B", parque));
		
		puertaA.start();
		puertaB.start();
		
	}
	
}
