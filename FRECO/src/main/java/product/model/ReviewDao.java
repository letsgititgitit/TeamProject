package product.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.ReviewPaging;

@Component("myReviewDao")
public class ReviewDao {
	private String namespace="product.model.ReviewBean";	
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//이미지없을 때
	public int insertData(ReviewBean rbean) {
		int cnt = sqlSessionTemplate.insert(namespace+".insertData",rbean);
			System.out.println("RDao-insertData cnt:"+cnt);
		return cnt;
	}

	//이미지있을 때
	public int insertDataWithImg(ReviewBean rbean) {
		int cnt = sqlSessionTemplate.insert(namespace+".insertDataWithImg",rbean);
			System.out.println("RDao-insertDataWithImg cnt:"+cnt);
		return cnt;
	}
	//리뷰리스트불러오기 (해당하는 상품것만)
	public int getTotalCount(int PNUM) {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".getTotalCount", PNUM);
			System.out.println("RDao cnt : "+ cnt );
		return cnt;
	}
	public List<ReviewBean> getBoardList(ReviewPaging pageInfo, int PNUM) {
		List<ReviewBean> relists = new ArrayList<ReviewBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit()); 
		relists = sqlSessionTemplate.selectList(namespace+ ".getBoardList", PNUM, rowBounds);
			System.out.println("RDao lists.size():" + relists.size());
		return relists;
	}
	//평점 구하기 위한 사용자 작성 레코드 갯수
	public int getTotalCountRating(Integer PNUM) {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".getTotalCountRating", PNUM);
			System.out.println("RDao 사용자 작성 레코드 갯수 cnt : "+ cnt );
		return cnt;
	}
	
	//관리자 리뷰 리스트 출력
	public List<ReviewBean> getAdminList(){
		List<ReviewBean> rlist = sqlSessionTemplate.selectList(namespace+".getAdminList");
		return rlist;
	}
	
	//관리자 답글대기 개수 출력
	public int replyCount() {
		int cnt = sqlSessionTemplate.selectOne(namespace+".replyCount");
		return cnt;
	}
	
	//관리자 답글대기 리스트 출력
	public List<ReviewBean> getReplyWait(){
		List<ReviewBean> rlist = sqlSessionTemplate.selectList(namespace+".getReplyWait");
		return rlist;
	}
	
	//관리자 답글 쓰기
	public void insertReply(ReviewBean rbean) {
		sqlSessionTemplate.insert(namespace+".insertReply",rbean);
	}
	
	//관리자 답글 상태 변경
	public void updateRREPLY(ReviewBean rbean) {
		sqlSessionTemplate.update(namespace+".updateRREPLY",rbean);
	}
	
	//관리자 답글 보기
	public ReviewBean getReply(int RREF) {
		ReviewBean bean = sqlSessionTemplate.selectOne(namespace+".getReply",RREF);
		return bean;
	}
	
	//관리자 답글 수정 폼
	public ReviewBean getReplyByNum(int RNUM) {
		ReviewBean bean = sqlSessionTemplate.selectOne(namespace+".getReplyByNum",RNUM);
		return bean;
	}
	
	//관리자 답글 수정
	public void updateReply(ReviewBean rbean) {
		sqlSessionTemplate.update(namespace+".updateReply",rbean);
	}
	
	//관리자 답글완료 개수
	public int getAdminCnt() {
		int cnt = sqlSessionTemplate.selectOne(namespace+".getAdminCnt");
		return cnt;
	}
	
	//관리자 답글대기 개수
		public int getAdminWaitCnt() {
			int cnt = sqlSessionTemplate.selectOne(namespace+".getAdminWaitCnt");
			return cnt;
		}
	
}
