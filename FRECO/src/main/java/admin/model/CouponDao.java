package admin.model;



import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CouponDao {

	private String namespace="coupon.CouponBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int insertCoupon(Coupon coupon) {
		int cnt = sqlSessionTemplate.insert(namespace+".insertCoupon",coupon);
		return cnt;
	}
	
	public List<Coupon> getList() {
		List<Coupon> lists = sqlSessionTemplate.selectList(namespace+".getList");
		return lists;
	}
	
	public Coupon oneData(int CNUM) {
		Coupon bean = sqlSessionTemplate.selectOne(namespace+".oneData",CNUM);
		return bean;
	}
	
	public int updateData(Coupon coupon) {
		int cnt = sqlSessionTemplate.update(namespace+".updateData",coupon);
		return cnt;
	}
	
	public void deleteData(int CNUM) {
		sqlSessionTemplate.delete(namespace+".deleteData",CNUM);
		return;
	}
	
	public void insertMemberByCoupon() {
		sqlSessionTemplate.update(namespace+".insertMemberByCoupon");	
	}
		
}
