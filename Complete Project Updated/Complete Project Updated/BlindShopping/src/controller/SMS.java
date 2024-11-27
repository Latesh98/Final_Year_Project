package controller;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.nio.charset.Charset;
/**
 * Created by Dell on 10/1/2017.
 */

public class SMS {



    public static String callURL(String myURL, String msgC, String PhoneNumber)
            throws UnsupportedEncodingException {

        String msg = URLEncoder.encode(msgC, "ISO-8859-1");
        String user = "demo93";
        String password = "demo93";
        String sender = "TSTSMS";
        System.out.println("Requeted URL:" + myURL);

        String bb="http://sms.wecreatead.com/API/WebSMS/Http/v1.0a/index.php?username=demo93&password=demo93&sender=TSTSMS&to="+PhoneNumber+"&message="+msg;
        String RURL = bb;//myURL + "?PhoneNumber=" + PhoneNumber + "&Text=" + msg+ "&user=demo93&password=demo93&sender=TSTSMS";
        System.out.println("Requeted URL After:" + RURL);

        StringBuilder sb = new StringBuilder();
        URLConnection urlConn = null;
        InputStreamReader in = null;
        try {
            URL url = new URL(RURL);
            urlConn = url.openConnection();
            if (urlConn != null)
                urlConn.setReadTimeout(60 * 1000);
            if (urlConn != null && urlConn.getInputStream() != null) {
                in = new InputStreamReader(urlConn.getInputStream(),
                        Charset.defaultCharset());
                BufferedReader bufferedReader = new BufferedReader(in);
                if (bufferedReader != null) {
                    int cp;
                    while ((cp = bufferedReader.read()) != -1) {
                        sb.append((char) cp);
                    }
                    bufferedReader.close();
                }
            }
            in.close();
        } catch (Exception e) {
            throw new RuntimeException("Exception while calling URL:" + myURL,
                    e);
        }

        return sb.toString();
    }
}
