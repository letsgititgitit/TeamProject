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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class ProductUpdateController {

	private final String command="/pupdate.product";
	private final String getPage="AdminProductUpdate";
	private final String gotoPage="redirect:/plist.product";
	
	@Autowired
	ProductDao productDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public ModelAndView doAction(@RequestParam("PNUM") int PNUM, ModelAndView mav) {
		
		ProductBean bean = productDao.getOneData(PNUM);
		
		mav.addObject("productBean", bean);
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public ModelAndView doAction(@Valid ProductBean product, BindingResult result,
								ModelAndView mav) throws IllegalStateException, IOException {
		
		if(result.hasErrors()) {
			mav.setViewName(getPage);
			return mav;
		}
		
		int cnt = -1;
		cnt = productDao.updateProduct(product);
		
	
		String fUploadPath = servletContext.getRealPath("/img/product/product_img/"+product.getPSUBCATEGORY()+"/"+product.getPNAME());
		
		File delFile = null;
		MultipartFile multi = null;
		
		if(cnt != -1) {
			if(product.getPIMG1() != null && !product.getPIMG1().equals("")) {
				delFile = new File(fUploadPath+"\\"+product.getOLDUPLOAD1());
				delFile.delete();
				
				multi = product.getUPLOAD1();
				File uploadFile = new File(fUploadPath+"\\"+product.getPIMG1());
				
				multi.transferTo(uploadFile);
				
				mav.setViewName(gotoPage);
			}
			if(product.getPIMG2() != null && !product.getPIMG2().equals("")) {
				delFile = new File(fUploadPath+"\\"+product.getOLDUPLOAD2());
				delFile.delete();
				
				multi = product.getUPLOAD2();
				File uploadFile2 = new File(fUploadPath+"\\"+product.getPIMG2());
				
				multi.transferTo(uploadFile2);
				mav.setViewName(gotoPage);
			}
			if(product.getPIMG3() != null && !product.getPIMG3().equals("")) {
				delFile = new File(fUploadPath+"\\"+product.getOLDUPLOAD3());
				delFile.delete();
				
				multi = product.getUPLOAD3();
				File uploadFile3 = new File(fUploadPath+"\\"+product.getPIMG3());
				
				multi.transferTo(uploadFile3);
				
				mav.setViewName(gotoPage);
			}
			if(product.getPIMG4() != null && !product.getPIMG4().equals("")) {
				delFile = new File(fUploadPath+"\\"+product.getOLDUPLOAD4());
				delFile.delete();
				
				multi = product.getUPLOAD4();
				File uploadFile4 = new File(fUploadPath+"\\"+product.getPIMG4());
				
				multi.transferTo(uploadFile4);
				
				mav.setViewName(gotoPage);
			}
			if(product.getPIMG5() != null && !product.getPIMG5().equals("")) {
				delFile = new File(fUploadPath+"\\"+product.getOLDUPLOAD5());
				delFile.delete();
				
				multi = product.getUPLOAD5();
				File uploadFile5 = new File(fUploadPath+"\\"+product.getPIMG5());
				
				multi.transferTo(uploadFile5);
				
				mav.setViewName(gotoPage);
			}
			if(product.getPINFOIMG() != null && !product.getPINFOIMG().equals("")) {
				delFile = new File(fUploadPath+"\\"+product.getOLDINFOUPLOAD());
				delFile.delete();
				
				multi = product.getINFOUPLOAD();
				File uploadFile6 = new File(fUploadPath+"\\"+product.getPINFOIMG());
				
				multi.transferTo(uploadFile6);
				
				mav.setViewName(gotoPage);
			}
			if(product.getPSUBIMG() != null && !product.getPSUBIMG().equals("")) {
				delFile = new File(fUploadPath+"\\"+product.getOLDSUBUPLOAD());
				delFile.delete();
				
				multi = product.getSUBUPLOAD();
				File uploadFile7 = new File(fUploadPath+"\\"+product.getPSUBIMG());
				
				multi.transferTo(uploadFile7);
				
				mav.setViewName(gotoPage);
			}
			
			
		}
		
		else {
			mav.setViewName(getPage);
		}
		
		mav.setViewName(gotoPage);
		return mav;
	}
	
}
