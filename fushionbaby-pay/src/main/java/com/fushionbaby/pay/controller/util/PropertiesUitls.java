package com.fushionbaby.pay.controller.util;


import java.io.IOException;
import java.io.InputStream;

import java.util.Properties;


/**
 * Properties文件帮助类
 * @author admin
 * @version 1.0
 */
public class PropertiesUitls {
	
	private static Properties props = null;
	
	static{		
		if(props ==null){
			InputStream is = PropertiesUitls.class.getResourceAsStream("/config.properties");
			props = new Properties();
			try {
				props.load(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 读取configProperties
	 */
	public static Properties getProperties() {
		return props;
	}
}
