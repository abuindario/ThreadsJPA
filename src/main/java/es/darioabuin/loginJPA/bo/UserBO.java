package es.darioabuin.loginJPA.bo;

import javax.persistence.EntityManager;

import es.darioabuin.loginJPA.connection.EntityManagerSingleton;
import es.darioabuin.loginJPA.dao.UserDAO;
import es.darioabuin.loginJPA.entities.User;

public class UserBO {
	public User checkUser(String uname, String upass) {
		EntityManager em = EntityManagerSingleton.getEntityManager();
		UserDAO udao = new UserDAO();
		User logged = udao.getPassword(em, uname, upass);
		em.close();
		return logged;
	}
	
	public Boolean checkEmail(String email) {
		EntityManager em = EntityManagerSingleton.getEntityManager();
		UserDAO udao = new UserDAO();
		User user = null;
		try {			
			user = udao.checkEmail(em, email);
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		em.close();
		return user != null ? true : false;
	}
	
	public void register(User user) {
		EntityManager em = EntityManagerSingleton.getEntityManager();
		em.getTransaction().begin();
		UserDAO udao = new UserDAO();
		udao.register(user, em);
		em.getTransaction().commit();
		em.close();
	}
	
}
