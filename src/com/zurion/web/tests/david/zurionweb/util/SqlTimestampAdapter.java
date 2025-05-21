package com.zurion.web.tests.david.zurionweb.util;

import com.google.gson.*;
import java.lang.reflect.Type;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class SqlTimestampAdapter implements JsonDeserializer<Timestamp>, JsonSerializer<Timestamp> {

    private static final SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @Override
    public Timestamp deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context)
            throws JsonParseException {
        try {
            java.util.Date parsed = formatter.parse(json.getAsString());
            return new Timestamp(parsed.getTime());
        } catch (ParseException e) {
            throw new JsonParseException("Invalid timestamp format: " + json.getAsString(), e);
        }
    }

    @Override
    public JsonElement serialize(Timestamp src, Type typeOfSrc, JsonSerializationContext context) {
        return new JsonPrimitive(formatter.format(src));
    }
}
