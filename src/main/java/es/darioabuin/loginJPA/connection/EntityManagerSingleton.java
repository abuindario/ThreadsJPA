package es.darioabuin.loginJPA.connection;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class EntityManagerSingleton{
	private static EntityManagerFactory emf;

	public static EntityManager getEntityManager() {	
		if (emf == null) {
			 emf = Persistence.createEntityManagerFactory("TEST_PERSISTENCE_JPA");
		}
		EntityManager em = emf.createEntityManager();
		return em;
	}
}
