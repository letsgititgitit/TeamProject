package product.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class ProductInsertController {

	private final String command="/pinsert.product";
	private final String getPage="AdminProductInsert";
	private final String gotoPage="redirect:/plist.product";
	
	@Autowired
	ProductDao productDao;
	
	@Autowired
	ServletContext servletContext;
	//관리자 페이지 상품 입력 폼
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction() {
		
		return getPage;
	}
	
	//관리자 페이지 상품 입력 폼 -> submit
	@RequestMapping(value=command,method=RequestMethod.POST)
	public ModelAndView doAction(@Valid ProductBean bean, BindingResult result, 
									ModelAndView mav) {
		
		if(result.hasErrors()) {
			mav.setViewName(getPage);
			return mav;
		}
				
		int cnt = -1;
		cnt = productDao.insertProduct(bean);
		String fUploadPath = servletContext.getRealPath("/img/product/product_img/"+bean.getPSUBCATEGORY()+"/"+bean.getPNAME());
		if(cnt != -1) {
			
			MultipartFile multi1 = bean.getUPLOAD1();
			MultipartFile multi2 = bean.getUPLOAD2();
			MultipartFile multi3 = bean.getUPLOAD3();
			MultipartFile multi4 = bean.getUPLOAD4();
			MultipartFile multi5 = bean.getUPLOAD5();
			
			MultipartFile multi6 = bean.getINFOUPLOAD();
			MultipartFile multi7 = bean.getSUBUPLOAD();
			
			File fUpload1 = new File(fUploadPath+"\\"+bean.getPIMG1());
			File fUpload2 = new File(fUploadPath+"\\"+bean.getPIMG2());
			File fUpload3 = new File(fUploadPath+"\\"+bean.getPIMG3());
			File fUpload4 = new File(fUploadPath+"\\"+bean.getPIMG4());
			File fUpload5 = new File(fUploadPath+"\\"+bean.getPIMG5());
			
			File sUpload1 = new File(fUploadPath+"\\"+bean.getPINFOIMG());
			File sUpload2 = new File(fUploadPath+"\\"+bean.getPSUBIMG());
			
			try {
				multi1.transferTo(fUpload1);
				multi2.transferTo(fUpload2);
				multi3.transferTo(fUpload3);
				multi4.transferTo(fUpload4);
				multi5.transferTo(fUpload5);
				
				multi6.transferTo(sUpload1);
				multi7.transferTo(sUpload2);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			mav.setViewName(gotoPage);
		}
		
		else {
			mav.setViewName(getPage);
		}
		return mav;
	}
}
