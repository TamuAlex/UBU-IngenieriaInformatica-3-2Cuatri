package pg01.c03;

public class CasoEstudio3 {
	
public static void main(String args[]) {
		
		Thread hilox = new Thread(new MyThread('X', 1000, 100000));
		Thread hiloo = new Thread(new MyThread('O', 1000, 100000));
		Thread hilo_ = new Thread(new MyThread('-', 1000, 100000));
		
		hilox.setPriority(10);
		hiloo.setPriority(5);
		hilo_.setPriority(1);
		
		hilox.start();
		hiloo.start();
		hilo_.start();
		
		
	}

}
