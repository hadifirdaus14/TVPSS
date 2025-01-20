package com.controller;

import com.model.School;
import com.service.SchoolDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    @GetMapping("/editSchool")
    public String showEditForm(@RequestParam("id") int id, Model model) {
        try {
            School school = schoolDAO.getSchoolById(id);
            model.addAttribute("school", school);
            return "editSchool"; // this will look for editSchool.jsp
        } catch (Exception e) {
            return "redirect:/manageSchool?error=true";
        }
    }
    
    @PostMapping("/updateSchool")
    public String updateSchool(@ModelAttribute School school, Model model) {
        // Save the updated school data
        schoolDAO.updateSchool(school);

        // Redirect to the management page
        return "redirect:/manageSchool";
    }


    @PostMapping("/addSchool")
    public String addSchool(@ModelAttribute School school, RedirectAttributes redirectAttributes) {
        try {
            schoolDAO.saveSchool(school);
            redirectAttributes.addFlashAttribute("message", "School added successfully!");
            return "redirect:/manageSchoolInfo";  // Redirect after successful submission
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Failed to add school");
            return "redirect:/addSchool";
        }
    }
    
    public void listSchools() {
        schoolDAO.getAllSchools().forEach(school -> {
            System.out.println(school.getName());
        });
    }
    
    @PostMapping("/deleteSchool")
    public String deleteSchool(@RequestParam("id") int id) {
        try {
            System.out.println("Delete request received for ID: " + id);
            schoolDAO.deleteSchool(id);
            return "redirect:/manageSchool";
        } catch (Exception e) {
            System.err.println("Error during deletion: " + e.getMessage());
            return "redirect:/manageSchool?error=true";
        }
    }
}
