package mall.model;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

public class FAQBean {
	private int FNUM;
	
	@NotEmpty(message = "카테고리를 선택하세요.")
	private String FCATEGORY;
	
	@NotBlank(message = "제목을 입력하세요.")
	private String FSUBJECT;
	
	@NotBlank(message = "내용을 입력하세요.")
	private String FCONTENT;	
	
	public int getFNUM() {
		return FNUM;
	}
	public void setFNUM(int fNUM) {
		FNUM = fNUM;
	}
	public String getFCATEGORY() {
		return FCATEGORY;
	}
	public void setFCATEGORY(String fCATEGORY) {
		FCATEGORY = fCATEGORY;
	}
	public String getFSUBJECT() {
		return FSUBJECT;
	}
	public void setFSUBJECT(String fSUBJECT) {
		FSUBJECT = fSUBJECT;
	}
	public String getFCONTENT() {
		return FCONTENT;
	}
	public void setFCONTENT(String fCONTENT) {
		FCONTENT = fCONTENT;
	}
	
	
}





