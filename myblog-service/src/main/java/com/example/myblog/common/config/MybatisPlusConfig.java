package com.example.myblog.common.config;


import com.baomidou.mybatisplus.plugins.PaginationInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 *  <p> MybatisPlus配置类 </p>
 *
 * @description :
 * @author : duo.tao
 * @date : 2021/5/8 11:36
 */
@EnableTransactionManagement
@Configuration
public class MybatisPlusConfig {
    /**
     * mybatis-plus分页插件<br>
     * 文档：https://mp.baomidou.com/guide/page.html <br>
     */
    @Bean
    public PaginationInterceptor paginationInterceptor() {
        // paginationInterceptor.setLimit(你的最大单页限制数量，默认 500 条，小于 0 如 -1 不受限制);
        return new PaginationInterceptor();
    }

}
