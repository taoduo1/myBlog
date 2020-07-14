package com.td.myblog.myblog.common.utils;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;

/**
 * <pre>
 *  示例：
 *
 * 	public static void main(String[] args) throws IOException {
 * 		// 压缩文件
 * 		zipFiles("d:/压缩.zip", "abc", new File("d:/logs"), new File("d:/snap007.jpg"), new File("d:/snap008.jpg"));
 * 		// 解压文件
 * 		unZipFiles("d:/压缩.zip", "d:/unzipfile/");
 *    }
 *
 * // ------------------------------------------------------------------------
 * //	public static void main(String[] args) throws IOException {
 * //		// 压缩文件
 * //		zipFiles("d:/压缩.zip", "abc", new File("d:/English"), new File("d:/发放数据.xls"), new File("d:/中文名称.xls") );
 * //		// 解压文件
 * //		unZipFiles("d:/压缩.zip", "d:/zipfile/");
 * //	}
 *
 * 测试方法并没有对异常做任何处理，这是不对的，请不要模仿。
 *
 * 输出结果：
 *
 * abc/English/templete.xls
 * abc/English/中文/csdn/isea/533/abc/templete.xls
 * abc/English/中文/csdn/isea/533/abc/zipfile2/templete.xls
 * abc/English/中文/csdn/isea/533/abc/zipfile2/zipfile/abc/templete.xls
 * abc/English/中文/csdn/isea/533/abc/zipfile2/zipfile/abc/zipfile2/templete.xls
 * abc/English/中文/csdn/isea/533/abc/zipfile2/zipfile/abc/zipfile2/领卡清单.xls
 * abc/English/中文/csdn/isea/533/abc/zipfile2/领卡清单.xls
 * abc/English/中文/csdn/isea/templete.xls
 * abc/English/中文/csdn/isea/领卡清单.xls
 * abc/English/中文/csdn/templete.xls
 * abc/English/领卡清单.xls
 * abc/发放数据.xls
 * abc/中文名称.xls
 * 压缩完毕
 *
 * d:/zipfile/abc/中文名称.xls
 * d:/zipfile/abc/发放数据.xls
 * d:/zipfile/abc/English/领卡清单.xls
 * d:/zipfile/abc/English/中文/csdn/templete.xls
 * d:/zipfile/abc/English/中文/csdn/isea/领卡清单.xls
 * d:/zipfile/abc/English/中文/csdn/isea/templete.xls
 * d:/zipfile/abc/English/中文/csdn/isea/533/abc/templete.xls
 * d:/zipfile/abc/English/templete.xls
 * d:/zipfile/abc/English/中文/csdn/isea/533/abc/zipfile2/templete.xls
 * d:/zipfile/abc/English/中文/csdn/isea/533/abc/zipfile2/zipfile/abc/templete.xls
 * d:/zipfile/abc/English/中文/csdn/isea/533/abc/zipfile2/zipfile/abc/zipfile2/templete.xls
 * d:/zipfile/abc/English/中文/csdn/isea/533/abc/zipfile2/zipfile/abc/zipfile2/领卡清单.xls
 * d:/zipfile/abc/English/中文/csdn/isea/533/abc/zipfile2/领卡清单.xls
 * 解压完毕
 * </pre>
 */
public class ZipFileUtil {

    private static final Logger LOGGER = LoggerFactory.getLogger(ZipFileUtil.class);

    private ZipFileUtil() {
    }

    /**
     * 压缩文件-由于out要在递归调用外,所以封装一个方法用来
     * 调用ZipFiles(ZipOutputStream out,String path,File... srcFiles)
     *
     * @param
     * @param path
     * @param srcFiles
     * @throws IOException
     * @author isea533
     */
    public static void zipFiles(String zipFileName, String path, File... srcFiles) throws IOException {
        zipFiles(new File(zipFileName), path, srcFiles);
    }

    public static void zipFiles(File zipFile, String path, File... srcFiles) throws IOException {
        if (!zipFile.getParentFile().exists()) zipFile.getParentFile().mkdirs();
        try (ZipOutputStream zos = new ZipOutputStream(new FileOutputStream(zipFile))) {
            zos.setLevel(9); // 0-9
            zipFiles(zos, path, srcFiles);
        } catch (Exception e) {
            LOGGER.error("", e);
        }
        LOGGER.info("压缩完毕");
    }

