package pg01.c01;

public class MyThreadX implements Runnable {

	@Override
	public void run() {
		for (int i = 0; i < 1000000; i++) {
			
			if (i == 2) {
				Thread.yield();
			}
			System.out.print("x");
		}
		
	}

}