package pg01.c02;

public class MyThreadO implements Runnable {

	@Override
	public void run() {
		for (int i = 0; i < 100000; i++) {
			for (int j = 0; j< 10000; j++) {
				System.out.print("O");
				}

			
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		
	}

}