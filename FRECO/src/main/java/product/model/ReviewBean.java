package product.model;

import org.springframework.web.multipart.MultipartFile;

public class ReviewBean {
	private int RNUM; //번호
	private String RID; //작성자아이디 (MEMBER MID)
	private String RPW; //리뷰글 설정 비번
	private String RCONTENT; //리뷰내용
	private int RINVOICE; //해당송장
	private int RSUBJECT; //리뷰할 상품 (PRODUCT PNUM)
	private int RRATING; //평점
	private String RIMG; //리뷰사진
	private int RREF;
	private int RRESTEP;
	private int RRELEVEL;
	private String RREPLY; //답글여부
	//file 담을수 있는 file////////////////////////////////////////////////
	private MultipartFile uploadRIMG;

	private String uploadold; //삭제할 이미지의 "글자"가 넘어온다
	
	public void setUploadRIMG(MultipartFile uploadRIMG) {
			System.out.println("setUploadRIMG uploadRIMG:"+uploadRIMG);
		this.uploadRIMG = uploadRIMG;
			System.out.println("uploadRIMG.getName(): "+uploadRIMG.getName()); 
			System.out.println("uploadRIMG.getOriginalFilename(): "+uploadRIMG.getOriginalFilename()); 
		this.RIMG = uploadRIMG.getOriginalFilename();	
		System.out.println("RIMG : "+ RIMG); 
		System.out.println(RIMG == null); //이렇게하면 안나옴(not null안됨)
		System.out.println(RIMG.equals(""));
	}
	
	public MultipartFile getUploadRIMG() {
		return uploadRIMG;
	}

	public String getUploadold() {
		return uploadold;
	}
	public void setUploadold(String uploadold) {
		this.uploadold = uploadold;
	}
	////////////////////////////////////////////////////////////////////////

	public int getRNUM() {
		return RNUM;
	}
	public void setRNUM(int rNUM) {
		RNUM = rNUM;
	}
	public String getRID() {
		return RID;
	}
	public void setRID(String rID) {
		RID = rID;
	}
	public String getRPW() {
		return RPW;
	}
	public void setRPW(String rPW) {
		RPW = rPW;
	}
	public String getRCONTENT() {
		return RCONTENT;
	}
	public void setRCONTENT(String rCONTENT) {
		RCONTENT = rCONTENT;
	}
	public int getRINVOICE() {
		return RINVOICE;
	}
	public void setRINVOICE(int rINVOICE) {
		RINVOICE = rINVOICE;
	}
	public int getRSUBJECT() {
		return RSUBJECT;
	}
	public void setRSUBJECT(int rSUBJECT) {
		RSUBJECT = rSUBJECT;
	}
	public int getRRATING() {
		return RRATING;
	}
	public void setRRATING(int rRATING) {
		RRATING = rRATING;
	}
	public String getRIMG() {
		return RIMG;
	}
	public void setRIMG(String rIMG) {
		RIMG = rIMG;
	}

	public int getRREF() {
		return RREF;
	}
	public void setRREF(int rREF) {
		RREF = rREF;
	}
	public int getRRESTEP() {
		return RRESTEP;
	}
	public void setRRESTEP(int rRESTEP) {
		RRESTEP = rRESTEP;
	}
	public int getRRELEVEL() {
		return RRELEVEL;
	}
	public void setRRELEVEL(int rRELEVEL) {
		RRELEVEL = rRELEVEL;
	}
	public String getRREPLY() {
		return RREPLY;
	}
	public void setRREPLY(String rREPLY) {
		RREPLY = rREPLY;
	}
}
