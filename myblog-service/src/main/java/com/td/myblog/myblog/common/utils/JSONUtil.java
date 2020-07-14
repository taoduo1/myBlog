package com.td.myblog.myblog.common.utils;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.lang.reflect.Type;
import java.text.SimpleDateFormat;

public final class JSONUtil {

    private static final Logger LOGGER = LoggerFactory.getLogger(JSONUtil.class);

    private static ObjectMapper mapper;

    static {
        mapper = new ObjectMapper();
        SerializationConfig serializationConfig = mapper.getSerializationConfig();
        serializationConfig = serializationConfig.with(JsonGenerator.Feature.WRITE_BIGDECIMAL_AS_PLAIN).without(SerializationFeature.WRITE_NULL_MAP_VALUES);
        mapper.setConfig(serializationConfig);
        // 忽略空值输出 
        mapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
        DeserializationConfig deserializationConfig = mapper.getDeserializationConfig();
        deserializationConfig = deserializationConfig.with(DeserializationFeature.USE_BIG_DECIMAL_FOR_FLOATS).without(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES);
        mapper.setConfig(deserializationConfig);
        mapper.setDateFormat(new SimpleDateFormat(DateUtil.YYYY_MM_DD_HH_MM_SS));
    }

    private JSONUtil() {
    }

    /**
     * @param json
     * @param type
     * @param <T>
     * @return
     */
    public static <T> T fromJSONString(String json, Type type) {
        try {
            ObjectMapper mapper = getMapper();
            JavaType typeReference = mapper.constructType(type);
            return mapper.readValue(json, typeReference);
        } catch (IOException e) {
            LOGGER.info("反序列化报错Type:{}, JSON:{}", type, json);
            LOGGER.error("", e);
            throw new RuntimeException();
        }
    }

    /**
     * @param json
     * @param typeReference
     * @param <T>
     * @return
     */
    public static <T> T fromJSONString(String json, TypeReference<T> typeReference) {
        try {
            return getMapper().readValue(json, typeReference);
        } catch (IOException e) {
            LOGGER.info("反序列化报错Type:{}, JSON:{}", typeReference.getType(), json);
            LOGGER.error("", e);
            throw new RuntimeException();
        }
    }

    private static ObjectMapper getMapper() {
        return mapper;
    }

    /**
     * @param json  json字符串
     * @param clazz 目标类型
     * @param <T>
     * @return
     */
    public static <T> T fromJSONString(String json, Class<T> clazz) {
        try {
            return getMapper().readValue(json, clazz);
        } catch (IOException e) {
            LOGGER.info("反序列化报错Type:{}, JSON:{}", clazz, json);
            LOGGER.error("", e);
            throw new RuntimeException();
        }
    }

    /**
     * @param t
     * @return
     * @JsonIgnoreProperties(ignoreUnknown = true)
     * <p>
     * ObjectMapper().write
     * @JsonProperty(value = "DatabaseProjectManagerUrl")
     * @JsonFormat(pattern = DateUtil.YYYY_MM_DD_HH_MM_SS)
     */
    public static <T> String toJSONString(T t) {
        try {
            return getMapper().writeValueAsString(t);
        } catch (JsonProcessingException e) {
            LOGGER.info("序列化报错{}", t);
            LOGGER.error("", e);
            throw new RuntimeException();
        }
    }

}
