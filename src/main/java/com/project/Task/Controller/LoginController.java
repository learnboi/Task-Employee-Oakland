package com.project.Task.Controller;

import com.project.Task.Model.Employee;
import com.project.Task.Repository.EmployeeRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Comparator;
import java.util.List;
import java.util.Optional;

@Controller
public class LoginController {
    @Autowired
    EmployeeRepository employeeRepository;

    @GetMapping("/admin-page")
    public String adminPage(HttpSession session, Model model) {
        String loginId = (String) session.getAttribute("login_id");
        if (loginId == null || !loginId.equals("admin")) {
            return "redirect:/login";
        }
        List<Employee> employees = employeeRepository.findAll();
        employees.sort(Comparator.comparing(Employee::getId));
        model.addAttribute("employees", employees);
        return "admin-page";
    }


    @PostMapping("login-data")
    public String loginValidate(@RequestParam String login_id, @RequestParam String password, Model model, HttpSession session) {
        Optional<Employee> employeeOpt = employeeRepository.findById(login_id.toLowerCase());
        if(login_id.equals("admin") && password.equals("admin")) {
            session.setAttribute("login_id", login_id);
            return "redirect:/admin-page";
        }
        else{
            if (employeeOpt.isPresent()) {
                Employee employee = employeeOpt.get();
                if (employee.getPassword().equals(password)) {
                    List<Employee> employees = employeeRepository.findAll();
                    employees.sort(Comparator.comparing(Employee::getId));
                    session.setAttribute("employees", employees);
                    session.setAttribute("name", employee.getName());
                    session.setAttribute("login_id", login_id);
                    return "welcome";
                } else {
                    model.addAttribute("error", "Wrong password. Please try again.");
                }
            } else {
                model.addAttribute("error", "Employee not found. Please register.");
            }
            return "login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/home";
    }

}
