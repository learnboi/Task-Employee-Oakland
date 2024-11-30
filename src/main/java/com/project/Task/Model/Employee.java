package com.project.Task.Model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "employeedata")
public class Employee {

    @Id
    @Column(name = "login_id", nullable = false, unique = true)
    private String login_id;

    private Long id;

    private String name;
    private String dob;
    private String gender;
    private String address;
    private String city;
    private String state;
    private String password;
}
