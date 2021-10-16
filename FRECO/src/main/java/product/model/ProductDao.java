package product.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.PagingPcategory;

  
@Component("myProductDao")
public class ProductDao {
	private String namespace="product.model.ProductBean";	
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//카테고리 : list출력
	public int getTotalCountCate(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".getTotalCountCate", map);
			System.out.println("ProductDao-getTotalCountCate(카테고리) cnt : "+ cnt);
		return cnt;
	}
	public List<ProductBean> getProductListCate(PagingPcategory pageInfo, Map<String,String> map){
		List<ProductBean> lists = new ArrayList<ProductBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		lists = sqlSessionTemplate.selectList(namespace+".getProductListCate", map, rowBounds);
			System.out.println("ProductDao-getProductListCate(카테고리)레코드갯수: "+ lists.size());
		return lists;
	}
	
	//세부 카테고리 : list출력
	public int getTotalCountSubCate(Map<String, String> mapSub) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".getTotalCountSubCate", mapSub);
			System.out.println("ProductDao-getTotalCountCate(서브) cnt : "+ cnt);
		return cnt;
	}
	public List<ProductBean> getProductListSubCate(PagingPcategory pageInfo, Map<String, String> mapSub) {
		List<ProductBean> lists = new ArrayList<ProductBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		lists = sqlSessionTemplate.selectList(namespace+".getProductListSubCate", mapSub, rowBounds);
			System.out.println("ProductDao-getProductListSubCate(카테고리)레코드갯수: "+ lists.size());
		return lists;
	}
	
	//카테고리별 : best상품순
	public List<ProductBean> getBestItem(String PCATEGORY) {
		List<ProductBean> bestItem = new ArrayList<ProductBean>();
		bestItem = sqlSessionTemplate.selectList(namespace+".getBestItem", PCATEGORY);
			System.out.println("ProductDao-getBestItem(best상품순):"+ bestItem.size());
		return bestItem;
	}
	
	//가격별(카테고리:ALL일 때) : list출력
	public int getTotalCountPrice(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".getTotalCountPrice", map);
			System.out.println("ProductDao-getTotalCountPrice(가격별카테고리ALL) cnt : "+ cnt);
		return cnt;
	}
	public List<ProductBean> getProductListPrice(PagingPcategory pageInfo, Map<String, String> map) {
		List<ProductBean> lists = new ArrayList<ProductBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		lists = sqlSessionTemplate.selectList(namespace+".getProductListPrice", map, rowBounds);
			System.out.println("ProductDao-getProductListPrice(가격별+카테고리ALL)레코드갯수: "+ lists.size());
		return lists;
	}
	
	//가격별(카테고리:세부일 때) : list출력
	public int getTotalCountPriceSub(Map<String, String> mapPriceSub) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".getTotalCountPriceSub", mapPriceSub);
			System.out.println("ProductDao-getTotalCountPriceSub(가격별+세부) cnt : "+ cnt);
		return cnt;
	}
	public List<ProductBean> getProductListPriceSub(PagingPcategory pageInfo, Map<String, String> mapPriceSub) {
		List<ProductBean> lists = new ArrayList<ProductBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		lists = sqlSessionTemplate.selectList(namespace+".getProductListPriceSub", mapPriceSub, rowBounds);
			System.out.println("ProductDao-getProductListPriceSub(가격별+세부)레코드갯수: "+ lists.size());
		return lists;
	}
	
	//<상품디테일 요청>
	public ProductBean getSelectNum(String PNUM) {
		ProductBean pbean = sqlSessionTemplate.selectOne(namespace+".getSelectNum",PNUM);
			System.out.println("ProductDao-getSelectNum 이름:" + pbean.getPNAME());
		return pbean;
	}
	
	//<상품디테일요청 : 해당상품 제외 추천상품 list출력>
	public List<ProductBean> getWithoutPnum(Map<String,String> map) {
		List<ProductBean> withoutPnum = new ArrayList<ProductBean>();
		withoutPnum = sqlSessionTemplate.selectList(namespace+".getWithoutPnum", map);
			System.out.println("ProductDao-getWithoutPnum(상품디테일:해당 상품 제외 추천상품):"+ withoutPnum.size());
		return withoutPnum;
	}
	
/////////관리자 페이지 상품 목록 출력//////////////////////////////////////////////////////////////////////////////
		public List<ProductBean> getAllList() {
			List<ProductBean> lists = sqlSessionTemplate.selectList(namespace+".getAllList");
			return lists;
		}
		
		//관리자 페이지 재고 10개 이하 상품 목록 출력
		public List<ProductBean> checkPqty(){
			List<ProductBean> lists = sqlSessionTemplate.selectList(namespace+".checkPqty");
			return lists;
		}
		
		//관리자 페이지 재고 10개 이하 상품 갯수 출력
		public int getPqtyNum() {
			int cnt = sqlSessionTemplate.selectOne(namespace+".getPqtyNum");
			return cnt;
		}
		
		//관리자 페이지 상품 등록
		public int insertProduct(ProductBean bean) {
			int cnt = sqlSessionTemplate.insert(namespace+".insertProduct",bean);
			return cnt;
		}
		
		//관리자 페이지 상품 삭제 시, 폴더에서 파일 삭제 위해 PNUM으로 상품 정보 가지고 옴
		public ProductBean getOneData(int PNUM) {
			ProductBean bean = sqlSessionTemplate.selectOne(namespace+".getOneData",PNUM);
			return bean;
		}
		
		//관리자 페이지 상품 삭제
		public void deleteData(int PNUM) {
			sqlSessionTemplate.delete(namespace+".deleteData",PNUM);		
		}
		
		//관리자 페이지 상품 수정
		public int updateProduct(ProductBean bean) {
			int cnt = sqlSessionTemplate.update(namespace+".updateProduct",bean);
			return cnt;
		}
		
		//결제 : 해당상품 수량감소
		public int stockDecrease(Integer key, Integer value) {
			ProductBean pbean =  new ProductBean();
			pbean.setPNUM(key);
			pbean.setPQTY(value);
			return sqlSessionTemplate.update(namespace+".stockDecrease", pbean);
		}	
	
	
	
	
	
	
	

		
	
	
	
}


