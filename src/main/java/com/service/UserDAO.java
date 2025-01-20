// UserDao.java
package com.service;

import org.hibernate.Session;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.model.Crew;
import com.model.User;
import java.util.List;

@Service
public class UserDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public User findByUsername(String username) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from User where username = :username", User.class)
                .setParameter("username", username)
                .uniqueResult();
    }
    
    @Transactional
    public User findById(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from User where id = :id", User.class)
                .setParameter("id", id)
                .uniqueResult();
    }


    @Transactional
    public void save(User user) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(user);
    }

    @Transactional
    public List<User> findAll() {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from User", User.class).getResultList();
    }
    
    @Transactional
    public List<User> findByRole(String role) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from User where role = :role", User.class)
                .setParameter("role", role)
                .getResultList();
    }

    @Transactional
    public void delete(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        User user = currentSession.get(User.class, id);
        if (user != null) {
            currentSession.delete(user);
        }
    }
    
    @Transactional
    public boolean existsByUsername(String username) {
        Session currentSession = sessionFactory.getCurrentSession();
        Long count = currentSession.createQuery(
            "select count(*) from User where username = :username", Long.class)
            .setParameter("username", username)
            .uniqueResult();
        return count > 0;
    }
    
    @Transactional
    public boolean existsByEmail(String email) {
        Session currentSession = sessionFactory.getCurrentSession();
        Long count = currentSession.createQuery(
            "select count(*) from User where email = :email", Long.class)
            .setParameter("email", email)
            .uniqueResult();
        return count > 0;
    }
    
    @Transactional
    public void saveCrew(Crew crew) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(crew);
   }
}