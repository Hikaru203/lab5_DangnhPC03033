package com.example.demo.Controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.Dao.AccountDAO;
import com.example.demo.Dao.CategoryDAO;
import com.example.demo.Dao.ProductDAO;
import com.example.demo.Model.Account;
import com.example.demo.Model.Category;
import com.example.demo.Model.Product;

@Controller
public class CategoryController {
    @Autowired
    CategoryDAO dao; // Lớp DAO để làm việc với bảng Categories
    @Autowired
    private ProductDAO productDAO;
    
    @Autowired
    AccountDAO accountDAO; // Làm việc với bảng Accounts

    @RequestMapping("/category/index")
    public String index(Model model) {
        Category item = new Category();
        model.addAttribute("item", item);
        List<Category> items = dao.findAll();
        model.addAttribute("items", items);
        return "category/index";
    }

    @RequestMapping("/category/edit/{id}")
    public String edit(Model model, @PathVariable("id") String id) {
        Category item = dao.findById(id).get();
        model.addAttribute("item", item);
        List<Category> items = dao.findAll();
        model.addAttribute("items", items);
        return "category/index";
    }

    @RequestMapping("/category/create")
    public String create(Category item) {
        dao.save(item);
        return "redirect:/category/index";
    }

    @RequestMapping("/category/update")
    public String update(Category item) {
        dao.save(item);
        return "redirect:/category/edit/" + item.getId();
    }

    @RequestMapping("/category/delete/{id}")
    public String delete(@PathVariable("id") String id) {
        dao.deleteById(id);
        return "redirect:/category/index";
    }
    @RequestMapping("/product/sort")
    public String sort(Model model, @RequestParam("field") Optional<String> field) {
        Sort sort = Sort.by(Direction.DESC, field.orElse("price"));
        model.addAttribute("field", field.orElse("price").toUpperCase());
        List<Product> items = productDAO.findAll(sort);
        model.addAttribute("items", items);
        return "product/sort";
    }
    @RequestMapping("/product/page")
    public String paginate(Model model, @RequestParam("p") Optional<Integer> p) {
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        Page<Product> page = productDAO.findAll(pageable);
        model.addAttribute("page", page);
        return "product/page";
    }
    


}

