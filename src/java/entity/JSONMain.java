/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author see_h
 */
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class JSONMain {
	public static void generateJSON(ArrayList<Username> listOfUsername){
		JSONObject object = new JSONObject();
		JSONArray array = new JSONArray();
		try {
			object.put("USERNAMES", listOfUsername);
			array.put(object);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(array.toString());
	}
	public static void main(String[] args) {
		ArrayList<Username> listOfUsername = new ArrayList<Username>();
		listOfUsername.add(new Username(null, "1234", "example@gmail.com"));
		listOfUsername.add(new Username("bob1992", "1234", "example@gmail.com"));
		listOfUsername.add(new Username("bob1992", "1234", "example@gmail.com"));
		
		generateJSON(listOfUsername);
		
	}
}

