package es.darioabuin.loginJPA.bo;

import javax.persistence.EntityManager;

import es.darioabuin.loginJPA.connection.EntityManagerSingleton;
import es.darioabuin.loginJPA.dao.MessageDAO;
import es.darioabuin.loginJPA.entities.Message;

public class MessageBO {
	public void postMessage(Message message) {
		EntityManager em = EntityManagerSingleton.getEntityManager();
		em.getTransaction().begin();
		MessageDAO mdao = new MessageDAO();
		mdao.postMessage(em, message);
		em.getTransaction().commit();
		em.close();
	}
	
	public void deleteMessageById(int messageId, int threadId) {
		EntityManager em = EntityManagerSingleton.getEntityManager();
		em.getTransaction().begin();
		MessageDAO mdao = new MessageDAO();
		es.darioabuin.loginJPA.entities.Thread thread = em.find(es.darioabuin.loginJPA.entities.Thread.class, threadId);
		Message message = mdao.deleteMessageById(em, messageId);
		thread.getMessages().remove(thread.getMessages().indexOf(message));
		em.remove(em.contains(message) ? message : em.merge(message));
		em.getTransaction().commit();
		em.close();
	}
}
