package com.dds.app.product.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductVo {

	private String no;
	private String cNo;
	private String name;
	private String price;
	private String info;
	private String component;
	private String material;
	private String pSize;
	private String gk;
	private String kk;
	private String lk;
	private String qe;
	private String ss;
	private String country;
	private String advantage;
	private String stock;
	private MultipartFile img;
	private String imgName;
	private String enrollDate;
	private String modifyDate;
	private String status;
	private String hit;
	private String star;
	private List<ProductFileVo> attList;
	private String[] getAttNo;
}
