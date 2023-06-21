package com.dds.app.product.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dds.app.common.file.FileUploader;
import com.dds.app.member.vo.MemberVo;
import com.dds.app.product.service.ProductService;
import com.dds.app.product.vo.PCategoryVo;
import com.dds.app.product.vo.ProductFileVo;
import com.dds.app.product.vo.ProductVo;

/**
 * 
 * @author 종찬
 *
 */
@Controller
@RequestMapping("product")
public class ProductController {

	private final ProductService ps;
	
	@Autowired
	public ProductController(ProductService ps) {
		this.ps = ps;
	}
	
	/**
	 * 상품 추가 화면 메소드
	 * 
	 * @param model
	 * @return 상품 추가 페이지
	 */
	@GetMapping("add")
	public String write(Model model) {	
		List<PCategoryVo> category = ps.getCategory();
		
		model.addAttribute("category",category);
		return "product/add";
	}
	
	/**
	 * 상품 추가 기능 메소드
	 * 
	 * @param 화면에서 보내주는 상품 정보 vo
	 * @param fList 상세 이미지 파일
	 * @param req 파일의 주소를 가져오기 위함
	 * @return 추가 메소드를 성공적으로 동작하면 list로 redirect 시켜준다.
	 * @throws Exception
	 */
	//상품 등록하기 (관리자만)
	@PostMapping("add")
	public String add(ProductVo vo , List<MultipartFile> fList , HttpServletRequest req) throws Exception{
		
		//데이터 준비 (파일)
		String path = req.getServletContext().getRealPath("/resources/upload/product/");
		String originName = FileUploader.originUpload(vo.getImg(), path);
		vo.setImgName(originName);
		
		
		//데이터 준비 (파일)
		String path2 = req.getServletContext().getRealPath("/resources/upload/product/detail/");
		List<String> originNameList = new ArrayList<String>();
		for(MultipartFile f : fList) {
			String originName2 = f.getOriginalFilename();
			originNameList.add(originName2);
			
			File target = new File(path2+originName2);
			try {
				f.transferTo(target);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//데이터 준비 (이름 리스트)
		List<ProductFileVo> fvoList = new ArrayList<ProductFileVo>();
		int size = originNameList.size();
		for (int i = 0; i < size; i++) {
			ProductFileVo fvo = new ProductFileVo();
			fvo.setOriginName(originNameList.get(i));
			fvoList.add(fvo);
		}
		
		
		//데이터 준비 (카테고리)

		
		
		if("없음".equals(vo.getCNo())) {
			vo.setCNo(null);
		}
		
		int result = ps.add(vo , fvoList);
		if( originNameList != null && result < 1 ) {	
			throw new Exception("게시글 작성 실패 ...");
		}
		
		return "redirect:/product/list";
	}
	
	/**
	 * 상품 목록 조회 화면 메소드
	 * 
	 * @param model 상품 정보를 조회하여 화면에 보여주기 위함
	 * @return list 화면
	 */
	@GetMapping("list")
	public String list(Model model) {
		
		List<ProductVo> pvoList = ps.getProductList();
		
		model.addAttribute("pvoList", pvoList);
		return "product/list";
	}
	
	/**
	 * 카테고리 선택하면 새롭게 보여주는 메소드
	 * ajax처리
	 * 
	 * @param model
	 * @param category
	 * @return 카테고리에 맞는 것을 ajax통신을 통해 return
	 */
	@PostMapping("list")
	@ResponseBody
	public List<ProductVo> list(Model model, @RequestParam("category") String category) {
		
		List<ProductVo> pvoList = ps.getProductList();
		System.out.println(pvoList);
		
		return pvoList;
	}
	
	/**
	 * 상세조회 화면 메소드
	 * 
	 * @param num list에서 전달받는 상품 번호
	 * @param model
	 * @return 상품 상세조회 경로
	 * @throws Exception
	 */
	//상품 상세조회
	@GetMapping("detail")
	public String detail(String num , Model model) throws Exception {
		
		ProductVo pvo = ps.getProduct(num);
		
		if(pvo == null) {
			model.addAttribute("errorMsg", "조회 실패...");
			return "common/error-page";
		}
		
		model.addAttribute("pvo" , pvo);
		model.addAttribute("path" , "resources/upload/product/detail");
		return "product/detail";
	}
	
	/**
	 * 상품 수정 화면 메소드
	 * 
	 * @param num 상품 번호
	 * @param model
	 * @return 상품 수정 화면
	 * @throws Exception
	 */
	@GetMapping("edit/{num}")
	public String edit(@PathVariable String num, Model model) throws Exception {
		
		List<PCategoryVo> category = ps.getCategory();
		
		ProductVo pvo = ps.getProduct(num);
		
		if(pvo == null) {
			model.addAttribute("errorMsg", "조회 실패...");
			return "common/error-page";
		}
		
		model.addAttribute("pvo", pvo);
		model.addAttribute("category",category);
		model.addAttribute("path" , "resources/upload/product/detail");
		
		return "product/edit";
	}
	
	/**
	 * 상품 수정 기능 메소드
	 * 
	 * @param vo 상품 정보들
	 * @param session
	 * @param fList 수정할 파일들
	 * @param req 경로 얻기 위함
	 * 
	 * @return 수정 완료되면 상품 목록으로 redirect
	 * @throws Exception
	 */
	//상품 수정하기 (관리자만)
		@PostMapping("edit")
		public String edit(ProductVo vo , HttpSession session, List<MultipartFile> fList , HttpServletRequest req) throws Exception{
			
			//데이터 준비 (파일)
			String path = req.getServletContext().getRealPath("/resources/upload/product/");
			String originName = FileUploader.originUpload(vo.getImg(), path);
			vo.setImgName(originName);
			
			
			//데이터 준비 (파일)
			String path2 = req.getServletContext().getRealPath("/resources/upload/product/detail/");
			List<String> originNameList = new ArrayList<String>();
			for(MultipartFile f : fList) {
				String originName2 = f.getOriginalFilename();
				originNameList.add(originName2);
				
				File target = new File(path2+originName2);
				try {
					f.transferTo(target);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			//데이터 준비 (이름 리스트)
			List<ProductFileVo> fvoList = new ArrayList<ProductFileVo>();
			int size = originNameList.size();
			String[] getAttNo = vo.getGetAttNo();
			for (int i = 0; i < size; i++) {
				ProductFileVo fvo = new ProductFileVo();
				String no = getAttNo[i];
				String pNo = vo.getNo();
				fvo.setNo(no);
				fvo.setPNo(pNo);
				fvo.setOriginName(originNameList.get(i));
				fvoList.add(fvo);
			}
			
			//데이터 준비 (카테고리)
			
			if("없음".equals(vo.getCNo())) {
				vo.setCNo(null);
			}
			int result = ps.edit(vo , fvoList);
			if( originNameList != null && result != -1 ) {	
				throw new Exception("상품 수정 실패 ...");
			}
			
			return "redirect:/product/list";
		}
	
		/**
		 * 상품 삭제 메소드
		 * 
		 * @param no 상품 번호
		 * @return list로 redirect
		 * @throws Exception
		 */
	//상품 삭제하기 (관리자만)
	@GetMapping("delete/{no}")
	public String delete(@PathVariable String no) throws Exception {
		int result = ps.delete(no);
		
		if(result != 1) {
			throw new Exception("공지사항 삭제 실패 ...");
		}
		
		return "redirect:/product/list";
	}
	
}
