package com.mythri.dao;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mythri.entity.Login;

@Repository("LoginDAO")
public class LoginDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void save(Login login) {
		sessionFactory.getCurrentSession().saveOrUpdate(login);
	}
	
	public Login getLoginDetails(Integer id) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("SELECT l FROM Login l WHERE l.id=(select e.login.id from Employee e where e.id=:id)");
		query.setParameter("id", id);
		Login login = (Login)query.uniqueResult();
		session.close();
		return login;
	}

	public void updateAttempts(Integer id) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("update Login l set l.attempts=l.attempts+1 where l.id=(select e.login.id from Employee e where e.id=:id)");
		query.setParameter("id", id);
		
		Transaction transaction = session.getTransaction();
		transaction.begin();
		query.executeUpdate();
		transaction.commit();
		session.close();
	}

	public void resetAttempts(Integer id) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("update Login l set l.attempts=0 where l.id=(select e.login.id from Employee e where e.id=:id)");
		query.setParameter("id", id);

		Transaction transaction = session.getTransaction();
		transaction.begin();
		query.executeUpdate();
		transaction.commit();
		session.close();
	}
}
