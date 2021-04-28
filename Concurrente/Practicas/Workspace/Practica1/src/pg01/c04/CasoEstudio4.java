package pg01.c04;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class CasoEstudio4 {
	
public static void main(String args[]) {
		
		Thread hilox = new Thread(new MyThread('X', 10, 10));
		Thread hiloo = new Thread(new MyThread('O', 10, 10));
		Thread hilo_ = new Thread(new MyThread('-', 10, 10));
		
		//ExecutorService exec = Executors.newSingleThreadExecutor();
		//ExecutorService exec = Executors.newFixedThreadPool(2);
		ExecutorService exec = Executors.newCachedThreadPool();
		
		exec.execute(hilox);
		exec.execute(hilo_);
		exec.execute(hiloo);
		
		exec.shutdown();
		
		
	}

}
