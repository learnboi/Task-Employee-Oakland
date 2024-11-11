package com.project.Task.Controller;

import com.project.Task.EmployeeDto.EmployeeDto;
import com.project.Task.Model.Employee;
import com.project.Task.Repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RegisterController {


    private Employee employee;
    private EmployeeDto employeeDto;
    @Autowired
    private EmployeeRepository employeeRepository;

    @RequestMapping("register-data")
    public String registerDetails(@RequestParam String name,
                                @RequestParam String dob,
                                @RequestParam String gender,
                                @RequestParam String address,
                                @RequestParam String city,
                                @RequestParam String state,
                                @RequestParam String login_id,
                                @RequestParam String password){
        Employee employee = new Employee(name, dob, gender, address, city, state, login_id, password);
        employeeRepository.save(employee);
        return "login";
    }
}
