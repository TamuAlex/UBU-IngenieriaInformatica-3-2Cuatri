package pg02.c01;

public class AdaptadorParque implements IParque {

	// Declaracion de variables
	private IParque parque;
	private static AdaptadorParque parqueConf = new AdaptadorParque();
	// Constructor
	private AdaptadorParque() {
		this.parque = new Parque();
	}
	
	public static AdaptadorParque getInstancia() {
		return parqueConf;
	}
	@Override
	public synchronized void entrarAlParque(String puerta) {
		parque.entrarAlParque(puerta);
	}

}
