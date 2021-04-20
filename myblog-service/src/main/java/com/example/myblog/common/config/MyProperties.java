package com.example.myblog.common.config;

import lombok.Data;

import java.util.Arrays;
import java.util.List;

/**
 * <p> MyProperties </p>
 *
 * @author : duo.tao
 * @description :
 * @date : 2019/8/19 9:07
 */
@Data
//@ConfigurationProperties(prefix = "duo", ignoreUnknownFields = false)
public class MyProperties {

    /**
     * SWAGGER参数
     */
    private final Swagger swagger = new Swagger();
    /**
     * 安全认证
     */
    private final Auth auth = new Auth();

    /**
     * SWAGGER接口文档参数
     */
    @Data
    public static class Swagger {
        private String title = "";
        private String description = "";
        private String version = "";
        private String termsOfServiceUrl = "";
        private String contactName = "";
        private String contactUrl = "";
        private String contactEmail = "";
        private String license = "";
        private String licenseUrl = "";
    }

    @Data
    public static class Auth {
        /**
         * token过期时间（分钟）
         */
        private Integer tokenExpireTime = 30;
        /**
         * 用户选择保存登录状态对应token过期时间（天）
         */
        private Integer saveLoginTime = 1;
        /**
         * 限制用户登陆错误次数（次）
         */
        private Integer loginTimeLimit = 3;
        /**
         * 错误超过次数后多少分钟后才能继续登录（分钟）
         */
        private Integer loginAfterTime = 1;
        /**
         * 忽略安全认证的URL
         */
        private List<String> ignoreUrls = Arrays.asList("/login", "/api/system/user/getCurrentUserInfo", "/index");
    }

}
