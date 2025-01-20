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

    @GetMapping("/manageSchoolInfo")
    public String manageSchoolInfo() {
        return "manageSchoolInfo"; // Navigates to /WEB-INF/views/manageSchoolInfo.jsp
    }
    
    @RequestMapping("/manageSchool")
    public ModelAndView manageSchool() {
        ModelAndView modelAndView = new ModelAndView("manageSchool");
        modelAndView.addObject("currentPage", "manageSchool");
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
