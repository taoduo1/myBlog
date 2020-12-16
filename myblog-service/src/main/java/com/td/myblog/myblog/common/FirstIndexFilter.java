package com.td.myblog.myblog.common;

import com.td.myblog.myblog.common.utils.DataUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import java.io.IOException;

/**
 * 过滤器
 */
@WebFilter(filterName = "firstIndexFilter",
        displayName = "firstIndexFilter",
        urlPatterns = {"/index/*"},
        initParams = @WebInitParam(
                name = "firstIndexFilterInitParam",
                value = "io.ostenant.springboot.sample.filter.FirstIndexFilter")
)
public class FirstIndexFilter implements Filter {
    private static final Logger LOGGER = LoggerFactory.getLogger(FirstIndexFilter.class);

    @Override
    public void init(FilterConfig filterConfig) {
        LOGGER.info("Register a new filter {}", filterConfig.getFilterName());
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        LOGGER.info("FirstIndexFilter pre filter the request");
        String filter = request.getParameter("filter1");
        if (DataUtil.isNullOrEmpty(filter)) {
            response.getWriter().println("Filtered by firstIndexFilter, " +
                    "please set request parameter \"filter1\"");
            return;
        }
        chain.doFilter(request, response);
        LOGGER.info("FirstIndexFilter post filter the response");
    }

    @Override
    public void destroy() {
        LOGGER.info("Destroy filter {}", getClass().getName());
    }
}