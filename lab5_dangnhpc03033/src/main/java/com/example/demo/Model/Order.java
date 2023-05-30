package com.example.demo.Model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "Orders")
public class Order implements Serializable{
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
Long id;
String address;
@Temporal(TemporalType.DATE)
@Column(name = "Createdate")
Date createDate = new Date();
@ManyToOne @JoinColumn(name = "Username")
Account account;
@OneToMany(mappedBy = "order")
List<OrderDetail> orderDetails;
}
