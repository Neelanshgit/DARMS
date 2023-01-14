package com.example.darms.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public abstract class DataObjectTwo implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id 
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "codegen")
    @Column(name = "code")
	private int code;
	
}
