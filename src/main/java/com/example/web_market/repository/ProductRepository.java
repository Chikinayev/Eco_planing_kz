package com.example.web_market.repository;

import com.example.web_market.models.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product,Long>{
    List<Product> findByTitle(String title);//jpa repository knows what to do by the name of method


}
