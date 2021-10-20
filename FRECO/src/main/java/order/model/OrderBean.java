package order.model;

public class OrderBean {
	private int OINVOICE;  //송장번호 1001 주문순서(번호)
	private String OMID;   //주문회원아이디
	private String OORDERDATE; //주문 날짜(결제일)
	private int OUSECOUPON; //결제시 사용된 쿠폰(금액)
	private int OUSEPOINT; //결제시 사용된 포인트
	private String OREFUND; //환불여부 (환불안함 NO) (환불요청됨 YES) 
	
	public int getOINVOICE() {
		return OINVOICE;
	}
	public void setOINVOICE(int oINVOICE) {
		OINVOICE = oINVOICE;
	}
	public String getOMID() {
		return OMID;
	}
	public void setOMID(String oMID) {
		OMID = oMID;
	}
	public String getOORDERDATE() {
		return OORDERDATE;
	}
	public void setOORDERDATE(String oORDERDATE) {
		OORDERDATE = oORDERDATE;
	}
	public int getOUSECOUPON() {
		return OUSECOUPON;
	}
	public void setOUSECOUPON(int oUSECOUPON) {
		OUSECOUPON = oUSECOUPON;
	}
	public int getOUSEPOINT() {
		return OUSEPOINT;
	}
	public void setOUSEPOINT(int oUSEPOINT) {
		OUSEPOINT = oUSEPOINT;
	}
	public String getOREFUND() {
		return OREFUND;
	}
	public void setOREFUND(String oREFUND) {
		OREFUND = oREFUND;
	}
}
