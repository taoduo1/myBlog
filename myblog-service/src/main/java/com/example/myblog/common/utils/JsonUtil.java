package com.example.myblog.common.utils;


import com.example.myblog.entity.User;
import com.google.gson.*;
import com.google.gson.reflect.TypeToken;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author : duo.tao
 * @description : json 工具类，使用Google的Gson
 * @date : 2021/5/5 9:43
 */

public class JsonUtil {

    //不用创建对象,直接使用Gson.就可以调用方法
    private static final Gson gson;

    //判断gson对象是否存在了,不存在则创建对象

    static {
        //当使用GsonBuilder方式时属性为空的时候输出来的json字符串是有键值key的,显示形式是"key":null，而直接new出来的就没有"key":null的
        gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
    }

    //无参的私有构造方法
    private JsonUtil() {
    }

    /**
     * 将对象转成json格式
     *
     * @param object to json bean
     * @return jsonStr
     */
    public static String jsonToBean(Object object) {
        String gsonString = null;
        if (gson != null) {
            gsonString = gson.toJson(object);
        }
        return gsonString;
    }


    public static <T> T jsonToBean(String str, Class<T>  classOfT) {
        if (DataUtil.isNullOrEmpty(str)) return null;
        return gson.fromJson(str,classOfT);
    }

    /**
     * json字符串转成list
     * @param jsonString jsonStr
     * @return list
     */
    public static <T> List<T> jsonToList(String jsonString) {
        List<T> list = null;
        if (gson != null) {
            //根据泛型返回解析指定的类型,TypeToken<List<T>>{}.getType()获取返回类型
            list = gson.fromJson(jsonString, new TypeToken<List<T>>() {
            }.getType());
        }
        return list;
    }

    /**
     * json字符串转成list
     *
     * @param json jsonStr
     * @param cls  to class type
     * @return List<Object>
     */
    public static <T> List<T> jsonToList(String json, Class<T> cls) {
        ArrayList<T> mList = new ArrayList<T>();
        JsonArray array = new JsonParser().parse(json).getAsJsonArray();
        for (final JsonElement elem : array) {
            mList.add(gson.fromJson(elem, cls));
        }
        return mList;
    }

    /**
     * json字符串转成list中有map的
     *
     * @param jsonString jsonStr
     * @return List<Map<String,Object>
     */
    public static <T> List<Map<String, T>> jsonToListMaps(String jsonString) {
        List<Map<String, T>> list = null;
        if (gson != null) {
            list = gson.fromJson(jsonString,
                    new TypeToken<List<Map<String, T>>>() {
                    }.getType());
        }
        return list;
    }

    /**
     * json字符串转成map的
     *
     * @param jsonString jsonStr
     * @return Map<String,Object>
     */
    public static <T> Map<String, T> jsonToMaps(String jsonString) {
        Map<String, T> map = null;
        if (gson != null) {
            map = gson.fromJson(jsonString, new TypeToken<Map<String, T>>() {
            }.getType());
        }
        return map;
    }


    public static void main(String[] args) {
        User user = new User();
        user.setName("name");
        user.setCode("code");

        String userStr = JsonUtil.jsonToBean(user);
        User newUser = (User) JsonUtil.jsonToBean(userStr, User.class);
        System.out.println(newUser.getCode());


    }
}
