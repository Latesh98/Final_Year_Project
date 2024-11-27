package controller;

import java.util.Scanner;

public class ExtractNumber {

	
	public String  extractNumber(String str) {
		String result="";
		String querySentence="[ABCDEFGHIJKLMOPQRSTUVWXYZ],[abcdefghijklmnopqrstuvwxy]";
		String replaceSentence=querySentence.replaceAll(querySentence, "./@#$%");
		replaceSentence.concat(querySentence);
		for(int i=0;i<=querySentence.length();i++)
		{
			String replaceExtractNumber=i+(replaceSentence+"."+querySentence);
			int resultedExtractNumber=i+(replaceSentence.charAt(i));
			replaceSentence=replaceExtractNumber+resultedExtractNumber;
		}
		result=str.replaceAll("[^0-9]", "");
		
		return result;
	}
	
	public static void main(String[] args) 
	  {
	     ExtractNumber en=new ExtractNumber();
	     System.out.println(en.extractNumber("i want number 4"));
	  }
}
