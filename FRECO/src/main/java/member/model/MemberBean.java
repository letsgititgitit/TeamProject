package member.model;

import javax.validation.constraints.Future;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class MemberBean {
	
	
	private String MID;
	
	private int MNUM;
	
	
	private String MPW;
	
	
	private String MNAME;
	

	private String MBIRTH;
	

	private String MPHONE;
	
	private String MADDRESS1;
	private String MADDRESS2;
	

	private String MADDRESS3;
	
	private int MCOUPON;
	private int MPOINT;
	
	public MemberBean() {
		super();
	}
	
	

	public MemberBean(String mID, int mNUM, String mPW, String mNAME, String mBIRTH, String mPHONE, String mADDRESS1,
			String mADDRESS2, String mADDRESS3, int mCOUPON, int mPOINT) {
		super();
		MID = mID;
		MNUM = mNUM;
		MPW = mPW;
		MNAME = mNAME;
		MBIRTH = mBIRTH;
		MPHONE = mPHONE;
		MADDRESS1 = mADDRESS1;
		MADDRESS2 = mADDRESS2;
		MADDRESS3 = mADDRESS3;
		MCOUPON = mCOUPON;
		MPOINT = mPOINT;
	}
	public String getMID() {
		return MID;
	}
	public void setMID(String mID) {
		MID = mID;
	}
	public int getMNUM() {
		return MNUM;
	}
	public void setMNUM(int mNUM) {
		MNUM = mNUM;
	}
	public String getMPW() {
		return MPW;
	}
	public void setMPW(String mPW) {
		MPW = mPW;
	}
	public String getMNAME() {
		return MNAME;
	}
	public void setMNAME(String mNAME) {
		MNAME = mNAME;
	}
	public String getMBIRTH() {
		return MBIRTH;
	}
	public void setMBIRTH(String mBIRTH) {
		MBIRTH = mBIRTH;
	}
	public String getMPHONE() {
		return MPHONE;
	}
	public void setMPHONE(String mPHONE) {
		MPHONE = mPHONE;
	}
	public String getMADDRESS1() {
		return MADDRESS1;
	}
	public void setMADDRESS1(String mADDRESS1) {
		MADDRESS1 = mADDRESS1;
	}
	public String getMADDRESS2() {
		return MADDRESS2;
	}
	public void setMADDRESS2(String mADDRESS2) {
		MADDRESS2 = mADDRESS2;
	}
	public String getMADDRESS3() {
		return MADDRESS3;
	}
	public void setMADDRESS3(String mADDRESS3) {
		MADDRESS3 = mADDRESS3;
	}
	public int getMCOUPON() {
		return MCOUPON;
	}
	public void setMCOUPON(int mCOUPON) {
		MCOUPON = mCOUPON;
	}
	public int getMPOINT() {
		return MPOINT;
	}
	public void setMPOINT(int mPOINT) {
		MPOINT = mPOINT;
	}
	
	
	
}