package com.fushionbaby.solr.service;

import java.util.List;
import java.util.Map;

/**
 * ��������ӿ�
 * 
 * @author sun tao 2015��7��20��
 */
public interface SearchEngineService {
	/**
	 * ͬ����Ϣ����������[����keyΪ��ǰԪ��Ψһ��ʶ,Ҫ��Ϊidʹ�ã���Ҫ��content�ֶΣ�ֵΪ��ǰ�ڵ�������һЩ�ؼ��֡���]
	 * 
	 * @param engineName
	 * @param conMap
	 */
	public void synEngineDocuments(Map<String, Map<String, String>> conMap);

	/**
	 * ����idɾ�����DOUMENTS[���listΪnull�������ȫ��]
	 * 
	 * @param engineName
	 * @param ids
	 */
	public void clearByIds(List<String> ids);

	/**
	 * ����id��ȡ���DOCUMENTS[���listΪnull�����ȡȫ��]
	 * 
	 * @param ids
	 * @return
	 */
	public Map<String, Map<String, String>> getEngineDocuments(List<String> ids);

	/**
	 * �ؼ�������
	 * 
	 * @param key
	 * @return
	 */
	public Map<String, Map<String, String>> getEngineDocumentsByKeyWord(
			String key);

}
