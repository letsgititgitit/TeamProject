package admin.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

public class Coupon {
		
	private int CNUM;
	
	@NotBlank(message = "이름 입력하세요")
	private String CNAME;
	private String CIMG;
	private int CPRICE;
	
	@NotBlank(message = "만료일 입력하세요")
	private String CDEADLINE;
	
	private MultipartFile UPLOAD;
	private String UPLOADOLD;
	
	
	
	public String getUPLOADOLD() {
		return UPLOADOLD;
	}


	public void setUPLOADOLD(String uPLOADOLD) {
		UPLOADOLD = uPLOADOLD;
	}


	public MultipartFile getUPLOAD() {
		return UPLOAD;
	}


	public void setUPLOAD(MultipartFile uPLOAD) {
		UPLOAD = uPLOAD;
		
		CIMG = uPLOAD.getOriginalFilename();
	}


	public int getCNUM() {
		return CNUM;
	}


	public void setCNUM(int cNUM) {
		CNUM = cNUM;
	}


	public String getCNAME() {
		return CNAME;
	}


	public void setCNAME(String cNAME) {
		CNAME = cNAME;
	}


	public String getCIMG() {
		return CIMG;
	}


	public void setCIMG(String cIMG) {
		CIMG = cIMG;
	}


	public int getCPRICE() {
		return CPRICE;
	}


	public void setCPRICE(int cPRICE) {
		CPRICE = cPRICE;
	}


	public String getCDEADLINE() {
		return CDEADLINE;
	}


	public void setCDEADLINE(String cDEADLINE) {
		CDEADLINE = cDEADLINE;
	}
	
	
	
}

