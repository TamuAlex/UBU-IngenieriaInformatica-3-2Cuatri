package pg01.c01;

public class CasoEstudio1 {
	
	public static void main(String args[]) {
		
		Thread hilox = new Thread(new MyThreadX());
		Thread hiloo = new Thread(new MyThreadO());
		Thread hilo_ = new Thread(new MyThread_());
		
		hilox.start();
		hiloo.start();
		hilo_.start();
	}
	
}