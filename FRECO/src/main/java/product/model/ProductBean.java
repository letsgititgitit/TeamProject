package product.model;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

public class ProductBean {
	private int PNUM;
	@NotBlank(message = "상품 이름 입력하세요")
	private String PNAME;
	//@NotBlank(message = "재고 입력하세요")
	private int PQTY;
	//@NotNull(message = "가격 입력하세요")
	private int PPRICE;
	private int PPOINT;
	private int PBEST;
	private String PINPUTDATE;
	@NotBlank(message = "카테고리 선택하세요")
	private String PCATEGORY;
	@NotBlank(message = "세부 카테고리 선택하세요")
	private String PSUBCATEGORY;
	private String PIMG1;
	private String PIMG2;
	private String PIMG3;
	private String PIMG4;
	private String PIMG5;
	private String PINFOIMG;
	private String PSUBIMG;
	
	private int ORDERPQTY;
	
	private MultipartFile UPLOAD1;
	private MultipartFile UPLOAD2;
	private MultipartFile UPLOAD3;
	private MultipartFile UPLOAD4;
	private MultipartFile UPLOAD5;
	private MultipartFile INFOUPLOAD;
	private MultipartFile SUBUPLOAD;
	
	private String OLDUPLOAD1;
	private String OLDUPLOAD2;
	private String OLDUPLOAD3;
	private String OLDUPLOAD4;
	private String OLDUPLOAD5;
	private String OLDINFOUPLOAD;
	private String OLDSUBUPLOAD;
	
	
	
	
	public int getORDERPQTY() {
		return ORDERPQTY;
	}
	public void setORDERPQTY(int oRDERPQTY) {
		ORDERPQTY = oRDERPQTY;
	}
	public String getOLDUPLOAD1() {
		return OLDUPLOAD1;
	}
	public void setOLDUPLOAD1(String oLDUPLOAD1) {
		OLDUPLOAD1 = oLDUPLOAD1;
	}
	public String getOLDUPLOAD2() {
		return OLDUPLOAD2;
	}
	public void setOLDUPLOAD2(String oLDUPLOAD2) {
		OLDUPLOAD2 = oLDUPLOAD2;
	}
	public String getOLDUPLOAD3() {
		return OLDUPLOAD3;
	}
	public void setOLDUPLOAD3(String oLDUPLOAD3) {
		OLDUPLOAD3 = oLDUPLOAD3;
	}
	public String getOLDUPLOAD4() {
		return OLDUPLOAD4;
	}
	public void setOLDUPLOAD4(String oLDUPLOAD4) {
		OLDUPLOAD4 = oLDUPLOAD4;
	}
	public String getOLDUPLOAD5() {
		return OLDUPLOAD5;
	}
	public void setOLDUPLOAD5(String oLDUPLOAD5) {
		OLDUPLOAD5 = oLDUPLOAD5;
	}
	public String getOLDINFOUPLOAD() {
		return OLDINFOUPLOAD;
	}
	public void setOLDINFOUPLOAD(String oLDINFOUPLOAD) {
		OLDINFOUPLOAD = oLDINFOUPLOAD;
	}
	public String getOLDSUBUPLOAD() {
		return OLDSUBUPLOAD;
	}
	public void setOLDSUBUPLOAD(String oLDSUBUPLOAD) {
		OLDSUBUPLOAD = oLDSUBUPLOAD;
	}
	public MultipartFile getUPLOAD1() {
		return UPLOAD1;
	}
	public void setUPLOAD1(MultipartFile uPLOAD1) {
		UPLOAD1 = uPLOAD1;		
		PIMG1 = uPLOAD1.getOriginalFilename();
	}
	public MultipartFile getUPLOAD2() {
		return UPLOAD2;
	}
	public void setUPLOAD2(MultipartFile uPLOAD2) {
		UPLOAD2 = uPLOAD2;
		PIMG2 = uPLOAD2.getOriginalFilename();
	}
	public MultipartFile getUPLOAD3() {
		return UPLOAD3;
	}
	public void setUPLOAD3(MultipartFile uPLOAD3) {
		UPLOAD3 = uPLOAD3;
		PIMG3 = uPLOAD3.getOriginalFilename();
	}
	public MultipartFile getUPLOAD4() {
		return UPLOAD4;
	}
	public void setUPLOAD4(MultipartFile uPLOAD4) {
		UPLOAD4 = uPLOAD4;
		PIMG4 = uPLOAD4.getOriginalFilename();
	}
	public MultipartFile getUPLOAD5() {
		return UPLOAD5;
	}
	public void setUPLOAD5(MultipartFile uPLOAD5) {
		UPLOAD5 = uPLOAD5;
		PIMG5 = uPLOAD5.getOriginalFilename();
	}
	public MultipartFile getINFOUPLOAD() {
		return INFOUPLOAD;
	}
	public void setINFOUPLOAD(MultipartFile iNFOUPLOAD) {
		INFOUPLOAD = iNFOUPLOAD;
		PINFOIMG = iNFOUPLOAD.getOriginalFilename();
	}	
	public MultipartFile getSUBUPLOAD() {
		return SUBUPLOAD;
	}
	public void setSUBUPLOAD(MultipartFile sUBUPLOAD) {
		SUBUPLOAD = sUBUPLOAD;
		PSUBIMG = sUBUPLOAD.getOriginalFilename();
	}
	public int getPNUM() {
		return PNUM;
	}
	public void setPNUM(int pNUM) {
		PNUM = pNUM;
	}
	public String getPNAME() {
		return PNAME;
	}
	public void setPNAME(String pNAME) {
		PNAME = pNAME;
	}
	public int getPQTY() {
		return PQTY;
	}
	public void setPQTY(int pQTY) {
		PQTY = pQTY;
	}
	public int getPPRICE() {
		return PPRICE;
	}
	public void setPPRICE(int pPRICE) {
		PPRICE = pPRICE;
	}
	public int getPPOINT() {
		return PPOINT;
	}
	public void setPPOINT(int pPOINT) {
		PPOINT = pPOINT;
	}
	public int getPBEST() {
		return PBEST;
	}
	public void setPBEST(int pBEST) {
		PBEST = pBEST;
	}
	public String getPINPUTDATE() {
		return PINPUTDATE;
	}
	public void setPINPUTDATE(String pINPUTDATE) {
		PINPUTDATE = pINPUTDATE;
	}
	public String getPCATEGORY() {
		return PCATEGORY;
	}
	public void setPCATEGORY(String pCATEGORY) {
		PCATEGORY = pCATEGORY;
	}
	public String getPSUBCATEGORY() {
		return PSUBCATEGORY;
	}
	public void setPSUBCATEGORY(String pSUBCATEGORY) {
		PSUBCATEGORY = pSUBCATEGORY;
	}
	public String getPIMG1() {
		return PIMG1;
	}
	public void setPIMG1(String pIMG1) {
		PIMG1 = pIMG1;
	}
	public String getPIMG2() {
		return PIMG2;
	}
	public void setPIMG2(String pIMG2) {
		PIMG2 = pIMG2;
	}
	public String getPIMG3() {
		return PIMG3;
	}
	public void setPIMG3(String pIMG3) {
		PIMG3 = pIMG3;
	}
	public String getPIMG4() {
		return PIMG4;
	}
	public void setPIMG4(String pIMG4) {
		PIMG4 = pIMG4;
	}
	public String getPIMG5() {
		return PIMG5;
	}
	public void setPIMG5(String pIMG5) {
		PIMG5 = pIMG5;
	}
	public String getPINFOIMG() {
		return PINFOIMG;
	}
	public void setPINFOIMG(String pINFOIMG) {
		PINFOIMG = pINFOIMG;
	}
	public String getPSUBIMG() {
		return PSUBIMG;
	}
	public void setPSUBIMG(String pSUBIMG) {
		PSUBIMG = pSUBIMG;
	}
}
