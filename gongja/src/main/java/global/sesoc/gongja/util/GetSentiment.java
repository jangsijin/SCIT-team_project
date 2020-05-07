package global.sesoc.gongja.util;

import java.io.*;
import java.net.*;
import java.util.*;
import javax.net.ssl.HttpsURLConnection;

/*
 * Gson: https://github.com/google/gson
 * Maven info:
 *     groupId: com.google.code.gson
 *     artifactId: gson
 *     version: 2.8.1
 *
 * Once you have compiled or downloaded gson-2.8.1.jar, assuming you have placed it in the
 * same folder as this file (GetSentiment.java), you can compile and run this program at
 * the command line as follows.
 *
 * Execute the following two commands to build and run (change gson version if needed):
 * javac GetSentiment.java -classpath .;gson-2.8.1.jar -encoding UTF-8
 * java -cp .;gson-2.8.1.jar GetSentiment
 */
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonPrimitive;

class Document {
    public String id, language, text;

    public Document(String id, String language, String text){
        this.id = id;
        this.language = language;
        this.text = text;
    }
}

class Documents {
    public List<Document> documents;

    public Documents() {
        this.documents = new ArrayList<Document>();
    }
    public void add(String id, String language, String text) {
        this.documents.add (new Document (id, language, text));
    }
}

public class GetSentiment {
    static String subscription_key_var;
    static String subscription_key;
    static String endpoint_var;
    static String endpoint;

    public static void Initialize () throws Exception {
        subscription_key = "8e105db80a114e749151c732b314af78";
        endpoint = "https://gongja.cognitiveservices.azure.com/";
    }

    static String path = "/text/analytics/v3.0-preview.1/sentiment";
    
    public static String getTheSentiment (Documents documents) throws Exception {
        String text = new Gson().toJson(documents);
        byte[] encoded_text = text.getBytes("UTF-8");

        URL url = new URL(endpoint+path);
        HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Content-Type", "text/json");
        connection.setRequestProperty("Ocp-Apim-Subscription-Key", subscription_key);
        connection.setDoOutput(true);

        DataOutputStream wr = new DataOutputStream(connection.getOutputStream());
        wr.write(encoded_text, 0, encoded_text.length);
        wr.flush();
        wr.close();

        StringBuilder response = new StringBuilder ();
        BufferedReader in = new BufferedReader(
        new InputStreamReader(connection.getInputStream()));
        String line;
        while ((line = in.readLine()) != null) {
            response.append(line);
        }
        in.close();

        return response.toString();
    }

    public static String prettify(String json_text) {
        JsonParser parser = new JsonParser();
        JsonObject json = parser.parse(json_text).getAsJsonObject();
        System.out.println("here");
        System.out.println(json.toString());
        
        JsonArray j = json.getAsJsonArray("documents");
        JsonObject j1 = j.get(0).getAsJsonObject();
        JsonPrimitive j2 = j1.getAsJsonPrimitive("sentiment");
        String a = j2.toString();
        return a.substring(1, a.length()-1);
        
        
        //Gson gson = new GsonBuilder().setPrettyPrinting().create();
        //return gson.toJson(json);
    }
    
    public static String go(String text) {
    	
    	try {
    		Initialize();
    		
    		Documents documents = new Documents();
    		documents.add("1", "ko", text);
    		
    		String response = getTheSentiment (documents);
    		System.out.println (prettify(response));
    		
    		String a = prettify(response);    		
    		return a;
    	}
    	catch (Exception e) {
    		System.out.println (e);
    	}
    	return "null";
    }
    
    
/*     public static void main(String[] args) {
    	try {
    		Initialize();
    		
    		Documents documents = new Documents();
    		documents.add("1", "ko", "오늘은 공부가 잘 안됐던 것 같다. 사실 오늘 두통이 심해서 약을 먹어야 했다. 약이 효과가 없어서 어쩔 수 없이 쉬어야 했다.");
    		
    		String response = getTheSentiment (documents);
    		System.out.println (prettify(response));
    		
    		String a = prettify(response);
    		
    		JsonParser jsonParser = new JsonParser();
    		JsonElement jsonElement = jsonParser.parse(a);
    		
//    		String name = 
    		// 62 70
    		//String name = jsonElement.getAsJsonObject().get("documents").getAsJsonObject().get("sentiment").toString();
//    		int cnt1 = a.indexOf("positive");
//    		int cnt2 = a.indexOf("negative");
//    		if(cnt1 < cnt2) {
//    			System.out.println("positive가 맞음");
//    		} else
//    			System.out.println("negative가 맞음");
    		
    	}
    	catch (Exception e) {
    		System.out.println (e);
    	}
    }*/
    
}