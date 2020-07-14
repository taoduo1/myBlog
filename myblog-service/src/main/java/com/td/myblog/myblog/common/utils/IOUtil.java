package com.td.myblog.myblog.common.utils;


import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.ResourceUtils;

import javax.servlet.ServletRequest;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.Properties;

public class IOUtil {

    public static final String UTF_8 = "UTF-8";
    private static final Logger LOGGER = LoggerFactory.getLogger(IOUtil.class);

    private IOUtil() {
    }

    public static Properties loadResourceAsProperties(Class<?> clazz, String filename) {
        Properties properties = new Properties();
        try {
            InputStream in = clazz.getClassLoader().getResourceAsStream(File.separatorChar + filename);
            properties.load(in);
        } catch (Exception e) {
            LOGGER.info("{} filename: {}", e.getMessage(), filename);
        }
        return properties;
    }

    public static String loadResourceAsString(String filepath, Class<?> clazz) {
        String string = null;
        try (InputStream inputStream = IOUtil.loadResourceAsStream(clazz, filepath)) {
            string = IOUtils.toString(inputStream, StandardCharsets.UTF_8.name());
            if (LOGGER.isDebugEnabled()) LOGGER.debug("{}", string);
        } catch (IOException e) {
            LOGGER.error("", e);
            throw new RuntimeException();
        }
        return string;
    }

    public static void byteArrayToOutputStream(byte[] ary, OutputStream outputStream, boolean closeit) throws IOException {
        outputStream.write(ary);
        if (closeit) outputStream.close();
    }

    public static void inputStreamToOutputStream(InputStream inputStream, OutputStream outputStream) throws IOException {
        try {
            inputStreamToOutputStreamWithoutClose(inputStream, outputStream);
        } finally {
            closeResource(inputStream, outputStream);
        }
    }

    public static void inputStreamToOutputStreamWithoutClose(InputStream inputStream, OutputStream outputStream) throws IOException {
        byte[] buff = new byte[1000]; //buff用于存放循环读取的临时数据
        int readcount = 0;
        while ((readcount = inputStream.read(buff, 0, 1000)) > 0) {
            outputStream.write(buff, 0, readcount);
        }
    }

    public static byte[] inputStreamToByteArray(InputStream inputStream) throws IOException {
        ByteArrayOutputStream swapStream = new ByteArrayOutputStream();
        byte[] ary = null;
        try {
            byte[] buff = new byte[1000]; //buff用于存放循环读取的临时数据
            int readcount = 0;
            while ((readcount = inputStream.read(buff, 0, 1000)) > 0) {
                swapStream.write(buff, 0, readcount);
            }
            ary = swapStream.toByteArray();
        } catch (IOException e) {
            LOGGER.error(e.getMessage());
            throw e;
        } finally {
            closeResource(inputStream, swapStream);
        }
        return ary;
    }

    public static void closeResource(Closeable... closeables) {
        for (Closeable closeable : closeables) {
            if (closeable == null) {
                continue;
            }
            try {
                closeable.close();
            } catch (Exception ex) {
                // NOTHING TO DO
            }
        }
    }

    /**
     * 获取请求Body，用于调试查看等。
     *
     * @param request
     * @return
     */
    public static String getBodyString(ServletRequest request) {
        StringBuilder sb = new StringBuilder();
        InputStream inputStream = null;
        BufferedReader reader = null;
        try {
            inputStream = request.getInputStream();
            reader = new BufferedReader(new InputStreamReader(inputStream, StandardCharsets.UTF_8));
            String line = "";
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        } catch (IOException e) {
            LOGGER.error("", e);
        } finally {
            IOUtil.closeResource(inputStream, reader);
        }
        return sb.toString();
    }

    /**
     * 方法提供获取stream，不负责关闭stream。
     * 尝试多种方法获取resource的stream，尤其在springboot模式下的resource文件。
     *
     * @param clazz
     * @param filepath
     * @return
     */
    public static InputStream loadResourceAsStream(Class<?> clazz, String filepath) {

        try {
            InputStream stream = clazz.getResourceAsStream(filepath);
            if (stream != null) {
                LOGGER.info("load stream method1");
                return stream;
            }
        } catch (Exception e) {
            LOGGER.info("{}", e);
        }

        //
        try {
            InputStream stream = clazz.getResourceAsStream("classpath:" + filepath);
            if (stream != null) {
                LOGGER.info("load stream method2");
                return stream;
            }
        } catch (Exception e) {
            LOGGER.info("{}", e);
        }

        //
        try (InputStream stream = new FileInputStream(ResourceUtils.getFile(filepath))) {
            LOGGER.info("load stream method3");
            return stream;
        } catch (Exception e) {
            LOGGER.info("{}", e);
        }

        LOGGER.info("load stream methodx");
        return null;
    }

}
