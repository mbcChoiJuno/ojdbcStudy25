package mbcacademy.utils;

public class Alert {

	public static void print(String format, Object... args) {
		
		System.out.println();
		System.out.printf("(!) "+format + "\n", args);
	}
}
