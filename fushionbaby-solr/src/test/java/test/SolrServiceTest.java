package test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.client.solrj.response.UpdateResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;



public class SolrServiceTest {
	  private static final String DEFAULT_URL = "http://localhost:80801/solr/";
	public  void addFiled() throws SolrServerException, IOException{
		HttpSolrServer solrServer  = new HttpSolrServer(DEFAULT_URL);
		SolrInputDocument doc1 = new SolrInputDocument(); 
		doc1.addField("id", "001");
		doc1.addField("title", "�Ϻ�һ������Ƽ�");
		doc1.addField("IKType", "�����̳ǣ�������");
		doc1.addField("role", "��Ŀ����");
		doc1.addField("account", "��ϰ��");
		SolrInputDocument doc2 = new SolrInputDocument();
		doc2.addField("id", "002");
		doc2.addField("title", "��������");
		doc2.addField("IKType", "���ز����Ͼ���·���������У���ͱ����꣬��һ�ҳ���");
		doc1.addField("role", "�ܾ���");
		doc1.addField("account", "�Ľ������");
		
		List<SolrInputDocument> docs = 	new ArrayList<SolrInputDocument>(); 
		docs.add(doc2);
		docs.add(doc1);
		solrServer.add(docs);
		solrServer.commit();
		
	}
	
	
	public void deleteIndex() throws SolrServerException, IOException{
		
		HttpSolrServer server = new HttpSolrServer(DEFAULT_URL);
		String q = "title:\"�Ϻ�\"";
		UpdateResponse res = server.deleteByQuery(q);
		System.out.println(res.getStatus());
		server.commit(true, true);
		//����ʹ��server.deleteById(String id);�Լ�deleteById(List<String> ids);

 

	}
	
	
	public void find() throws SolrServerException, IOException{
		HttpSolrServer server = new HttpSolrServer(DEFAULT_URL);
		
		SolrQuery query = new SolrQuery("�Ϻ�");
		QueryResponse response = server.query(query);
		//�ĵ���ʽ��ȡ��ʵ����Ŀ�����ҵ��Ƚϸ��ӣ��������ַ�ʽ�ԵñȽ����
		SolrDocumentList docs = response.getResults(); 
		System.out.println("�ĵ�������" + docs.getNumFound()); 
		System.out.println("��ѯʱ�䣺" + response.getQTime()); 
		for (SolrDocument doc : docs) { 
			System.out.println("id: " + doc.getFieldValue("id")); 
			System.out.println("title: " + doc.getFieldValue("title")); 
			System.out.println(); 
		}  
		//������Ĳ�ѯ�л�����ͨ��javabean�ķ�ʽ����ȡ��ѯ�����
		//List<Item> beans = response.getBeans(Item.class)
		//����bean����Item�ж����ֶ���solr�ĵ��е��ֶ�һһ��Ӧ����Ӧ����multValued����Ϊtrue���ֶ����ͣ���Ҫ����Ϊlist��ʽ������response.getBeans(Item.class)
		//������ȷ������ݡ�
		
	}
}
