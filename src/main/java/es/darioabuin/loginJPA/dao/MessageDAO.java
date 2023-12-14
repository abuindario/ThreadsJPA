package es.darioabuin.loginJPA.dao;

import javax.persistence.EntityManager;

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
	
}
