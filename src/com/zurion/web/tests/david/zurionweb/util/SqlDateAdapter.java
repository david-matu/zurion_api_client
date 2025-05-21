package com.zurion.web.tests.david.zurionweb.util;

import com.google.gson.*;
import java.lang.reflect.Type;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class SqlDateAdapter implements JsonDeserializer<Date>, JsonSerializer<Date> {
    /*
	@Override
    public Date deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context)
            throws JsonParseException {
    	
    	// DateFormat df = new SimpleDateFormat(" 17, 2024");
    	
        return Date.valueOf(json.getAsString()); // Assumes format is "YYYY-MM-DD"
    }
    */
	
	@Override
	public Date deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context)
	        throws JsonParseException {
	    try {
	        // Parse the datetime string
	        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        java.util.Date parsed = formatter.parse(json.getAsString());

	        // Convert to java.sql.Date
	        return new Date(parsed.getTime());
	    } catch (ParseException e) {
	        throw new JsonParseException("Invalid date format: " + json.getAsString(), e);
	    }
	}

    @Override
    public JsonElement serialize(Date src, Type typeOfSrc, JsonSerializationContext context) {
        return new JsonPrimitive(src.toString()); // Outputs "YYYY-MM-DD"
    }
}
