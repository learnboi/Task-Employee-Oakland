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

    private String name;
    private String dob;
    private String gender;
    private String address;
    private String city;
    private String state;

    @Column(unique = true)
    @Id
    private String login_id;
    private String password;
}
