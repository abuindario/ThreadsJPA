package es.darioabuin.loginJPA.bo;

import java.util.List;

import javax.persistence.EntityManager;

import es.darioabuin.loginJPA.connection.EntityManagerSingleton;
import es.darioabuin.loginJPA.dao.ThreadDAO;

public class ThreadBO {
	public List<es.darioabuin.loginJPA.entities.Thread> getLast10Threads() {
		EntityManager em = EntityManagerSingleton.getEntityManager();
		ThreadDAO tdao = new ThreadDAO();
		List<es.darioabuin.loginJPA.entities.Thread> threads = tdao.getLast10Threads(em);
		em.close();
		return threads;
	}
	
	public es.darioabuin.loginJPA.entities.Thread getThreadById(int threadId) {
		EntityManager em = EntityManagerSingleton.getEntityManager();
		ThreadDAO tdao = new ThreadDAO();
		es.darioabuin.loginJPA.entities.Thread thread = tdao.getThreadById(em, threadId);
		em.close();
		return thread;
	}
	
	public void createThread(es.darioabuin.loginJPA.entities.Thread th) {
		EntityManager em = EntityManagerSingleton.getEntityManager();
		em.getTransaction().begin();
		ThreadDAO tdao = new ThreadDAO();
		tdao.createThread(em, th);
		em.getTransaction().commit();
		em.close();
	}
}
