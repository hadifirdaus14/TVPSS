package com.service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.model.PIC;
import com.model.School;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Service
public class PICDAO {

	@PersistenceContext
	private EntityManager entityManager;

	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	@Transactional
	public void savePIC(PIC pic) {
		getCurrentSession().saveOrUpdate(pic);
	}

	@Transactional
	public PIC getPIC(int id) {
		return getCurrentSession().get(PIC.class, id);
	}

	@Transactional
	public PIC findById(int id) {
		return getCurrentSession().get(PIC.class, id);
	}

	@Transactional
	public PIC getPICById(int id) {
	    return entityManager.find(PIC.class, id);
	}
	
	@Transactional
	public PIC getPICByUserId(int userId) {
		String hql = "FROM pic WHERE user_id = :userId";
		return getCurrentSession().createQuery(hql, PIC.class).setParameter("userId", userId).uniqueResult();
	}

	@Transactional
	public List<PIC> getAllPICs() {
		// Using EntityManager to fetch all PICs
		return entityManager.createQuery("FROM PIC", PIC.class).getResultList();
	}
	
	@Transactional
    public void updatePIC(PIC pic) {
		System.out.println("Updating PIC: " + pic);	
        entityManager.merge(pic);
    }

	@Transactional
	public void deletePIC(int id) {
		PIC pic = getPIC(id);
		if (pic != null) {
			getCurrentSession().delete(pic);
		}
	}
}