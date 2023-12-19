package es.darioabuin.loginJPA.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import es.darioabuin.loginJPA.entities.Message;

public class MessageDAO {
	public void postMessage(EntityManager em, Message message) {
		em.persist(message);
	}
	
	public Message getMessageById(EntityManager em, int messageId) {
		return em.find(Message.class, messageId);
	}
	
	public void deleteMessage(EntityManager em, Message message) {
		em.remove(em.contains(message) ? message : em.merge(message));
	}
	
	public List<Message> getMessages(EntityManager em, es.darioabuin.loginJPA.entities.Thread thread) {
		TypedQuery<Message> query = em.createQuery("SELECT m FROM Message m WHERE m.thread=:condition ORDER BY m.creationDate DESC", Message.class);
		query.setParameter("condition", thread);
		return query.getResultList();
	}
	
}
