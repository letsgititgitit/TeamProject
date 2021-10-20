package utility;

public class OrderListPaging {
	private int totalCountOrder = 0 ;
	private int totalPage = 0 ;
	private int pageNumber = 0 ; 
	private int pageSize = 0 ; 
	private int beginRow = 0 ; 
	private int endRow = 0 ; 
	private int pageCount = 5 ; 
	private int beginPage = 0 ;
	private int endPage = 0 ; 
	private int offset = 0 ;
	private int limit = 0 ;
	private String url = "" ; 
	private String pagingHtml = "";
	
	public int getTotalCountOrder() {
		return totalCountOrder;
	}
	public void setTotalCountOrder(int totalCountOrder) {
		this.totalCountOrder = totalCountOrder;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getBeginRow() {
		return beginRow;
	}
	public void setBeginRow(int beginRow) {
		this.beginRow = beginRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	
	public String getPagingHtml() {
		System.out.println("pagingHtml:"+pagingHtml);
		return pagingHtml;
	}
	
	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}
	
	public OrderListPaging(
			String _pageNumber, 
			String _pageSize,  
			int totalCountOrder,
			String url) {		

		if(  _pageNumber == null || _pageNumber.equals("null") || _pageNumber.equals("")  ){
			
			System.out.println("_pageNumber:"+_pageNumber); // null
			_pageNumber = "1" ;
		}
		this.pageNumber = Integer.parseInt( _pageNumber ) ; 

		if( _pageSize == null || _pageSize.equals("null") || _pageSize.equals("") ){
			_pageSize = "5" ; // 한 페이지에 보여줄 레코드 갯수
		}		
		this.pageSize = Integer.parseInt( _pageSize ) ;
		
		this.limit = pageSize ;
		this.totalCountOrder = totalCountOrder ; 

		this.totalPage = (int)Math.ceil((double)this.totalCountOrder / this.pageSize) ;
		
		this.beginRow = ( this.pageNumber - 1 )  * this.pageSize  + 1 ;
		this.endRow =  this.pageNumber * this.pageSize ;
		
		if( this.pageNumber > this.totalPage ){ // 4>3
			this.pageNumber = this.totalPage ; // 3=3
		}
		
		this.offset = ( pageNumber - 1 ) * pageSize ;
		
		
		if( this.endRow > this.totalCountOrder ){
			this.endRow = this.totalCountOrder  ;
		}

		this.beginPage = ( this.pageNumber - 1 ) / this.pageCount * this.pageCount + 1  ;
		this.endPage = this.beginPage + this.pageCount - 1 ;
		
		System.out.println("pageNumber:"+pageNumber+"/totalPage:"+totalPage);	
		
		if( this.endPage > this.totalPage ){
			this.endPage = this.totalPage ;
		}
		
		System.out.println("pageNumber2:"+pageNumber+"/totalPage2:"+totalPage);	
		this.url = url ; 
		
		this.pagingHtml = getPagingHtml(url) ;
	
	}
	
	
	private String getPagingHtml( String url ){ 
		System.out.println("OrderList :: getPagingHtml url:"+url); 
		
		String result = "" ;
		
		if (this.beginPage != 1) { 
			
			result += "<a href='" + url  
					+ "?pageNumber=" + ( 1 ) + "&pageSize=" + this.pageSize 
					+ "'> &lt;&lt; </a>" ;
			result += "<a href='" + url 
					+ "?pageNumber=" + (this.beginPage - 1 ) + "&pageSize=" + this.pageSize 
					+ "'> &lt; </a>" ;
		}
		
		//가운데
		for (int i = this.beginPage; i <= this.endPage ; i++) {
			if ( i == this.pageNumber ) {
				result += "<a href='#' class='active'>" + i + "</a>"	;
						
			} else {
				result += "<a href='" + url   
						+ "?pageNumber=" + i + "&pageSize=" + this.pageSize 
						+ "'>" + i + "</a>" ;
				
			}
		}
		System.out.println("result:"+result); 
		System.out.println();
		
		if ( this.endPage != this.totalPage) { // 뒤쪽
			
			result += "<a href='" + url  
					+ "?pageNumber=" + (this.endPage + 1 ) + "&pageSize=" + this.pageSize 
					+  "'> &gt; </a>" ;
			
			result += "<a href='" + url  
					+ "?pageNumber=" + (this.totalPage ) + "&pageSize=" + this.pageSize 
					+ "'> &gt;&gt; </a>" ;
		}		
		System.out.println("result2:"+result);
		
		return result ;
	}	
	
	
	
	
	
	
}
