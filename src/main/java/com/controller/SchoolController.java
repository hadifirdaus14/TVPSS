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
