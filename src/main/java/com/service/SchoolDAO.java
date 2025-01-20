package com.service;

import com.model.School;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SchoolDAO {

    @PersistenceContext
    private EntityManager entityManager;

    @Transactional
    public void saveSchool(School school) {
        try {
            entityManager.persist(school);
        } catch (Exception e) {
            e.printStackTrace();
            throw e; 
        }
    }

    public School getSchoolById(int id) {
        return entityManager.find(School.class, id);
    }

    public List<School> getAllSchools() {
    	return entityManager.createQuery("FROM School", School.class).getResultList();
    }

    @Transactional
    public void updateSchool(School school) {
        entityManager.merge(school);
    }

    @Transactional
    public void deleteSchool(int id) {
        try {
            System.out.println("Finding school with ID: " + id);
            School school = entityManager.find(School.class, id);
            
            if (school != null) {
                System.out.println("Found school, attempting to remove");
                entityManager.remove(school);
                entityManager.flush(); // Force the delete to happen now
                System.out.println("School removed successfully");
            } else {
                System.out.println("No school found with ID: " + id);
                throw new IllegalArgumentException("School not found with ID: " + id);
            }
        } catch (Exception e) {
            System.err.println("Error in deleteSchool service method: " + e.getMessage());
            e.printStackTrace();
            throw e;
        }
    }
}
