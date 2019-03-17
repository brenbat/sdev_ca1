package controllers;

import play.api.Environment;
import play.mvc.*;
import play.data.*;
import play.db.ebean.Transactional;

import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;

import views.html.*;

import models.users.*;
import models.*;

public class SearchController extends Controller {

private FormFactory formFactory;

private play.api.Environment env;

@Inject
public SearchController(Environment e, FormFactory f)
{
    this.env = e;
    this.formFactory = f;
}

@Transactional
public User getCurrentUser()
{
    User u = User.getUserById(session().get("email"));
    return u;
}


@Transactional
public Result listItems( Long cat,String searchTerm)
{
    List<Project> project = Project.findAll();

    List<ProjectType> items = new ArrayList<ProjectType>();

    if (cat == 0)
    {
        items = ProjectType.findAll(searchTerm);    
    }
    else
    {
        items = ProjectType.findFilter(cat, searchTerm);
    }
    

    return ok(onsale.render(items, project, cat, searchTerm, getCurrentUser(),env));
}




}