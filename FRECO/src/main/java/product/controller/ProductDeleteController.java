package product.controller;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class ProductDeleteController {

	public final String command="/pdelete.product";
	public final String gotoPage="redirect:/plist.product";
	
	@Autowired
	ProductDao productDao;
	
	@Autowired
	ServletContext servletContext;
	
	//관리자 페이지 상품 삭제
	@RequestMapping(value=command)
	public String doAction(@RequestParam("PNUM") int PNUM) {
		
		ProductBean bean = productDao.getOneData(PNUM);
		
		String fUploadPath = servletContext.getRealPath("/img/product/product_img/"+bean.getPSUBCATEGORY()+"/"+bean.getPNAME());
		
		File fUpload1 = new File(fUploadPath+"\\"+bean.getPIMG1());
		File fUpload2 = new File(fUploadPath+"\\"+bean.getPIMG2());
		File fUpload3 = new File(fUploadPath+"\\"+bean.getPIMG3());
		File fUpload4 = new File(fUploadPath+"\\"+bean.getPIMG4());
		File fUpload5 = new File(fUploadPath+"\\"+bean.getPIMG5());
		
		File sUpload1 = new File(fUploadPath+"\\"+bean.getPINFOIMG());
		File sUpload2 = new File(fUploadPath+"\\"+bean.getPSUBIMG());
		
		fUpload1.delete();
		fUpload2.delete();
		fUpload3.delete();
		fUpload4.delete();
		fUpload5.delete();
		
		sUpload1.delete();
		sUpload2.delete();	
		
		
		
	   productDao.deleteData(PNUM);
	
	
		return gotoPage;
	}
	
}
