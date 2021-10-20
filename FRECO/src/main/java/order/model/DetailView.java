package order.model;

public class DetailView {
	private int dvnum;   	//번호순
	private String dvpimg;   //주문 상품이미지
	private String dvpname;   //주문 상품명
	private String dvpsubcategory;   //상품 세부카테고리
	private int dvpprice;   //상품 단가
	private int dvppoint;   //상품별 포인트
	private int dvoqty;   //주문 수량
	private String dvodreview;   //상품 리뷰작성여부
	private int dvpnum; //주문 상품번호
	
	public int getDvpnum() {
		return dvpnum;
	}
	public void setDvpnum(int dvpnum) {
		this.dvpnum = dvpnum;
	}
	public int getDvnum() {
		return dvnum;
	}
	public void setDvnum(int dvnum) {
		this.dvnum = dvnum;
	}
	public String getDvpsubcategory() {
		return dvpsubcategory;
	}
	public void setDvpsubcategory(String dvpsubcategory) {
		this.dvpsubcategory = dvpsubcategory;
	}
	public int getDvppoint() {
		return dvppoint;
	}
	public void setDvppoint(int dvppoint) {
		this.dvppoint = dvppoint;
	}
	public String getDvpimg() {
		return dvpimg;
	}
	public void setDvpimg(String dvpimg) {
		this.dvpimg = dvpimg;
	}
	public String getDvpname() {
		return dvpname;
	}
	public void setDvpname(String dvpname) {
		this.dvpname = dvpname;
	}
	public int getDvpprice() {
		return dvpprice;
	}
	public void setDvpprice(int dvpprice) {
		this.dvpprice = dvpprice;
	}
	public int getDvoqty() {
		return dvoqty;
	}
	public void setDvoqty(int dvoqty) {
		this.dvoqty = dvoqty;
	}
	public String getDvodreview() {
		return dvodreview;
	}
	public void setDvodreview(String dvodreview) {
		this.dvodreview = dvodreview;
	}
	
}
