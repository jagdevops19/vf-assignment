package com.vf.entities;

import java.io.Serializable;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
/**
 * This is the Entity bean that maps to APP_TIMESTAMPS table
 */

@Entity
@Table(name = "app_timestamp")
@EntityListeners(AuditingEntityListener.class)
public class AppTimeStamp implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@CreatedDate
	@Column(name = "date_timestamp")
	private LocalDateTime dateTimeStamp;

	// default constructor
	public AppTimeStamp() {

	}

	public AppTimeStamp(Long id, LocalDateTime dateTimeStamp) {
		super();
		this.id = id;
		this.dateTimeStamp = dateTimeStamp;
	}

	// getters and setters
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public LocalDateTime getDateTimeStamp() {
		return dateTimeStamp;
	}

	public void setDateTimeStamp(LocalDateTime dateTimeStamp) {
		this.dateTimeStamp = dateTimeStamp;
	}
}
