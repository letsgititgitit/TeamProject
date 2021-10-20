package order.model;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.OrderListPaging;


@Component("myOrderDao")
public class OrderDao {
	private String namespace="order.model.OrderBean";	
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	//송장만들기	
	public int insertData(OrderBean obean) {
		int cnt = sqlSessionTemplate.insert(namespace+".insertData", obean);
			System.out.println("Dao: 송장만들기 cnt: "+ cnt);
		return cnt;
	}
	
	//가장최근 송장가져오기
	public int getMaxOrderOINVOICE() {
		int maxOINVOICE = sqlSessionTemplate.selectOne(namespace+".getMaxOrderOINVOICE");
			System.out.println("Dao: 가장최근 만들어진 송장 cnt:" + maxOINVOICE);
		return maxOINVOICE;
	}
	
	///////////////관리자 차트: 주문수
	public int getCount() {
		int cnt =sqlSessionTemplate.selectOne(namespace+".getCount");
		return cnt;
	}
	
	///////////////관리자 차트:날짜별 주문수
	public int day7cnt() {
		int cnt = sqlSessionTemplate.selectOne(namespace+".day7cnt");
		return cnt;
	}
	public int day6cnt() {
		int cnt = sqlSessionTemplate.selectOne(namespace+".day6cnt");
		return cnt;
	}
	public int day5cnt() {
		int cnt = sqlSessionTemplate.selectOne(namespace+".day5cnt");
		return cnt;
	}
	public int day4cnt() {
		int cnt = sqlSessionTemplate.selectOne(namespace+".day4cnt");
		return cnt;
	}
	public int day3cnt() {
		int cnt = sqlSessionTemplate.selectOne(namespace+".day3cnt");
		return cnt;
	}
	public int day2cnt() {
		int cnt = sqlSessionTemplate.selectOne(namespace+".day2cnt");
		return cnt;
	}
	public int day1cnt() {
		int cnt = sqlSessionTemplate.selectOne(namespace+".day1cnt");
		return cnt;
	}
	//관리자 주문 내역
	public List<OrderBean> getAllList(){
		List<OrderBean> orderlist = sqlSessionTemplate.selectList(namespace+".getAllList");
		return orderlist;
	}
	
	//관리자 환불 신청 출력
	public List<OrderBean> getRefundList(){
		List<OrderBean> refundlist = sqlSessionTemplate.selectList(namespace+".getRefundList");
		return refundlist;
	}
	
	//관리자 오늘 주문수
	public int getOrderBySysdate() {
		int cnt = sqlSessionTemplate.selectOne(namespace+".getOrderBySysdate");
		return cnt;
	}
	
	//관리자 처리 환불수
	public int getRefundCount() {
		int cnt = sqlSessionTemplate.selectOne(namespace+".getRefundCount");
		return cnt;
	}

	//하은: Mypage Order-list: 주문내역출력
	public int getTotalCountOrder(String OMID) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".getTotalCountOrder", OMID);
			System.out.println("OrderDao 주문내역 출력(getTotalCountOrder) cnt : "+ cnt);
		return cnt;
	}
	public List<OrderBean> getOrderList(OrderListPaging pageInfo, String OMID) {
		List<OrderBean> olists = new ArrayList<OrderBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		olists = sqlSessionTemplate.selectList(namespace+".getOrderList", OMID, rowBounds);
		return olists;
	}
	//하은: 송장에 해당하는 o정보
	public OrderBean oneSelect(int OINVOICE) {
		OrderBean obean = new OrderBean();
		obean = sqlSessionTemplate.selectOne(namespace+".oneSelect", OINVOICE);
			System.out.println("OrderDao  해당송장 환불여부: "+ obean.getOREFUND());
		return obean;
	}
	//하은: 반품요청
	public int updateInfo(int OINVOICE) {
		int cnt = sqlSessionTemplate.update(namespace+".updateInfo", OINVOICE);
			System.out.println("OrderDao 해당송장 환불여부 cnt : "+ cnt);
		return cnt;
	}
}
