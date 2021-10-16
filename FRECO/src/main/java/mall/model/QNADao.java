package mall.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("MyQna")
public class QNADao {
	
	String namespace = "mall.QNABean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<QNABean> getQNAList() {
		System.out.println(" ----- getQNAList ---- ");
		
		List<QNABean> lists = new ArrayList<QNABean>();
		
		lists = sqlSessionTemplate.selectList(namespace + ".getQNAList");
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

}
