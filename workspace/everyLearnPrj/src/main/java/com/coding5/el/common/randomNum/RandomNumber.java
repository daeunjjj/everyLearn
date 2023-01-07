package com.coding5.el.common.randomNum;

import java.util.Random;
import java.util.UUID;

public class RandomNumber {
	// 인증번호
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
	// 임시 비빌번호
	public static String getTempPwd() {
		String tempPwd = UUID.randomUUID().toString().replace("-", "");
		tempPwd = tempPwd.substring(0,10);
		return tempPwd+"@";
	}
}