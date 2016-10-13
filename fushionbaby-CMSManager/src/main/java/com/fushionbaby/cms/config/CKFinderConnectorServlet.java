
package com.fushionbaby.cms.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ckfinder.connector.ConnectorServlet;

/**
 * 
 * @author 孟少博
 * @version 2015-06-08
 *
 */
public class CKFinderConnectorServlet extends ConnectorServlet {
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		prepareGetResponse(request, response, false);
		super.doGet(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		prepareGetResponse(request, response, true);
		super.doPost(request, response);
	}
	
	private void prepareGetResponse(final HttpServletRequest request,
			final HttpServletResponse response, final boolean post) throws ServletException {
		String command = request.getParameter("command");
		String type = request.getParameter("type");
		// 初始化时，如果startupPath文件夹不存在，则自动创建startupPath文件夹
		if ("Init".equals(command)){
				String startupPath = request.getParameter("startupPath");// 当前文件夹可指定为模块名
				if (startupPath!=null){
					String[] ss = startupPath.split(":");
					if (ss.length==2){
						String path = ss[0]+ss[1];
						String realPath = request.getSession().getServletContext().getRealPath("/userfiles/" + path);/** 本地上传图片*/
						realPath = Global.getBaseDir()+path;/** 服务器*/
						System.out.println("realPath:"+realPath);
						FileUtils.createDirectory(realPath);
					}
				}
		}
		// 快捷上传，自动创建当前文件夹，并上传到该路径
		else if ("QuickUpload".equals(command) && type!=null){
			
				String currentFolder = request.getParameter("currentFolder");// 当前文件夹可指定为模块名
				String path = type+(currentFolder!=null?currentFolder:"");
				String realPath = request.getSession().getServletContext().getRealPath("/userfiles/"+path);/** 本地上传图片*/
				realPath = Global.getBaseDir()+path;/** 服务器*/
				System.out.println("realPath:" +realPath);
				FileUtils.createDirectory(realPath);
		}
		System.out.println("------------------------");
		for (Object key : request.getParameterMap().keySet()){
			System.out.println(key + ": " + request.getParameter(key.toString()));
		}
	}
	
}
