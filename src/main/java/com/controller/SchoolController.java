package com.controller;

import com.model.School;
import com.service.SchoolDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SchoolController {

    @Autowired //dependency injection
    private SchoolDAO schoolDAO;
    
    //Endpoint to fetch school details for editing
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

    public void addSchool() {
        School school = new School("JBA3002", "SK MUZAFFAR SHAH", "Primary School", "Kota Tinggi");
        schoolDAO.saveSchool(school);
    }
    
    public void listSchools() {
        schoolDAO.getAllSchools().forEach(school -> {
            System.out.println(school.getName());
        });
    }
}
