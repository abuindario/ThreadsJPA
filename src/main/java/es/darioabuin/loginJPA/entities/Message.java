package es.darioabuin.loginJPA.entities;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Message {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@ManyToOne
	@JoinColumn(name="thread_id")
	private Thread thread;
	@ManyToOne
	@JoinColumn(name="user_id")
	private User sender;
	private Date creationDate;
	private String formattedDate;
	private String content;
	
	public Message() {}
	
	public Message(String content, User user, es.darioabuin.loginJPA.entities.Thread thread) {
		this.creationDate = Calendar.getInstance().getTime();
		this.content = content;
		this.sender = user;
		this.thread = thread;
		String pattern = "HH:mm, dd MMM YYYY";
		SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
		this.formattedDate = dateFormat.format(this.creationDate);
	}
}
