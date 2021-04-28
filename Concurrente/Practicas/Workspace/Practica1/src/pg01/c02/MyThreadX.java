package pg01.c02;

public class MyThreadX implements Runnable {

	@Override
	public void run() {
		for (int i = 0; i < 10; i++) {
			
			if (i == 2) {
				Thread.yield();
			}
			for (int j = 0; j< 1; j++) {
				System.out.print("X");
				}

			
			try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		
	}

}
