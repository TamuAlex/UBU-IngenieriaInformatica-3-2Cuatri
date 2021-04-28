package pg01.c04;

public class MyThread implements Runnable {

	private char caracter;
	private int dormido;
	private int impresiones;
	
	public MyThread(char caracter, int dormido, int impresiones) {
		this.caracter = caracter;
		this.dormido = dormido;
		this.impresiones = impresiones;
	}
	
	@Override
	public void run() {
		for (int i = 0; i < impresiones; i++) {
			for (int j = 0; j< 1; j++) {
				System.out.println(caracter);
				}

			
			try {
				Thread.sleep(dormido);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		
	}

}

