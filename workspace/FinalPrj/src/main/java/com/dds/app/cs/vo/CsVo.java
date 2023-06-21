package com.dds.app.cs.vo;

import lombok.Data;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.dds.app.common.file.FileVo;

@Data
public class CsVo {

    private String no;
    private String writer;
    private String title;
    private String content;
    private String category;
    
    private String answerStatus;
    private String enrollDate;
    private String answerDate;
    private String answerContent;
    private List<FileVo> attList;

    //command+shift+u  > 소문자화
}
