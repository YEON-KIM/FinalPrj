package com.dds.app.cart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 장바구니 컨트롤러
 * @author 종찬
 */
@Controller
public class CartController {

	
	/**
	 * 장바구니 정보 가져오는 메소드
	 * 
	 * @param request ( 쿠키에 저장된 값을 가져오기 위해 )
	 * @return cartItems ( 장바구니 요소들 )
	 * 
	 */
	@ResponseBody
	@GetMapping("/cart")
    public List<String> getCart(HttpServletRequest request) {
        List<String> cartItems = new ArrayList<>();
        
        // 쿠키에서 장바구니 정보를 읽어옴
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().startsWith("cart_")) {
                    cartItems.add(cookie.getValue());
                }
            }
        }
        return cartItems;
    }

	/**
	 * 장바구니에 상품을 추가하는 메소드 ( 쿠키활용 )
	 * 
	 * @param productId 상품 번호
	 * @param productName 상품 이름
	 * @param productImg 상품 이미지
	 * @param productPrice 상품 가격
	 * @param response
	 * 
	 */
   	@PostMapping("/cart/add")
    public void addToCart(@RequestParam("productId") String productId,
                          @RequestParam("productName") String productName,
                          @RequestParam("productImg") String productImg,
                          @RequestParam("productPrice") String productPrice,
                          HttpServletResponse response) {
        // 장바구니에 추가할 상품 정보를 받아옴
        // ...

        // 장바구니 정보를 쿠키에 저장
   		String cartValue = productName + "|" + productImg + "|" + productPrice;
   		Cookie cartCookie = new Cookie("cart_" + productId, cartValue);

        cartCookie.setMaxAge(30 * 24 * 60 * 60); // 쿠키의 유효기간 설정 (초 단위) 한달
        response.addCookie(cartCookie);
    }

   	
   	/**
   	 * 장바구니 안의 상품을 선택하여 삭제하는 메소드
   	 * 
   	 * @param productId 상품 이름
   	 * @param response 쿠키를 새롭게 업데이트 하기 위함
   	 * 
   	 */
   	@GetMapping("/cart/remove")
   	@ResponseBody
   	public String removeFromCart(@RequestParam("productId") int productId,
   	                             HttpServletResponse response) {
   	    // 선택된 상품의 쿠키를 삭제
   	    Cookie cartCookie = new Cookie("cart_" + productId, "");
   	    cartCookie.setMaxAge(0); // 쿠키의 유효기간을 0으로 설정하여 삭제
   	    response.addCookie(cartCookie);

   	    System.out.println(productId);
   	    
   	    return "";
   	}

}


