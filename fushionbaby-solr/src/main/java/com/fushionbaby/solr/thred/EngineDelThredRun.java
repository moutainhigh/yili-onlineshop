/**
 * 
 */
package com.fushionbaby.solr.thred;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.solr.client.solrj.impl.HttpSolrServer;

/**
 * @description ��������ɾ������
 * @author ����
 * @date 2015��7��20������1:13:43
 */
@SuppressWarnings("deprecation")
public class EngineDelThredRun extends BaseThredRun implements Runnable {
	private static final Log logger = LogFactory
			.getLog(EngineDelThredRun.class);

	private List<String> ids;

	public EngineDelThredRun(List<String> list) {
		this.ids = list;
	}

	public void run() {
		/**
		 * ɾ��DOCUMENT����
		 */
		HttpSolrServer server = getServer();

		try {
			if (ids == null)
				server.deleteByQuery("*:*"); // �������Ϊnullɾȫ��
			else
				server.deleteById(ids);

			server.commit();
		} catch (Exception e) {
			logger.error("ͬ����Ϣ�����������쳣��" + e);
			try {
				server.rollback();
			} catch (Exception e1) {
				logger.error("��������ع�ɾ�������쳣��" + e1);
			}
			return;
		} finally {
			server.shutdown();
		}

	}

}
