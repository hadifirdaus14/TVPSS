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
        School school = getSchoolById(id);
        if (school != null) {
            entityManager.remove(school);
        }
    }
}
