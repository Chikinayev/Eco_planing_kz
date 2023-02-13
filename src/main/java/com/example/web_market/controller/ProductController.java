package com.example.web_market.controller;

import com.example.web_market.models.Product;
import com.example.web_market.services.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class ProductController {
    private final ProductService productService;

    @GetMapping("/")
    public String products(@RequestParam(name="title", required=false) String title, Model model){
        model.addAttribute("products", productService.listProducts(title));
        return "products";
    }
    @GetMapping("/product/{id}")
    public String productInfo(@PathVariable Long id, Model model){
        model.addAttribute("product", productService.getProducedById(id));
        return "product-info";
    }
    @PostMapping("/product/create")
    public String createProduct(Product product){
        productService.saveProduct(product);
        return "redirect:/";
    }

    @PostMapping("/delete/{id}")
    public String deleteProduct(@PathVariable Long id){
        productService.deleteProduct(id);
        return "redirect:/";
    }

}
