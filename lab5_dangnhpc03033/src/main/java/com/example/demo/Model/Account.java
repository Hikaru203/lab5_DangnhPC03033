package com.example.demo.Model;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "Accounts")
public class Account implements Serializable{
@Id
String username;
String password;
String fullname;
String email;
String photo;
boolean activated;
boolean admin;
@OneToMany(mappedBy = "account")
List<Order> orders;
}
