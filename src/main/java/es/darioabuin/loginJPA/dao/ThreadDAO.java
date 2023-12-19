package es.darioabuin.loginJPA.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

public class ThreadDAO {
	public List<es.darioabuin.loginJPA.entities.Thread> getLast10Threads(EntityManager em) {
		TypedQuery<es.darioabuin.loginJPA.entities.Thread> query = em.createQuery("SELECT t FROM Thread t ORDER BY t.creationDate DESC", es.darioabuin.loginJPA.entities.Thread.class);
		return query.getResultList();
	}
	
	public es.darioabuin.loginJPA.entities.Thread getThreadById(EntityManager em, int threadId) {
		return em.find(es.darioabuin.loginJPA.entities.Thread.class, threadId);
	}
	
	public void persistThread(EntityManager em, es.darioabuin.loginJPA.entities.Thread th) {
		em.persist(th);
	}
	
	public void deleteThreadById(EntityManager em, int threadId) {
		es.darioabuin.loginJPA.entities.Thread thread = em.find(es.darioabuin.loginJPA.entities.Thread.class, threadId);
		em.remove(em.contains(thread) ? thread : em.merge(thread));
	}
}
