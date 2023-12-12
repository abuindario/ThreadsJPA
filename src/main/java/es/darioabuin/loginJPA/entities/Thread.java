package es.darioabuin.loginJPA.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Thread {
	 @Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 private int id;
	 private String threadName;
	 @OneToMany(mappedBy="thread", cascade = {CascadeType.ALL}, orphanRemoval = true, fetch = FetchType.EAGER)
	 private List<Message> messages;
	 @ManyToOne
	 @JoinColumn(name="user_id")
	 private User creator;
}
