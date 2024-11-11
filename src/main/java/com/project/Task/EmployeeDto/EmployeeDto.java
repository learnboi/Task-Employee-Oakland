package com.project.Task.EmployeeDto;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class EmployeeDto {
    private String name;
    private String dob;
    private String gender;
    private String address;
    private String city;
    private String state;
    private String login_id;
    private String password;
}
