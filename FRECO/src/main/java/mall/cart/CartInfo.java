package mall.cart;

public class CartInfo {
	private int PNUM;
	private String PNAME;
	private int ORDERPQTY;
	private int PPRICE;
	private int PPOINT;
	private String PSUBCATEGORY;
	private String PIMG1;
	private int AMOUNTPOINT;
	private int AMOUNTPRICE;
	
	
	
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
	public int getPPOINT() {
		return PPOINT;
	}
	public void setPPOINT(int pPOINT) {
		PPOINT = pPOINT;
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
	public int getORDERPQTY() {
		return ORDERPQTY;
	}
	public void setORDERPQTY(int oRDERPQTY) {
		ORDERPQTY = oRDERPQTY;
	}
	public int getPPRICE() {
		return PPRICE;
	}
	public void setPPRICE(int pPRICE) {
		PPRICE = pPRICE;
	}
	public int getAMOUNTPOINT() {
		return AMOUNTPOINT;
	}
	public void setAMOUNTPOINT(int aMOUNTPOINT) {
		AMOUNTPOINT = aMOUNTPOINT;
	}
	public int getAMOUNTPRICE() {
		return AMOUNTPRICE;
	}
	public void setAMOUNTPRICE(int aMOUNTPRICE) {
		AMOUNTPRICE = aMOUNTPRICE;
	}
	
	
}
