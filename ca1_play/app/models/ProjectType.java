package models;

import java.util.*;
import javax.persistence.*;
import io.ebean.*;
import play.data.format.*;
import play.data.validation.*;

@Entity
public class ProjectType extends Model {

    // Properties
    @Id
    private Long id;
    @Constraints.Required
    private String name;
    @Constraints.Required
    private String description;
    @Constraints.Required
    private int stock;
    @Constraints.Required
    private double price;

    @ManyToMany(cascade=CascadeType.ALL, mappedBy = "items")
    private List<Project> project;

    private List<Long> catSelect = new ArrayList<Long>();
    // Default Constructor
    public ProjectType() {
    }

    // Constructor to initialise object
    public ProjectType(Long id, String name, String description, int stock, double price) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.stock = stock;
        this.price = price;
    }

    public static final Finder<Long, ProjectType> find = new Finder<>(ProjectType.class);
			    
public static final List<ProjectType> findAll() {
   return ProjectType.find.all();
}

         //finding all items in the database and filtering the results by the search term
    public static final List<ProjectType> findAll(String searchTerm) 
    {
        return ProjectType.find.query().where()
                            .ilike("name", "%" +searchTerm+ "%")
                            .orderBy("name asc")
                            .findList();
    }

    //filtering the results by category that the user selects
    public static List<ProjectType>findFilter(Long catID, String searchTerm)
    {
        return ProjectType.find.query().where()
                            .eq("project.id", catID)
                            .ilike("name", "%" +searchTerm+ "%")
                            .orderBy("name asc")
                            .findList();
    }
    // Accessor methods
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public int getStock() {
        return stock;
    }
    public void setStock(int stock) {
        this.stock = stock;
    }
    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
}


public List <Project> getProject() {
    return project;
}

public void setProject(List <Project> project) {
    this.project = project;
}
public List<Long> getCatSelect() {
    return catSelect;
}
public void setCatSelect(List<Long> catSelect) {
    this.catSelect = catSelect;
}
}