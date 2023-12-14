package es.darioabuin.loginJPA.dao;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import es.darioabuin.loginJPA.entities.Message;

public class MessageDAO {
	public void postMessage(EntityManager em, Message message) {
		em.persist(message);
	}
	
	public Message deleteMessageById(EntityManager em, int messageId) {
		//return em.find(Message.class, messageId);
		TypedQuery<Message> query = em.createQuery("SELECT m FROM Message m WHERE m.id=:messageId", Message.class);
		query.setParameter("messageId", messageId);
		return query.getSingleResult();
	}
	
}
