package com.liclass.client.login.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class KakaoService { //은아
	
	public String getReturnAccessToken(String code) {
        String access_token = "";
        @SuppressWarnings("unused")
		String refresh_token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

       try {
           URL url = new URL(reqURL);
           HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn.setRequestMethod("POST");
            conn.setDoOutput(true);


            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=4c6b0fe25dce006d344c7ca9653f6151");  
            sb.append("&redirect_uri=http://127.0.0.1:8080/user/kakaoLogin"); 
            sb.append("&code=" + code);
            bw.write(sb.toString());
            bw.flush();

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String br_line = "";
            String result = "";

            while ((br_line = br.readLine()) != null) {
                result += br_line;
            }

            @SuppressWarnings("deprecation")
			JsonParser parser = new JsonParser();
            @SuppressWarnings("deprecation")
			JsonElement element = parser.parse(result);


            access_token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_token = element.getAsJsonObject().get("refresh_token").getAsString();

            br.close();
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
       log.warn("access_token:: " + access_token);

        return access_token;
    }

    public Map<String,Object> getUserInfo(String access_token) {
           Map<String,Object> resultMap =new HashMap<>();
           String reqURL = "https://kapi.kakao.com/v2/user/me";
            try {
                URL url = new URL(reqURL);
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("GET");

                conn.setRequestProperty("Authorization", "Bearer " + access_token);
                int responseCode = conn.getResponseCode();
                System.out.println("responseCode : " + responseCode);

                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

                String br_line = "";
                String result = "";

                while ((br_line = br.readLine()) != null) {
                    result += br_line;
                }
               System.out.println("response:" + result);


                @SuppressWarnings("deprecation")
				JsonParser parser = new JsonParser();
                @SuppressWarnings("deprecation")
				JsonElement element = parser.parse(result);
                log.warn("element:: " + element);
                JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
                JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
               
                String user_email = kakao_account.getAsJsonObject().get("email").getAsString();
                String user_pw = element.getAsJsonObject().get("id").getAsString();
                String user_name = properties.getAsJsonObject().get("nickname").getAsString();
                String user_img =  properties.getAsJsonObject().get("profile_image").getAsString();
                int user_type = 1;
               
                resultMap.put("user_email", user_email); 
                resultMap.put("user_pw", user_pw);
                resultMap.put("user_name", user_name);
                resultMap.put("user_img", user_img); 
                resultMap.put("user_type", user_type); 
                
                log.warn("user_email :: "+user_email);
                log.warn("user_pw :: " + user_pw);
                log.warn("user_name :: " + user_name);
                log.warn("user_img :: " + user_img);
                log.warn("user_type :: " + user_type);

            } catch (IOException e) {
                e.printStackTrace();
            }
            return resultMap;
        }
    
    public void logout(String access_Token) {
	    String reqURL = "https://kapi.kakao.com/v1/user/unlink";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String result = "";
	        String line = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println(result);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}
}
