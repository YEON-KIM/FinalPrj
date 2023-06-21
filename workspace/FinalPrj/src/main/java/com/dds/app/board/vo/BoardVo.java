package com.dds.app.board.vo;

import java.util.List;

import com.dds.app.common.file.FileVo;

import lombok.Data;

@Data
public class BoardVo {
	
	private String no;
	private String title;
	private String content;
	private String writerNo;
	private String categoryNo;
	private String enrollDate;
	private String status;
	private String modifyDate;
	private String hit;
	private String[] color;
	private String colorStr;
	private String[] mood;
	private String moodStr;
	private String exchange;
	private String writerName;
	private String categoryName;
	private List<FileVo> attList;

	
	
	
	
	
	public void setColor(String[] color) {
		this.color = color;
		if(color != null) {
			this.colorStr = String.join(",", color);
		}
	}
	
	public void setMood(String[] mood) {
		this.mood = mood;
		if(mood != null) {
			this.moodStr = String.join(",", mood);
		}
	}
	

}
