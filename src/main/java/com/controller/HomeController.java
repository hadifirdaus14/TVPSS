package com.controller;

import com.service.SchoolDAO;
import com.model.*;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class HomeController {

	@Autowired //dependency injection
    private SchoolDAO schoolDAO;

    @GetMapping("/manageSchoolInfo")
    public String manageSchoolInfo() {
        return "manageSchoolInfo"; // Navigates to /WEB-INF/views/manageSchoolInfo.jsp
    }
    
    @RequestMapping("/view-school-list")
    public ModelAndView manageSchool() {
        ModelAndView modelAndView = new ModelAndView("manageSchool");
        modelAndView.addObject("currentPage", "manageSchool");
        return modelAndView;
    }

    //Endpoint to display school list
    @RequestMapping("/school-list")
    public ModelAndView SchoolList() {
        ModelAndView modelAndView = new ModelAndView("viewSchoolList"); // Make sure the JSP name is correct
        try {
            // Fetch the list of schools from the DAO
            List<School> schools = schoolDAO.getAllSchools();
            modelAndView.addObject("schools", schools); // Use 'schools' instead of 'school' for plural consistency
            modelAndView.addObject("currentPage", "SchoolList");
        } catch (Exception e) {
            modelAndView.addObject("error", "Error fetching schools: " + e.getMessage());
        }
        return modelAndView;
    }
    
    // Endpoint to fetch school details for editing
    @GetMapping("/edit")
    public ModelAndView editSchool(@RequestParam("id") int id) {
        ModelAndView modelAndView = new ModelAndView("editSchool");
        School school = schoolDAO.getSchoolById(id); // Fetch school details
        modelAndView.addObject("school", school);    // Pass school to the view
        return modelAndView;
    }
   
    // Endpoint to handle school update form submission
    @PostMapping("/updateSchool")
    public String updateSchool(@RequestParam("code") String code,
                               @RequestParam("name") String name,
                               @RequestParam("type") String type,
                               @RequestParam("district") String district) {
        // Create a new school object with updated details
        School school = new School(code, name, type, district);
        
        // Update the school in the database
        schoolDAO.updateSchool(school);
        
        // Redirect to the school list page after updating
        return "redirect:/school-list";
    }
    
    @RequestMapping("/manageUser")
    public ModelAndView manageUser() {
        ModelAndView modelAndView = new ModelAndView("manageUser");
        modelAndView.addObject("currentPage", "manageUser");
        return modelAndView;
    }
    
    @GetMapping("/")
    public ModelAndView home() {
        ModelAndView modelAndView = new ModelAndView("home");
        modelAndView.addObject("message", "Welcome to the Spring Web App!");
        return modelAndView; // Navigates to /WEB-INF/views/home.jsp
    }
}
