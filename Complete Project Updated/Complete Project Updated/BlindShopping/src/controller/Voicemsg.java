package controller;

import com.sun.speech.freetts.Voice;
import com.sun.speech.freetts.VoiceManager;

public class Voicemsg {
	 private static final String VOICENAME="kevin16";
	    public  void talk(String args) 
	    {
	    Voice voice;
	    VoiceManager voiceManager=VoiceManager.getInstance();
	    voice=voiceManager.getVoice(VOICENAME);
	    voice.allocate();
	    try
	    {
	   
	    	voice.speak(args);
	    }catch(Exception e)
	    {
	    	
	    }
	    }
	    public static void main(String[] args) {
			Voicemsg mdg=new Voicemsg();
			mdg.talk("Hello user");
		}
	}


