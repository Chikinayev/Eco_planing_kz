package com.example.web_market.services;


import com.example.web_market.models.Product;
import com.example.web_market.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor//it creates constructor for injected productRepository
@Slf4j//logging
public class ProductService {
    private final ProductRepository productRepository;
    public List<Product> listProducts(String title){
        if(title!=null) return productRepository.findByTitle(title);
        return productRepository.findAll();
    }

    public void saveProduct(Product product){
        log.info("Saving new{}",product);
        productRepository.save(product);
    }
    public void deleteProduct(Long id){
        productRepository.deleteById(id);
    }

    public Product getProducedById(Long id) {
        return productRepository.findById(id).orElse(null);

    }
}
