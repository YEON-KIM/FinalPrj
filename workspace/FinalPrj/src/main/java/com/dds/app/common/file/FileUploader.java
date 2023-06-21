package com.dds.app.common.file;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FileUploader {

	/**
	 * 파일명을 중복되지 않게 업로드 하는 메소드
	 * 
	 * @param 업로드파일
	 * @param 경로
	 * @return 바뀐 이름
	 */
	//upload는 단일파일용 업로드할때 쓰는 메소드 ex)프로필
	public static String changeUpload(MultipartFile f, String path) {
	
		if (f == null || f.isEmpty()) {return null;}
		
	
		String changeName = generateChangeName(f);
		
	
		File target = new File(path + changeName);
		try {
			f.transferTo(target);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return changeName;
	}
	/**
	 * 파일명 그대로 업로드 하는 메소드
	 * 
	 * @param 업로드파일
	 * @param 경로
	 * @return 원본파일명
	 * 
	 * @author 종찬
	 */
	public static String originUpload(MultipartFile f, String path) {
		
		if (f == null || f.isEmpty()) {return null;}
	
		String originName = f.getOriginalFilename();
		
	
		File target = new File(path + originName);
		try {
			f.transferTo(target);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return originName;
	}
	
	/**
	 * 여러개의 파일을 서버에 저장한다. 
	 * 저장한 파일명들을 리스트 형태로 리턴해준다.
	 * 
	 * @param 파일객체가 담긴 리스트
	 * @param 파일을 저장할경로
	 * @return 서버에 저장된 파일명들이 담긴 리스트
	 */
	public static List<String> upload(List<MultipartFile> fList, String path) {
		//파일이 있는지
		if (fList == null || fList.size() == 0 || fList.get(0).isEmpty()) {return null;}
		
		List<String> changeNameList = new ArrayList<String>();
		for(MultipartFile f : fList) {
			//changeName 만들기
			String changeName = generateChangeName(f);
			
			changeNameList.add(changeName);
			
			//서버에 저장
			File target = new File(path + changeName);
			try {
				f.transferTo(target);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return changeNameList;
	}
	
	/**
	 * 현재 날짜 및 전달받은 파일 객체의 확장자 를 이용하여 문자열을 만들어낸다.
	 * 
	 * @param 파일객체
	 * @return 랜덤한파일명
	 */
	
	private static String generateChangeName(MultipartFile f) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String currentTime = sdf.format(new Date());
		int randomNum = (int)(Math.random() * 90000 + 10000);
		String originName = f.getOriginalFilename();
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + "_" + randomNum + ext;
		
		return changeName;
	}
	
	public static List<String> getOriginNameList(List<MultipartFile> fList) {
		
		//파일 비었는지 체크
		if(fList == null || fList.size() == 0 || fList.get(0).isEmpty()) {
			return null;
		}
		
		List<String> originNameList = new ArrayList<String>();
		
		for(MultipartFile f : fList) {
			String name = f.getOriginalFilename();
			originNameList.add(name);
		}
		
		return originNameList;
	}
}
