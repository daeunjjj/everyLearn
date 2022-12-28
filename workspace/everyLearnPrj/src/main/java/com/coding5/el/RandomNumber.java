package com.coding5.el;

import java.util.Random;

public class RandomNumber {
	public static String randomNumber() {
		Random random = new Random();
		int createNum = 0;
		String result = "";
		
		for(int i = 0; i < 6; i++) {
			
			createNum = random.nextInt(9);
			result += Integer.toString(createNum);
			
		}
		
		return result;
	}
}
