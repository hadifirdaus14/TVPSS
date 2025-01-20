package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.model.School;
import com.model.Crew;
import com.model.User;
import com.model.PIC;
import com.service.SchoolDAO;
import com.service.UserDAO;
import com.service.PICDAO;
import com.dto.RegistrationDTO;


@Controller
public class RegistrationController {

	@Autowired
	private UserDAO userDao;
	
    @Autowired
    private SchoolDAO schoolDao;
    
    @Autowired
    private PICDAO picDao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@GetMapping("/register")
	public ModelAndView viewRegisterPage() {
		ModelAndView modelAndView = new ModelAndView("registerPage");
		modelAndView.addObject("registrationDTO", new RegistrationDTO());
		modelAndView.addObject("schools", schoolDao.getAllSchools());
		return modelAndView;
	}

	@PostMapping("/register")
    public String registerUser(@ModelAttribute("registrationDTO") RegistrationDTO registrationDto,
                             RedirectAttributes redirectAttributes) {
        try {
            // Validate username
            if (userDao.existsByUsername(registrationDto.getUsername())) {
                redirectAttributes.addFlashAttribute("error", "Username already exists");
                return "redirect:/register";
            }

            // Validate email
            if (userDao.existsByEmail(registrationDto.getEmail())) {
                redirectAttributes.addFlashAttribute("error", "Email already exists");
                return "redirect:/register";
            }

            // Create and save user
            User user = new User();
            user.setUsername(registrationDto.getUsername());
            user.setPassword(passwordEncoder.encode(registrationDto.getPassword()));
            user.setEmail(registrationDto.getEmail());
            user.setRole(registrationDto.getUserType());
            
            userDao.save(user);

            // If registering as a student, create student record
            if ("STUDENT".equals(registrationDto.getUserType())) {
                if (registrationDto.getYear() < 1 || registrationDto.getYear() > 6) {
                    redirectAttributes.addFlashAttribute("error", "Invalid year for student");
                    return "redirect:/register";
                }

                // Get school entity
                School school = schoolDao.getSchoolById(registrationDto.getSchoolId());
                if (school == null) {
                    redirectAttributes.addFlashAttribute("error", "Invalid school selected");
                    return "redirect:/register";
                }

                Crew crew = new Crew();
                crew.setName(registrationDto.getFirstName() + " " + registrationDto.getLastName());
                crew.setYear(registrationDto.getYear());
                crew.setAge(registrationDto.getAge());
                crew.setUser(user);
                crew.setSchool(school);
                
                userDao.saveCrew(crew);
            }
            else if("PIC".equals(registrationDto.getUserType())) {
            	School school = schoolDao.getSchoolById(registrationDto.getSchoolId());
                if (school == null) {
                    redirectAttributes.addFlashAttribute("error", "Invalid school selected");
                    return "redirect:/register";
                }

                PIC pic= new PIC();
                pic.setName(registrationDto.getFirstName() + " " + registrationDto.getLastName());
                pic.setAge(registrationDto.getAge());
                pic.setUser(user);
                pic.setSchool(school);
                
                picDao.savePIC(pic);
            }

            redirectAttributes.addFlashAttribute("msg", "Registration successful. Please login.");
            return "redirect:/login";

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "An error occurred during registration: " + e.getMessage());
            return "redirect:/register";
        }
    }
}