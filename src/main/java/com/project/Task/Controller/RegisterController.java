package com.project.Task.Controller;
import com.project.Task.Model.Employee;
import com.project.Task.Repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RegisterController {

    @Autowired
    private EmployeeRepository employeeRepository;

    @RequestMapping("register-data")
    public String registerDetails(
            @RequestParam String name,
            @RequestParam String dob,
            @RequestParam String gender,
            @RequestParam String address,
            @RequestParam String city,
            @RequestParam String state,
            @RequestParam String login_id,
            @RequestParam String password) {
        Employee employee = new Employee();
        employee.setName(name);
        employee.setDob(dob);
        employee.setGender(gender);
        employee.setAddress(address);
        employee.setCity(city);
        employee.setState(state);
        employee.setLogin_id(login_id);
        employee.setPassword(password);
        try {
            long count = employeeRepository.count();
            if (count >= 0) {
                employee.setId(count+1);
            }
            employeeRepository.save(employee);
        } catch (Exception e) {
            System.out.println(e.getLocalizedMessage());
        }
        return "login";
    }
}