package com.controller;

import com.model.School;
import com.service.SchoolDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SchoolController {

    @Autowired //dependency injection
    private SchoolDAO schoolDAO;
    
    @RequestMapping("/addSchool")
    public ModelAndView addschool() {
        ModelAndView modelAndView = new ModelAndView("addSchool");
        modelAndView.addObject("currentPage", "addSchool");
        return modelAndView;
    }
    
    //Endpoint to fetch school details for editing
    @GetMapping("/edit")
    public ModelAndView editSchool(@RequestParam("id") int id) {
        ModelAndView modelAndView = new ModelAndView("editSchool");
        School school = schoolDAO.getSchoolById(id); // Fetch school details
        modelAndView.addObject("school", school);    // Pass school to the view
        return modelAndView;
    }
    
    @PostMapping("/updateSchool")
    public String updateSchool(@ModelAttribute School school, Model model) {
        // Save the updated school data
        schoolDAO.updateSchool(school);

        // Redirect to the management page
        return "redirect:/manageSchool";
    }


    public void addSchool() {
        School school = new School();
        schoolDAO.saveSchool(school);
    }
    
    public void listSchools() {
        schoolDAO.getAllSchools().forEach(school -> {
            System.out.println(school.getName());
        });
    }
}
