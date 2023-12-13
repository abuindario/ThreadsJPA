package es.darioabuin.loginJPA.dao;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import es.darioabuin.loginJPA.entities.User;

public class UserDAO {
	public User getPassword(EntityManager em, String uname, String upass) {
		TypedQuery<User> query = em.createQuery("SELECT u FROM User u WHERE u.username=:user AND u.password=:pass", User.class);
		query.setParameter("user", uname);
		query.setParameter("pass", upass);
		return query.getSingleResult();
	}
	
	public User checkEmail(EntityManager em, String email) {
		TypedQuery<User> query = em.createQuery("SELECT u FROM User u WHERE u.email=:email", User.class);
		query.setParameter("email", email);
		return query.getSingleResult();
	}
	
	public void register(User user, EntityManager em) {
		em.persist(user);
	}
	
}
