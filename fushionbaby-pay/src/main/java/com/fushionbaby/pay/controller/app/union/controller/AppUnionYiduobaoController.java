package com.fushionbaby.pay.controller.app.union.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fushionbaby.common.util.jsonp.Jsonp;
import com.fushionbaby.pay.controller.app.union.service.AppUnionYiduobaoService;
/***
 * 阿拉丁卡 订单使用  银联支付
 * @description 类描述...
 * @author 徐培峻
 * @date 2015年10月30日下午4:23:05
 */
@Controller
@RequestMapping("/appUnionYiduobao")
public class AppUnionYiduobaoController {
	
	private static final Log LOGGER = LogFactory.getLog(AppUnionYiduobaoController.class);
	
	@Autowired
	private AppUnionYiduobaoService appUnionYiduobaoService;
	
	/**
	 * 获取APP银联支付交易tn号
	 * @param YiduobaoSid
	 * @param orderCode
	 * @param sourceCode
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getYiduobaoUnionTn")
	public Object getPrepayIdStr(HttpServletRequest request,
			@RequestParam(value="data",defaultValue="")String data,
			@RequestParam(value="mac",defaultValue="")String mac)  {
		try {
			return appUnionYiduobaoService.getYiduobaoUnionTn(request, data, mac); 
		} catch (Exception e) {
			e.printStackTrace();
			LOGGER.error("APP银联阿拉丁卡获取tn号出错", e);
			return Jsonp.error("获取tn号出错");
		}	
	}
	
	/**
	 * 阿拉丁卡APP微信后台异步通知
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/yiduobaoUnionNotify")
	public void notifyYiduobaoAppWx(HttpServletRequest request, HttpServletResponse response)  {
		try {
			appUnionYiduobaoService.YiduobaoUnionNotify(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			LOGGER.error("阿拉丁卡APP银联回调出错", e);
		}
	}
	
}
