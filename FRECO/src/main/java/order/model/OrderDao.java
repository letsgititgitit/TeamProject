package order.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myOrderDao")
public class OrderDao {
	private String namespace="order.model.OrderBean";	
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	//송장만들기	
	public int insertData(String OMID) {
		int cnt = sqlSessionTemplate.insert(namespace+".insertData", OMID);
			System.out.println("Dao: 송장만들기 cnt: "+ cnt);
		return cnt;
	}
	
	//가장최근 송장가져오기
	public int getMaxOrderOINVOICE() {
		int maxOINVOICE = sqlSessionTemplate.selectOne(namespace+".getMaxOrderOINVOICE");
			System.out.println("Dao: 가장최근 만들어진 송장 cnt:" + maxOINVOICE);
		return maxOINVOICE;
	}
	
	
}