    public static void zipFiles(String zipFileName, FilesToPath... filesToPaths) throws IOException {
        zipFiles(zipFileName, Arrays.asList(filesToPaths));
    }

    public static void zipFiles(String zipFileName, List<FilesToPath> filesToPaths) throws IOException {
        File zipFile = new File(zipFileName);
        if (!zipFile.getParentFile().exists()) zipFile.getParentFile().mkdirs();
        try (ZipOutputStream zos = new ZipOutputStream(new FileOutputStream(zipFile))) {
            zos.setLevel(9); // 0-9
            for (FilesToPath filesToPath : filesToPaths) {
                zipFiles(zos, filesToPath.path, filesToPath.files.toArray(new File[filesToPath.files.size()]));
                LOGGER.info("压缩完毕 {}", filesToPath.getPath());
            }
        } catch (Exception e) {
            LOGGER.error("", e);
        }
        LOGGER.info("压缩完毕");
    }

    /**
     * 压缩文件-File
     *
     * @param zos      zip文件
     * @param srcFiles 被压缩源文件
     * @author isea533
     */
    private static void zipFiles(ZipOutputStream zos, String path, File... srcFiles) {
        path = path.replaceAll("\\*", "/");
        if (!path.endsWith("/")) path += "/";
        try {
            for (File file : srcFiles) {
                if (file.isDirectory()) {
                    File[] files = file.listFiles();
                    String srcPath = file.getName();
                    srcPath = srcPath.replaceAll("\\*", "/");
                    if (!srcPath.endsWith("/")) srcPath += "/";
                    zos.putNextEntry(new ZipEntry(path + srcPath));
                    zipFiles(zos, path + srcPath, files);
                } else {
                    LOGGER.info("{}{}", path, file.getName());
                    if (!file.exists()) FileUtils.write(file, "空文件，无内容！", "UTF-8");
                    try (FileInputStream fis = new FileInputStream(file)) {
                        zos.putNextEntry(new ZipEntry(path + file.getName()));
                        IOUtil.inputStreamToOutputStreamWithoutClose(fis, zos);
                        zos.closeEntry();
                    }
                }
            }
        } catch (Exception e) {
            LOGGER.error("", e);
        }
    }

    // ------------------------------------------------------------------------

    /**
     * 解压到指定目录
     *
     * @param zipPath
     * @param descDir
     * @author isea533
     */
    public static void unZipFiles(String zipFilePath, String destDir) throws IOException {
        unZipFiles(new File(zipFilePath), destDir);
    }

    /**
     * 解压文件到指定目录
     *
     * @param zipFile
     * @param descDir
     * @author isea533
     */
    public static void unZipFiles(File zipFile, String destDir) throws IOException {
        File pathFile = new File(destDir);
        if (!pathFile.exists()) pathFile.mkdirs();
        ZipFile zip = new ZipFile(zipFile);
        try {
            for (Enumeration<? extends ZipEntry> entries = zip.entries(); entries.hasMoreElements(); ) {
                ZipEntry entry = entries.nextElement();
                String zipEntryName = entry.getName();
                InputStream in = zip.getInputStream(entry);
                String outPath = (destDir + zipEntryName).replaceAll("\\*", "/");
                //判断路径是否存在,不存在则创建文件路径
                File file = new File(outPath.substring(0, outPath.lastIndexOf('/')));
                if (!file.exists()) file.mkdirs();
                //判断文件全路径是否为文件夹,如果是上面已经上传,不需要解压
                if (new File(outPath).isDirectory()) continue;
                //输出文件路径信息
                LOGGER.info(outPath);
                OutputStream out = new FileOutputStream(outPath);
                IOUtil.inputStreamToOutputStream(in, out);
            }
            LOGGER.info("解压完毕");
        } catch (Exception e) {
            LOGGER.error("", e);
        } finally {
            IOUtil.closeResource(zip);
        }
    }

    public static class FilesToPath {
        String path;
        List<File> files;

        public FilesToPath() {
            this.path = null;
            this.files = new ArrayList<>();
        }

        public FilesToPath(String path, List<File> files) {
            this.path = path;
            this.files = files;
        }

        public FilesToPath(String path, File... files) {
            this.path = path;
            this.files = Arrays.asList(files);
        }

        public String getPath() {
            return path;
        }

        public void setPath(String path) {
            this.path = path;
        }

        public List<File> getFiles() {
            return files;
        }

        public void setFiles(List<File> files) {
            this.files = files;
        }

    }
}
