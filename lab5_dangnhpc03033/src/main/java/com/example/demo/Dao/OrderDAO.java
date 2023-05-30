package com.example.demo.Dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.Model.Order;


public interface OrderDAO extends JpaRepository<Order, Long>{}
