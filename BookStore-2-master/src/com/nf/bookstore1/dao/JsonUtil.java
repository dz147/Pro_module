package com.nf.bookstore1.dao;

import java.io.IOException;
import java.text.SimpleDateFormat;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class JsonUtil {


    //序列化
    public static String toJson(Object obj) {
        String Result = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        ObjectMapper mapper = new ObjectMapper();
        mapper.setDateFormat(sdf);
        try {
            Result = mapper.writeValueAsString(obj);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return Result;
    }

    //反序列化
    public static <T> T toObject(String str, Class<T> valueType) {
        T result = null;
        ObjectMapper map = new ObjectMapper();
        try {
            result = map.readValue(str, valueType);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }
}
