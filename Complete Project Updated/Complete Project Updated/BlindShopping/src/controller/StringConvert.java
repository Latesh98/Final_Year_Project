package controller;

import java.util.Arrays;
import java.util.stream.Collectors;

public class StringConvert {
	 public static String convertArray(String[] strArray) {
	        String joinedString = Arrays.stream(strArray)
	            .collect(Collectors.joining());
	        return joinedString;
	    }
	 public static void main(String[] args) {
		String str="[Hello]";
		 StringConvert st=new StringConvert();
		 
	}
}
