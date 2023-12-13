package es.darioabuin.loginJPA.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

public class ThreadDAO {
	public List<es.darioabuin.loginJPA.entities.Thread> getLast10Threads(EntityManager em) {
		TypedQuery<es.darioabuin.loginJPA.entities.Thread> query = em.createQuery("SELECT t FROM Thread t ORDER BY t.creationDate", es.darioabuin.loginJPA.entities.Thread.class);
		return query.getResultList();
	}
	
	public es.darioabuin.loginJPA.entities.Thread getThreadById(EntityManager em, int threadId) {
		return em.find(es.darioabuin.loginJPA.entities.Thread.class, threadId);
	}
	
	public void createThread(EntityManager em, es.darioabuin.loginJPA.entities.Thread th) {
		em.persist(th);
	}
}
