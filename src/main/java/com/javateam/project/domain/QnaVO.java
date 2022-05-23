package com.javateam.project.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class QnaVO {
	
	private int   qseq; 
	private String subject; 
	private String content;
	private String reply;
	private String id; 
	private String rep; 
	private Timestamp indate;

}
