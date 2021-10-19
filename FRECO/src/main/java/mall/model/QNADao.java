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
}
