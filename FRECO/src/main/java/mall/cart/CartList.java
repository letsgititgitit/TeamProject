package mall.cart;

import java.util.HashMap;
import java.util.Map;

public class CartList {
	
	private Map<Integer,Integer> orderlists = null;
	
	public CartList() {
		orderlists = new HashMap<Integer,Integer>();
	}
	
	public void addOrder(int PNUM, int ORDERPQTY) {
		if(orderlists.containsKey(PNUM) == false) {
			orderlists.put(PNUM, ORDERPQTY);
		}
		else {
			orderlists.put(PNUM, orderlists.get(PNUM)+ORDERPQTY);
		}		
	}//
	
	public Map<Integer,Integer> getAllList() {
		return orderlists;
	}//
	
	public void cartDelete(int PNUM) {		
			if(orderlists.containsKey(PNUM) == true) {
				orderlists.remove(PNUM);				
			}				
	}//
	
	public void updateCart(int PNUM,int ORDERPQTY) {
		//System.out.println("=======업데이트 카트:PNUM======"+PNUM);
		//System.out.println("=======업데이트 카트:ORDERPQTY====="+ORDERPQTY);
		
		if(orderlists.containsKey(PNUM) == true) {
			orderlists.replace(PNUM,ORDERPQTY);				
		}
	}//
	
}
