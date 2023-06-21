package com.dds.app.pay.controller;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.dds.app.member.service.MemberService;
import com.dds.app.pay.vo.PayVo;
import com.dds.app.product.service.ProductService;
import com.dds.app.product.vo.ProductVo;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

/**
 * 
 * @author 종찬
 *
 */
@Controller
public class PayController {
	
	private final ProductService ps;
	private final MemberService ms;
	
	@Autowired
	public PayController(ProductService ps, MemberService ms) {
		this.ms = ms;
		this.ps = ps;
	}

	/**
	 * 상품 결제 화면 메소드
	 * cookie에 존재하는 장바구니 목록을 가져와 띄워준다
	 * 
	 * @param cartItems 장바구니 상품 목록
	 * @param totalPrice 총 금액
	 * @param model
	 * @return 결제 화면 경로
	 */
	@GetMapping("pay")
	public String pay(@RequestParam("cartItems") String cartItems, @RequestParam("totalPrice") String totalPrice, Model model) {
		
		// Gson 객체 생성
	    Gson gson = new Gson();

	    // cartItemsJson을 List<String> 형태의 Java 객체로 변환
	    Type type = new TypeToken<List<String>>() {}.getType();
	    List<String> cart = gson.fromJson(cartItems, type);
	    
	    List<ProductVo> pvoList = new ArrayList<ProductVo>();
	    for (String productName : cart) {
	        ProductVo product = ps.getPayList(productName);
	        if (product != null) {
	            pvoList.add(product);
	        }
	    }
	    
	    model.addAttribute("pvoList",pvoList);
		model.addAttribute("totalPrice",totalPrice);
		model.addAttribute("cart",cart);
		return "pay/pay";
	}
	
	/**
	 * kakaopay 결제 후 이동되는 메소드
	 * 
	 * @param payVo 결제 후 받는 정보
	 * @return 결제 완료 화면으로 redirect
	 * @throws Exception
	 */
	@GetMapping("payAdd")
	public String payComplate(PayVo payVo) throws Exception {
		
		int result = ps.addPay(payVo);
		
		return "redirect:/pay/payComp";
	}
	
	/**
	 * kakaopay 결제 후 결제 정보 추가 하고 이동되는 메소드
	 * 
	 * @param request 결제 후 장바구니의 쿠키가 삭제되게 쿠키를 가져오기 위함
	 * @param response 삭제된 쿠키들의 정보를 클라이언트 측으로 전달
	 * @param model
	 * @return 결제 완료 경로
	 */
	@GetMapping("payComp")
	public String payComplate(HttpServletRequest request, HttpServletResponse response, Model model) {
	    // 현재 요청에 대한 모든 쿠키 가져오기
	    Cookie[] cookies = request.getCookies();
	    
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if (cookie.getName().startsWith("cart_")) {
	                // "cart"라는 이름을 가진 쿠키 삭제
	                cookie.setValue("");
	                cookie.setMaxAge(0);
	                response.addCookie(cookie);
	            }
	        }
	    }
	    
	    PayVo payVo = ms.getPay();
	    
	    model.addAttribute("pay",payVo);
	    return "pay/payComp";
	}
	
	/**
	 * 상품 결제 목록 보여주는 메소드
	 * 
	 * @param no 회원 번호
	 * @param model
	 * @return 결제 목록 화면 경로
	 */
	@GetMapping("payList/{no}")
	public String payList(@PathVariable String no, Model model) {
		
		List<PayVo> payList = ms.getPayList(no);
		
		model.addAttribute("payList", payList);
		return "pay/payList";
	}
	
	

	
}
