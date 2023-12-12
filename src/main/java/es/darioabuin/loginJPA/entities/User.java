package es.darioabuin.loginJPA.entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class User {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String firstName;
	private String lastName;
	private String email;
	private String username;
	private String password;
	@OneToMany(mappedBy="creator")
	private List<Thread> threads;
	@OneToMany(mappedBy="sender")
	private List<Message> messages;

	public User() {}
	
	public User(String fname, String lname, String email, String uname, String upass) {
		this.firstName = fname;
		this.lastName = lname;
		this.email = email;
		this.username = uname;
		this.password = upass;
	}
}
