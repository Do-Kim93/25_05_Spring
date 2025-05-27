package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ArticleReply {

	private int id;
	private String regDate;
	private String updateDate;
	private int memberId;
	private String relTypeCode;
	private String title;
	private String body;
	private int relId;
	private int goodReactionPoint;
	private int badReactionPoint;

	private String extra__writer;
	
	private String extra__sumReactionPoint;
	
	
	private boolean userCanModify;
	private boolean userCanDelete;
}