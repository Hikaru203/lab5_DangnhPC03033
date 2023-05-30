package com.example.demo.Dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.Model.Product;

public interface ProductDAO extends JpaRepository<Product, Integer>{}
