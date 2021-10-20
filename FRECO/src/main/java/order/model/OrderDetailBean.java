package order.model;

public class OrderDetailBean {
	private int ODNUM;  //순번
	private int ODOINVOICE; //송장번호 1001 주문순서(번호)
	private int ODPNUM;  //해당 상품 num
	private int ODQTY;	 //해당 상품 주문수량 
	private String ODREVIEW; //해당 상품 리뷰여부 (미작성: NO) (작성 완료: YES) 
	
	public int getODNUM() {
		return ODNUM;
	}
	public void setODNUM(int oDNUM) {
		ODNUM = oDNUM;
	}
	public int getODOINVOICE() {
		return ODOINVOICE;
	}
	public void setODOINVOICE(int oDOINVOICE) {
		ODOINVOICE = oDOINVOICE;
	}
	public int getODPNUM() {
		return ODPNUM;
	}
	public void setODPNUM(int oDPNUM) {
		ODPNUM = oDPNUM;
	}
	public int getODQTY() {
		return ODQTY;
	}
	public void setODQTY(int oDQTY) {
		ODQTY = oDQTY;
	}
	public String getODREVIEW() {
		return ODREVIEW;
	}
	public void setODREVIEW(String oDREVIEW) {
		ODREVIEW = oDREVIEW;
	}
	
	
}
