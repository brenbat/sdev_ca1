package models.users;

import java.util.*;
import javax.persistence.*;

import io.ebean.*;
import play.data.format.*;
import play.data.validation.*;


@Table(name="User")
// the user type of this class is "admin"
@DiscriminatorValue("e")
@Entity
public class Employee extends User {

    /*@OneToOne(mappedBy="employee", cascade = CascadeType.ALL)
    private Address address;

    @ManyToMany(mappedBy="employee", cascade = CascadeType.ALL)
    private Project project;

    @OneToMany(mappedBy="employee", cascade = CascadeType.ALL)
    private Department department;*/

    public Employee(){

    }
    public Employee(String email, String name,String role, String password,Date dateOfBirth) {
        super(email, name, role,password,dateOfBirth);
    }

    public static final Finder<Long, Employee> find = new Finder<>(Employee.class);
			    
    public static final List<Employee> findAll() {
       return Employee.find.all();
    }

    /*public Address getAddress() {
        return address;
    }

    public Project getProject() {
        return project;
    }

    public Department getDepartment() {
        return department;
    }*/
}