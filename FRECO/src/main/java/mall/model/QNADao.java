package mall.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("MyQna")
public class QNADao {
	
	String namespace = "mall.QNABean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<QNABean> getQNAList(Paging pageInfo, Map<String, String> map) {
		System.out.println(" ----- getQNAList ---- ");
		
		List<QNABean> lists = new ArrayList<QNABean>();
		
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		
		lists = sqlSessionTemplate.selectList(namespace + ".getQNAList", map, rowBounds);
		System.out.println(" ----- qlists: ---- " + lists);
		
		return lists;
	}

	public int insertQNA(QNABean qna) {
		int cnt = sqlSessionTemplate.insert(namespace + ".insertQNA", qna);
		
		return cnt;
	}

	public QNABean getQNA(int qNUM) {
		QNABean qna = sqlSessionTemplate.selectOne(namespace + ".getQNA", qNUM);
		return qna;
	}

	public int updateQNA(QNABean qna) {
		int cnt = sqlSessionTemplate.update(namespace + ".updateQNA", qna);
		return cnt;
	}

	public int deleteQNA(int qNUM) {
		int cnt = sqlSessionTemplate.delete(namespace + ".deleteQNA", qNUM);
		
		return cnt;
	}

	public int replyQNAUpdate(QNABean qna) {
		int cnt = sqlSessionTemplate.update(namespace + ".replyQNAUpdate", qna);
		return cnt;
	}
	
	public int replyQNAInsert(QNABean qna) {
		int cnt2 = sqlSessionTemplate.insert(namespace + ".replyQNAInsert", qna);
		
		return cnt2;
	}

	public int getTotalCount(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".getTotalCount", map);
		return cnt;
	}

	public int getArticleCount() {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".getArticleCount");
		return cnt;
	}
/*
	public List<QNABean> getArticles(Map<Integer, Integer> map2) {
		List<QNABean> lists = new ArrayList<QNABean>();
		
		lists = sqlSessionTemplate.selectList(namespace + ".getArticles", map2);
		
		return lists;
	}
*/
	
	//관리자 문의 내역 리스트 출력
	public List<QNABean> getAdminQNAList(){
		List<QNABean> qlist = sqlSessionTemplate.selectList(namespace+".getAdminQNAList");
		return qlist;
	}
	
	//관리자 미답변 갯수 출력
	public int getReplyCount() {
		int cnt = sqlSessionTemplate.selectOne(namespace+".getReplyCount");
		return cnt;
	}
	
	//관리자 미답변 리스트 출력
	public List<QNABean> getNoReply(){
		List<QNABean> qlist = sqlSessionTemplate.selectList(namespace+".getNoReply");
		return qlist;
	}
	
	//원글 상태 '답변완료'로 업데이트
	public int originalUpdate(QNABean qna) {
		sqlSessionTemplate.update(namespace+".originalUpdate",qna);
		return 0;
	}
	
	//관리자 답변 리스트 출력
	public QNABean getReplyByQREF(int QREF){
		QNABean qbean= sqlSessionTemplate.selectOne(namespace+".getReplyByQREF",QREF);
		return qbean;
	}
	
	//관리자 답변 수정
	public int getReplyUpdate(QNABean qna) {
		int cnt = sqlSessionTemplate.update(namespace+".getReplyUpdate",qna);
		return cnt;
	}
	
	//관리자 답변완료 갯수 출력
	public int getAdminCnt() {
		int cnt = sqlSessionTemplate.selectOne(namespace+".getAdminCnt");
		return cnt;
	}
	
	//관리자 답변대기 갯수 출력
	public int getAdminReCnt() {
		int cnt = sqlSessionTemplate.selectOne(namespace+".getAdminReCnt");
		return cnt;
	}

}
