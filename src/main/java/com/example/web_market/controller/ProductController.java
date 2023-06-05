package com.example.web_market.controller;

import com.example.web_market.models.Product;
import com.example.web_market.models.User;
import com.example.web_market.services.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class ProductController {
    private final ProductService productService;

    @GetMapping("/")
    public String products(@RequestParam(name = "searchWord", required = false) String title,Principal principal,  Model model){
        model.addAttribute("products", productService.listProducts(title));
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        model.addAttribute("searchWord", title);
        return "events";
    }
    @GetMapping("/event/{id}")
    public String productInfo(@PathVariable Long id, Model model, Principal principal) {
        Product product = productService.getProductById(id);
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        model.addAttribute("product", product);
        model.addAttribute("images", product.getImages());
        model.addAttribute("authorProduct", product.getUser());
        return "event-info";
    }
    @PostMapping("/event/create")
    public String createProduct(@RequestParam("file1") MultipartFile file1,
                                @RequestParam("file2") MultipartFile file2,
                                @RequestParam("file3") MultipartFile file3, Product product , Principal principal)throws IOException {
        productService.saveProduct(principal ,product, file1, file2, file3);
        return "redirect:/my/events";
    }

    @PostMapping("/event/delete/{id}")
    public String deleteProduct(@PathVariable Long id, Principal principal) {
        productService.deleteProduct(productService.getUserByPrincipal(principal), id);
        return "redirect:/my/events";
    }

    @GetMapping("/my/events")
    public String userProducts(Principal principal, Model model) {
        User user = productService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("products", user.getProducts());
        return "my-events";
    }

}
