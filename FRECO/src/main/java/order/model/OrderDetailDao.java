package order.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myOrderDetailDao")
public class OrderDetailDao {
	private String namespace="order.model.OrderDetailBean";	
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//송장에 해당하는 주문 상품-수량 
	public int insertData(OrderDetailBean odBean) {
		int cnt = sqlSessionTemplate.insert(namespace+".insertData", odBean);
			System.out.println("Dao 해당송장 주문된 상품-수량넣기 cnt: "+cnt);
		return cnt;
	}
}
