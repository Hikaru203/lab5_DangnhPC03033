package com.example.demo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.Dao.AccountDAO;
import com.example.demo.Model.Account;

@Controller
public class AccountController {
    @Autowired
    AccountDAO dao; // Làm việc với bảng Accounts

    @RequestMapping("/account/index")
    public String index(Model model) {
        Account item = new Account();
        model.addAttribute("item", item);
        List<Account> items = dao.findAll();
        model.addAttribute("items", items);
        return "account/index";
    }

    @RequestMapping("/account/edit/{username}")
    public String edit(Model model, @PathVariable("username") String username) {
        Account item = dao.findById(username).get();
        model.addAttribute("item", item);
        List<Account> items = dao.findAll();
        model.addAttribute("items", items);
        return "account/index";
    }

    @RequestMapping("/account/create")
    public String create(Account item) {
        dao.save(item);
        return "redirect:/account/index";
    }

    @RequestMapping("/account/update")
    public String update(Account item) {
        dao.save(item);
        return "redirect:/account/edit/" + item.getUsername();
    }

    @RequestMapping("/account/delete/{username}")
    public String delete(@PathVariable("username") String username) {
        dao.deleteById(username);
        return "redirect:/account/index";
    }
}

