package mall.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("MyFAQDao")
public class FAQDao {
	String namespace = "mall.FAQBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<FAQBean> getFAQList() {
		System.out.println("---- getFAQList ----");
		
		List<FAQBean> lists = new ArrayList<FAQBean>();
		
		lists = sqlSessionTemplate.selectList(namespace + ".getFAQList");
		
		return lists;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
