package com.controller;

import com.service.PICDAO;
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
        modelAndView.addObject("message", "Welcome to the Spring Web App!");
        return modelAndView; // Navigates to /WEB-INF/views/home.jsp
    }
}
