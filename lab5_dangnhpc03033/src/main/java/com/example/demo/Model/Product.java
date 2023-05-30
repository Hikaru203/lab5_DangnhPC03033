package com.example.demo.Model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "Products")
public class Product implements Serializable{
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
Integer id;
String name;
String image;
Double price;
@Temporal(TemporalType.DATE)
@Column(name = "Createdate")
Date createDate = new Date();
Boolean available;
@ManyToOne @JoinColumn(name = "Categoryid")
Category category;
@OneToMany(mappedBy = "product")
List<OrderDetail> orderDetails;
}
