package com.aladingshop.store.util.constant;

public class Constant {
	/**
	 * 图片上传配置
	 */
	/** 测试环境*/
	//public static final String UPLOAD_IMG_HOST = "192.168.1.49";
	
	/** 线上环境*/
	//public static final String UPLOAD_IMG_HOST = "10.10.100.236";
	
	/** 预发布环境*/
	public static final String UPLOAD_IMG_HOST = "10.10.140.231";

	/** 测试*/
	//public static final String UPLOAD_IMG_USERNAME = "root";
	/** 线上用户名*/
	public static final String UPLOAD_IMG_USERNAME = "ftpuser";

	public static final String UPLOAD_IMG_PASSWORD = "root123db";

	public static final String UPLOAD_IMG_PORT = "21";

	/**
	 * 上传图片返回结果
	 */
	public static final String UPLOAD_SUCCESS = "0";

	public static final String UPLOAD_FAILURE = "1";

	public static final String OPEATION_DB_ERROR = "数据库操作失败";

	public static final String FTP_ERROR = "FTP内部异常";

	public static final String UPLOAD_IMG_EXIST = "上传文件失败，当前文件不存在";

	public static final String UNCODE_NOT_EXIST = "当前商品UNCODE编码不存在";
	
	public static final String PRODUCTCODE_NOT_EXIST = "当前产品编码不存在";

	public static final String PATH_EXIST = "输入的地址不合法，请重新输入。";

	public static final String SUCCESS = "SUCCESS";

	public static final String FAILURE = "FAILURE";
}
