package com.example.demo.Dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.Model.Category;

public interface CategoryDAO extends JpaRepository<Category, String>{}
