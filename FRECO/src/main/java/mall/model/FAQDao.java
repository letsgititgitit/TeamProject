package mall.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("MyFAQDao")
public class FAQDao {
	String namespace = "mall.FAQBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<FAQBean> getFAQList(Paging pageInfo, Map<String, String> map) {
		System.out.println("---- getFAQList ----");
		
		List<FAQBean> lists = new ArrayList<FAQBean>();
		
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		
		lists = sqlSessionTemplate.selectList(namespace + ".getFAQList", map, rowBounds);
		
		return lists;
	}

	public int getTotalCount(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".getTotalCount", map);
		return cnt;
	}

	public int insertFAQ(FAQBean faq) {
		int cnt = sqlSessionTemplate.insert(namespace + ".insertFAQ", faq);
		return cnt;
	}

	public int deleteFAQ(int fNUM) {
		int cnt = sqlSessionTemplate.delete(namespace + ".deleteFAQ", fNUM);
		return 0;
	}

	public FAQBean getFAQ(int fNUM) {
		FAQBean faq = sqlSessionTemplate.selectOne(namespace + ".getFAQ", fNUM);
		return faq;
	}

	public int updateQNA(FAQBean faq) {
		int cnt = sqlSessionTemplate.update(namespace + ".updateQNA", faq);
		return 0;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
