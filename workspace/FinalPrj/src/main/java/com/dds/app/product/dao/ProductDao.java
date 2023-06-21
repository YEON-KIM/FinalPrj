package com.dds.app.product.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dds.app.pay.vo.PayVo;
import com.dds.app.product.vo.PCategoryVo;
import com.dds.app.product.vo.ProductFileVo;
import com.dds.app.product.vo.ProductVo;

@Repository
public class ProductDao {

	public List<ProductVo> getProductList(SqlSessionTemplate sst) {
		return sst.selectList("product.getProductList");
	}

	public int add(SqlSessionTemplate sst, ProductVo vo) {
		return sst.insert("product.add" , vo);
	}

	public ProductVo getProduct(SqlSessionTemplate sst, String num) {
		return sst.selectOne("product.getProduct" , num);
	}

	public int edit(SqlSessionTemplate sst, ProductVo vo) {
		return sst.update("product.edit" , vo);
	}

	public int delete(SqlSessionTemplate sst, String no) {
		return sst.delete("product.delete",no);
	}

	public int insertAttachment(SqlSessionTemplate sst, List<ProductFileVo> fvoList) {
		return sst.insert("product.insertAttachment" , fvoList);
	}

	public List<PCategoryVo> getCategory(SqlSessionTemplate sst) {
		return sst.selectList("product.getCategory");
	}

	public int increaseHit(SqlSessionTemplate sst, String num) {
		return sst.update("product.increaseHit",num);
	}

	public List<ProductFileVo> getAttachmentList(SqlSessionTemplate sst, String num) {
		return sst.selectList("product.getAttachmentList", num);
	}

	public ProductVo getPayList(SqlSessionTemplate sst, String productName) {
		return sst.selectOne("product.getPayList",productName);
	}

	public int addPay(SqlSessionTemplate sst, PayVo payVo) {
		return sst.insert("product.addPay",payVo);
	}

	public int updateAttachment(SqlSessionTemplate sst, List<ProductFileVo> fvoList) {
		return sst.update("product.updateAttachment",fvoList);
	}

}//class
