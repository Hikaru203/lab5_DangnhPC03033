package com.example.demo.Dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.Model.OrderDetail;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long>{}