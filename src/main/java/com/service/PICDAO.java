package com.service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.model.PIC;

import java.util.List;

@Service
public class PICDAO {

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
	public PIC getPICByUserId(int userId) {
	    String hql = "FROM pic WHERE user_id = :userId";
	    return getCurrentSession()
	            .createQuery(hql, PIC.class)
	            .setParameter("userId", userId)
	            .uniqueResult();
	}

	@Transactional
	@SuppressWarnings("unchecked")
	public List<PIC> getAllPICs() {
		return getCurrentSession().createQuery("from pic").list();
	}

	@Transactional
	public void deleteTeacher(int id) {
		PIC pic= getPIC(id);
		if (pic != null) {
			getCurrentSession().delete(pic);
		}
	}
}