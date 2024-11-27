package controller;

import java.util.TreeSet;

public class ExtractDataAndCreateTokens {
	String data;
	String []beforeTokens;
	TreeSet <String> tokens=new TreeSet<String>();
	int digit=0;
	
	public void setData(String data) {
		this.data = data;
		
	}

	/**
	 * @return the tokens
	 */
	public TreeSet<String> getTokens() {
		beforeTokens=this.data.split(" ");
		for(String word:beforeTokens)
	    {
	        word=word.replaceAll("[-.:,\";()?]"," ");
	        String regx="'s";
	        word=word.replaceAll(regx,"");
			word=word.trim();
			for(char c:word.toCharArray())
			{
				if(Character.isDigit(c))
				{
					digit++;
				}
			}
			if(digit==0)
			{
			if(word.contains(" "))
			{
				String []splitter=word.split(" ");
				for(String word1:splitter)
				{
					word1=word1.trim();
				tokens.add(word1);
			}
			}
			else
			{
				word=word.trim();
				tokens.add(word);
				
			}
			}
			digit=0;
	    }
		
		return tokens;
	}
	

}
