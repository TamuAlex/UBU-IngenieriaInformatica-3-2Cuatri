package pg01.c02;

public class CasoEstudio2 {
	
public static void main(String args[]) throws InterruptedException {
		
		Thread hilox = new Thread(new MyThreadX());
		Thread hiloo = new Thread(new MyThreadO());
		Thread hilo_ = new Thread(new MyThread_());
		
		
		hilox.start();
		hiloo.start();
		hilo_.start();
		hilox.join();
		System.out.println("El programa ha terminado");
	}

}
