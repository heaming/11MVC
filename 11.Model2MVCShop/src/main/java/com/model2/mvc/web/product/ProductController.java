package com.model2.mvc.web.product;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	// field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;


	// ctor
	public ProductController() {
		System.out.println(this.getClass());
	}

	
	// method
	@RequestMapping(value="/addProduct", method=RequestMethod.GET)
	public String addProductView() throws Exception {

		System.out.println("/product/addProduct : GET");

		return	"redirect:/product/addProductView.jsp";	

	}

	@RequestMapping(value="/addProduct", method=RequestMethod.POST, consumes= { MediaType.MULTIPART_FORM_DATA_VALUE })
	public String addProduct(HttpSession session, @ModelAttribute("product") Product product, RedirectAttributes redirectAttributes, @RequestParam("multiFile") List<MultipartFile> files) throws Exception {

		System.out.println("/addProduct : POST");
		
		System.out.println(product);

		User user = (User) session.getAttribute("user");
		
		List<String> fileList = new ArrayList<String>();

		product.setSellerId(user.getUserId());
		
		System.out.println(files);

		
		// file
		if (!files.isEmpty()) {
						
			String uploadPath = "C:\\Users\\����\\git\\11.Model2MVCShop\\11.Model2MVCShop\\src\\main\\webapp\\images\\uploadFiles";
			if(!new File(uploadPath).exists()) {
				new File(uploadPath).mkdir();
			}
				
			for(MultipartFile file : files) {
				
				String fileName = file.getOriginalFilename();
				
				System.out.println(fileName);
				
				File target = new File(uploadPath, fileName);
				file.transferTo(target);
				
				fileList.add(fileName);					
			}
			
			String fileNames = String.join(",", fileList);
			
			product.setFileName(fileNames);	
		}
		
		productService.addProduct(product);
		
		redirectAttributes.addFlashAttribute("product", product);

		return "redirect:/product/addProductSuccess";	
	}
	
	
	@RequestMapping(value="/addProductSuccess", method=RequestMethod.GET)
	public String addProductSuccess() {
		
		System.out.println("/addProductSuccess");
		
		return "forward:/product/addProduct.jsp";
	}


	@RequestMapping(value="/getProduct")
	public String getProduct( @RequestParam("prodNo") int prodNo, @RequestParam("menu") String menu, Model model ) throws Exception {

		System.out.println("/getProduct");

		Product product = productService.getProduct(prodNo);

		model.addAttribute("product", product);
		model.addAttribute("menu", menu);

		return "forward:/product/getProduct.jsp";
	}

	@RequestMapping(value="/listProduct")
	public String listProduct(@ModelAttribute("search") Search search,  Model model) throws Exception {
//@RequestParam("menu") String menu,
		System.out.println("/listProduct");

		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		// Business logic ����
		Map<String , Object> map = productService.getProductList(search);

		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);

		// Model �� View ����
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		//model.addAttribute("menu", menu);

		return "forward:/product/listProduct.jsp";
	}

	@RequestMapping(value="/updateProduct", method=RequestMethod.GET)
	public String updateProduct( @RequestParam("prodNo") int prodNo, @RequestParam("menu") String menu, Model model) throws Exception {
		
		System.out.println("/updateProduct : GET");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		// Model �� View ����
		model.addAttribute("product", product);
		model.addAttribute("menu", menu);
		
		return "forward:/product/updateProduct.jsp";
	}

	@RequestMapping(value="/updateProduct", method=RequestMethod.POST, consumes= { MediaType.MULTIPART_FORM_DATA_VALUE })
	public String updateProduct( @ModelAttribute("product") Product product, @RequestParam("menu") String menu, @RequestParam("multiFile") List<MultipartFile> files) throws Exception {
		
		System.out.println("/updateProduct : POST");
		
		List<String> fileList = new ArrayList<String>();
		
		// file
		if (!files.isEmpty()) {
			
			String uploadPath = "C:\\Users\\����\\git\\11.Model2MVCShop\\11.Model2MVCShop\\src\\main\\webapp\\images\\uploadFiles";
			if(!new File(uploadPath).exists()) {
				new File(uploadPath).mkdir();
			}
				
			for(MultipartFile file : files) {
				
				String fileName = file.getOriginalFilename();
				
				System.out.println(fileName);
				
				File target = new File(uploadPath, fileName);
				file.transferTo(target);
				
				fileList.add(fileName);					
			}
			
			String fileNames = String.join(",", fileList);
			
			product.setFileName(fileNames);	
		}
		
		productService.updateProduct(product);

		product = productService.getProduct(product.getProdNo());

		return  "redirect:/product/getProduct?prodNo="+product.getProdNo()+"&menu="+menu;

	}

}
