package member.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myMemberDao")
public class MemberDao {

	private String namespace = "member.model.MemberBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	// 회원가입
	public int insertMember(MemberBean memberBean) {
		return sqlSessionTemplate.insert(namespace+".insertMember", memberBean);
	}
	// 로그인,비밀번호 찾기
	public MemberBean getData(String MID) {
		MemberBean memberBean = sqlSessionTemplate.selectOne(namespace+".getData", MID); 
		System.out.println("getData memberBean: " + memberBean);
		return memberBean;
	}
	// 아이디 찾기
	public MemberBean searchId(String MPHONE) {
		MemberBean memberBean = sqlSessionTemplate.selectOne(namespace+".searchId", MPHONE); 
		System.out.println("searchId memberBean: " + memberBean);
		return memberBean;
	}
	// 아이디 중복체크
	public int IdDuplicate(String MID) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".IdDuplicate", MID); 
		System.out.println("IdDuplicate cnt: " + cnt);
		return cnt;
	}	

	//하은: 결제요청 -> 사용한 MPOINT만큼 감소 (-)
	public int mpointMinus(String mid, int useMPOINT) {
		MemberBean mbean =  new MemberBean();
		mbean.setMID(mid);
		mbean.setMPOINT(useMPOINT);
		int cnt = sqlSessionTemplate.update(namespace+".mpointMinus", mbean);
			System.out.println("mpointMinus 완료후: " + mbean.getMPOINT());
		return cnt;
		
	}
	//하은: 결제요청 -> 구입한 MPOINT만큼 증가 (+)
	public int mpointPlus(String mid, int totalPaymentPoint) {
		MemberBean mbean =  new MemberBean();
		mbean.setMID(mid);
		mbean.setMPOINT(totalPaymentPoint);
		int cnt = sqlSessionTemplate.update(namespace+".mpointMinus", mbean);
			System.out.println("mpointMinus 완료후: " + mbean.getMPOINT());
		return cnt;
	}	
	
	//예인:관리자 회원 목록 출력
	public List<MemberBean> getAllList() {
		List<MemberBean> memlist = sqlSessionTemplate.selectList(namespace+".getAllList");
		return memlist;
	}
	
	
	
	
	
	
	
}//
