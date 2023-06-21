package com.dds.app.product.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dds.app.pay.vo.PayVo;
import com.dds.app.product.dao.ProductDao;
import com.dds.app.product.vo.PCategoryVo;
import com.dds.app.product.vo.ProductFileVo;
import com.dds.app.product.vo.ProductVo;

@Service
@Transactional
public class ProductService {
	
	private final SqlSessionTemplate sst;
	private final ProductDao dao;
	
	@Autowired
	public ProductService(SqlSessionTemplate sst , ProductDao dao) {
		this.sst = sst;
		this.dao = dao;
	}
	//목록 조회
	public List<ProductVo> getProductList() {
		return dao.getProductList(sst);
	}
	//상품 추가
	public int add(ProductVo vo, List<ProductFileVo> fvoList) throws Exception {
		int productResult = dao.add(sst, vo);
		if(productResult != 1) {
			throw new Exception();
		}
		return dao.insertAttachment(sst , fvoList);
	
	}
	//상품 상세화면
	public ProductVo getProduct(String num) throws Exception {
		int result = dao.increaseHit(sst, num);
		if(result != 1) {
			throw new Exception();
		}
		ProductVo pvo = dao.getProduct(sst, num);
		List<ProductFileVo> fileList = dao.getAttachmentList(sst , num);
		pvo.setAttList(fileList);
		return pvo;
	}
	//상품 삭제
	public int delete(String no) {
		return dao.delete(sst,no);
	}
	//상품 카테고리 리스트
	public List<PCategoryVo> getCategory() {
		return dao.getCategory(sst);
	}
	//결제 목록
	public ProductVo getPayList(String productName) {
		return dao.getPayList(sst,productName);
	}
	//결제 정보 추가
	public int addPay(PayVo payVo) {
		return dao.addPay(sst,payVo);
	}
	//상품 수정
	public int edit(ProductVo vo, List<ProductFileVo> fvoList) throws Exception {
		int productResult = dao.edit(sst, vo);
		if(productResult != 1) {
			throw new Exception();
		}
		return dao.updateAttachment(sst , fvoList);
	}

}