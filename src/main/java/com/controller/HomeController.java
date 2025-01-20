package com.controller;

import com.service.PICDAO;
import com.service.SchoolDAO;
import com.model.*;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class HomeController {

	@Autowired //dependency injection
    private SchoolDAO schoolDAO;
	
	@Autowired //dependency injection
    private PICDAO picDao;

	//Endpoint to display school list for schoolPIC/crew
    @RequestMapping("/manageSchoolInfo")
    public ModelAndView SchoolListPIC() {
        ModelAndView modelAndView = new ModelAndView("manageSchoolInfo"); // Make sure the JSP name is correct
        try {
            // Fetch the list of schools from the DAO
            List<School> school = schoolDAO.getAllSchools();
            modelAndView.addObject("schools", school); 
            modelAndView.addObject("currentPage", "SchoolListPIC");
        } catch (Exception e) {
            modelAndView.addObject("error", "Error fetching schools: " + e.getMessage());
        }
        return modelAndView;
    }
    
    //Endpoint to display school list for admin
    @RequestMapping("/manageSchool")
    public ModelAndView SchoolList() {
        ModelAndView modelAndView = new ModelAndView("manageSchool"); // Make sure the JSP name is correct
        try {
            // Fetch the list of schools from the DAO
            List<School> school = schoolDAO.getAllSchools();
            modelAndView.addObject("schools", school); // Use 'schools' instead of 'school' for plural consistency
            modelAndView.addObject("currentPage", "SchoolList");
        } catch (Exception e) {
            modelAndView.addObject("error", "Error fetching schools: " + e.getMessage());
        }
        return modelAndView;
    }
    
    @RequestMapping("/manageUser")
    public ModelAndView manageUser() {
        ModelAndView modelAndView = new ModelAndView("manageUser");
        modelAndView.addObject("currentPage", "manageUser");

        // Fetch the list of users using getAllTeachers
        List<PIC> pics = picDao.getAllPICs();
        modelAndView.addObject("pics", pics);

        return modelAndView;
    }
    
    @GetMapping("/")
    public ModelAndView home() {
        ModelAndView modelAndView = new ModelAndView("home");
        modelAndView.addObject("message", "Welcome!");
        return modelAndView; // Navigates to /WEB-INF/views/home.jsp
    }

    @GetMapping("/editUser")
    public String showEditForm(@RequestParam("id") int id, Model model) {
        try {
            PIC pic = picDao.getPICById(id);
            List<School> schools = schoolDAO.getAllSchools();
            
            model.addAttribute("schools",schools);
            model.addAttribute("pic", pic);
            return "editUser"; 
        } catch (Exception e) {
            return "redirect:/editUser?error=true";
        }
    }

    
    @PostMapping("/deleteUser")
    public String deleteUser(@RequestParam("id") int id) {
        try {
            System.out.println("Delete request received for ID: " + id);
            picDao.deletePIC(id);
            return "redirect:/manageUser";
        } catch (Exception e) {
            System.err.println("Error during deletion: " + e.getMessage());
            return "redirect:/manageUser?error=true";
        }
    }

    
    @PostMapping("/updatePic")
    public String updatePic(@RequestParam int id, 
                            @RequestParam String name, 
                            @RequestParam int age, 
                            @RequestParam int schoolId) {
        // Fetch the PIC record by ID
        PIC pic = picDao.findById(id);

        // Update the PIC attributes
        pic.setName(name);
        pic.setAge(age);

        // Fetch the school and set it
        School school = schoolDAO.findById(schoolId);
        pic.setSchool(school);

        // Save the updated PIC
        picDao.savePIC(pic);

        // Redirect or return a response
        return "redirect:/manageUser"; // Redirect back to the list page
    }
    
    @PostMapping("/updateUser")
    public String updateUser(@ModelAttribute PIC pic, Model model) {
        // Save the updated school data
    	System.out.println("Updating PIC: " + pic);

        picDao.updatePIC(pic);

        // Redirect to the management page
        return "redirect:/manageUser";
    }

}
