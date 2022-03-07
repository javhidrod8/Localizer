package org.springframework.samples.petclinic.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.samples.petclinic.model.Product;
import org.springframework.samples.petclinic.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {
	
	private final ProductService productService;
	
	@Autowired
	public ProductController(ProductService productService) {
		this.productService = productService;
	}
	
	@ModelAttribute("product")
	public Product findProduct(@PathVariable("productId") int productId) {
		return this.productService.findProductById(productId);
	}
	
	@GetMapping("/product/{productId}")
	public ModelAndView showProduct(@PathVariable("productId") int productId) {
		ModelAndView mav = new ModelAndView("products/productDetails");
		mav.addObject(this.productService.findProductById(productId));
		return mav;
	}
	
}
