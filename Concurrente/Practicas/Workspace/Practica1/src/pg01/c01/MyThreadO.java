package pg01.c01;

public class MyThreadO implements Runnable {

	@Override
	public void run() {
		for (int i = 0; i < 1000000; i++) {
			System.out.print("o");
		}
		
	}

}
