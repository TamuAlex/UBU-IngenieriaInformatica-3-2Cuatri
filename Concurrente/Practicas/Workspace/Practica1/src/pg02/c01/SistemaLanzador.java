package pg02.c01;

public class SistemaLanzador {
	private static final int N = 5;
	public static void main(String args[])  {
		

//		private IParque parque = new Parque();
		IParque parque = AdaptadorParque.getInstancia();
		
		for (int i = 0; i < N; i++) {
			String puerta = Character.toString((char)'A'+i);
		new Thread(new ActividadEntrPuerta(puerta,parque)).start();
		
		}

		
	}
	
}
