/**
 * 
 */
package com.fushionbaby.solr.thred;

import org.apache.solr.client.solrj.impl.HttpSolrServer;
import com.fushionbaby.solr.util.PropertiesUitls;

/**
 * @description ���������������
 * @author ����
 * @date 2015��7��20������1:28:38
 */
@SuppressWarnings("deprecation")
public class BaseThredRun {

	private static String url = "http://%s:%s/%s";

	protected HttpSolrServer getServer() {
		return new HttpSolrServer(String.format(url,
				PropertiesUitls.getValByKey("ip"),
				PropertiesUitls.getValByKey("port"),
				PropertiesUitls.getValByKey("name")));
	}
}
