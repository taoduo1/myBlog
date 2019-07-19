package com.td.myblog.myblog.common.utils;

import java.io.File;
import java.io.IOException;
import java.net.JarURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * java类工具。
 * 用法： List<Class<?>> list = findClasses("com.bxsurvey.sys.process.controller");
 */
public class ClassUtil {

	private static final Logger LOGGER = LoggerFactory.getLogger(ClassUtil.class);

	private static final String _CLASS = ".class";

	private static final String PROTOCOL_JAR = "jar";

	private static final String PROTOCOL_FILE = "file";

	/**
	 * 从包package中获取所有的Class
	 * @param packageName
	 * @return
	 */
	public static List<Class<?>> findClasses(String packageName) {
		//第一个class类的集合
		List<Class<?>> classes = new ArrayList<>();
		//是否循环迭代
		boolean recursive = true;
		//获取包的名字 并进行替换
		String packageDirName = packageName.replace('.', '/');

		try {
			Enumeration<URL> dirs = Thread.currentThread().getContextClassLoader().getResources(packageDirName);//定义一个枚举的集合 并进行循环来处理这个目录下的things
			while (dirs.hasMoreElements()) {//循环迭代下去
				URL url = dirs.nextElement();//获取下一个元素
				String protocol = url.getProtocol();//得到协议的名称
				if (PROTOCOL_FILE.equals(protocol)) {//如果是以文件的形式保存在服务器上
					findAndAddClassesInPackageByFile(packageName, URLDecoder.decode(url.getFile(), "UTF-8"), recursive, classes);//以文件的方式扫描整个包下的文件 并添加到集合中
				} else if (PROTOCOL_JAR.equals(protocol)) { //如果是jar包文件   定义一个JarFile  
					findAndAddClassesInPackageByJar(packageName, url, recursive, packageDirName, classes);
				} else {
					// NOTHONG TO DO
				}
			}
		} catch (IOException e) {
			LOGGER.error("", e);
		}
		return classes;
	}

	private static void findAndAddClassesInPackageByJar(String packageName, URL url, final boolean recursive, String packageDirName, List<Class<?>> classes) {
		try {
			JarFile jar = ((JarURLConnection) url.openConnection()).getJarFile();//获取jar
			Enumeration<JarEntry> entries = jar.entries();//从此jar包 得到一个枚举类
			while (entries.hasMoreElements()) {//同样的进行循环迭代
				JarEntry entry = entries.nextElement();//获取jar里的一个实体 可以是目录 和一些jar包里的其他文件 如META-INF等文件
				String name = entry.getName();
				if (name.charAt(0) == '/') name = name.substring(1);   //如果是以/开头的，获取后面的字符串
				if (!name.startsWith(packageDirName)) continue;//如果前半部分和定义的包名不相同

				int idx = name.lastIndexOf('/');
				if (idx != -1) {//如果以"/"结尾 是一个包
					packageName = name.substring(0, idx).replace('/', '.');//获取包名 把"/"替换成"."
				}
				if ((idx != -1 || recursive) && name.endsWith(_CLASS) && !entry.isDirectory()) { //如果可以迭代下去 并且是一个包 //如果是一个.class文件 而且不是目录
					String className = name.substring(packageName.length() + 1, name.length() - 6);//去掉后面的".class" 获取真正的类名
					try {
						classes.add(Class.forName(packageName + '.' + className));//添加到classes
					} catch (ClassNotFoundException e) {
						LOGGER.error("", e);
					}
				}
			}
		} catch (

		IOException e) {
			LOGGER.error("", e);
		}
	}

	/**
	 * 以文件的形式来获取包下的所有Class
	 * @param packageName
	 * @param packagePath
	 * @param recursive
	 * @param classes
	 */
	private static void findAndAddClassesInPackageByFile(String packageName, String packagePath, final boolean recursive, List<Class<?>> classes) {
		//获取此包的目录 建立一个File
		File dir = new File(packagePath);
		//如果不存在或者 也不是目录就直接返回
		if (!dir.exists() || !dir.isDirectory()) { return; }
		//如果存在 就获取包下的所有文件 包括目录
		File[] dirfiles = dir.listFiles(file -> (recursive && file.isDirectory()) || (file.getName().endsWith(_CLASS)));
		if (dirfiles == null) return;
		for (File file : dirfiles) {//循环所有文件
			if (file.isDirectory()) {//如果是目录 则继续扫描
				findAndAddClassesInPackageByFile(packageName + "." + file.getName(), file.getAbsolutePath(), recursive, classes);
			} else {
				String className = file.getName().substring(0, file.getName().length() - 6);//如果是java类文件 去掉后面的.class 只留下类名
				try {
					classes.add(Class.forName(packageName + '.' + className));//添加到集合中去
				} catch (ClassNotFoundException e) {
					LOGGER.error("", e);
				}
			}
		}
	}

}
