package order.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
	//송장에 해당하는 주문 상품-수량 상세보기
	public List<OrderDetailBean> oneSelect(int OINVOICE) {
		List<OrderDetailBean> odblists = new ArrayList<OrderDetailBean>();
		odblists = sqlSessionTemplate.selectList(namespace+".oneSelect", OINVOICE);
			System.out.println("Dao 해당송장 주문된 상품-수량 갯수 : "+ odblists.size());
		return odblists;
	}
	//리뷰작성시 -> 리뷰여부 update하기 
	public int updateWhether(Map<String, Integer> map) {
		int cnt  = sqlSessionTemplate.update(namespace+".updateWhether", map);
			System.out.println("ODDAO 리뷰여부 업데이트 cnt: "+ cnt);
		return cnt;
	}
}
