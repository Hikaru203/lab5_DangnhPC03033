package com.example.demo.Dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.Model.Account;

public interface AccountDAO extends JpaRepository<Account, String>{}
