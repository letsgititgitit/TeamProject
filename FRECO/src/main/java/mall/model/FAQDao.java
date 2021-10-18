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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
