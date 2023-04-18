package com.liclass.common.file;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class StudioFileUpload {

	/********************************************************************************
	 * 파일 업로드할 폴더 생성
	 * static 메서드
	 *  C://uploadLiClass 안에 xx라는 폴더가 존재하니?
	 *
	 ********************************************************************************/
	public static void makeDir(String docRoot) {
		
		File fileDir = new File(docRoot);
		if(fileDir.exists()) {
			return;
		}
		
		fileDir.mkdirs();
	}
	
	/********************************************************************************
	 * 파일 업로드 메서드 
	 * 파일명이 중복시 해결 방법  - 개발자가 가공한다. 아래처럼 현재날짜시간추가,랜덤명(UUID)추가
	 * System.currentTimeMillis()를 사용하거나 UUID는 128비트의 수이다. 
	 * 표준 형식에서 UUID는 32개의 16진수로 표현되며 총 36개 문자(32개 문자와 4개의 하이픈)로 
	 * 된 8-4-4-4-12라는 5개의 그룹을 하이픈으로 구분한다. 이를테면 다음과 같다. 
	 * 이때 UUID.randomUUID().toString()를 이용해서 얻는다.
	 * 50e8400-e29b-41d4-a716-446655440000 (128비트의 숫자값,단 중간에 하이픈이 들어간다. 필요시 제거(replace사용))
	 * @param MultipartFile file : 클라이언트로 전달받은 파일이 매개변수로 들어온다. 
	 ********************************************************************************/
	public static String fileUpload(MultipartFile file,String fileName) throws IOException {  //fileName은 board라고 가정하자,
		log.info("fileUpload() 호출");
		
		String real_name = null;
		String org_name = file.getOriginalFilename(); //클라이언트가 전달한 그 파일 자체의 이름
		log.info("org_name (업로드할 파일명) : "+org_name);
		
		if(org_name != null && (!org_name.equals(""))) {
			real_name = fileName +"_"+System.currentTimeMillis()+"_"+org_name; //System.currentTimeMillis() = 가공하기위해 추가할 문구
						// board_202302231111_클라이언트가올린파일명
			
			String docRoot = "C://uploadLiClass//studio//"; 
			makeDir(docRoot); //이 폴더 없으면 생성해라
			
			File fileAdd = new File(docRoot+"/"+real_name);
			log.info("fileAdd : "+fileAdd);
			
			file.transferTo(fileAdd); //이 경로에 있는 파일을 저장해라 
		}
		
		//클라이언트가 업로드할때의 파일명 --(가공)---> 서버에 저장된 파일명 (이름이 바뀌었으니 그 파일명 반환해라)
		return real_name;
	}
	
	
	/********************************************************************************
	 * 파일 삭제 메서드 
	 * 경로 및 파일명:board/board_1658205347977_cat.jpg
	 * Thumbnail 경로 및 파일명: board/thumbnail/thumbnail_board_1658205347977_cat.jpg
	 ********************************************************************************/
	public static void fileDelete(String fileName) throws IOException{
		log.info("fileDelete() 호출");
		
		boolean result = false;
		String docRoot ="";
		docRoot = "C://uploadLiClass//studio//";
		log.info("삭제할 기존 프로필사진 : "+docRoot+"/"+fileName);
		
		File fileDelete = new File(docRoot+"/"+fileName);
		
		if(fileDelete.exists() && fileDelete.isFile()) {
			result = fileDelete.delete();
		}
		log.info("fileDelete() 호출 결과 : "+result);
	}
	
	/********************************************************************************
	 * 파일 Thumbnail 생성 메서드 - 받은 큰 이미지를 작게
	 * Thumbnail 경로 및 파일명: thumbnail/thumbnail_board_1658205347977_cat.jpg
	 *  => thumbnail이라는 폴더에 fileName이 thumbnail라고 정하고 real_name이 board_1658205347977_cat.jpg 파일
	 ********************************************************************************/
	
	public static String makeThumbnail(String fileName) throws Exception{ // fileName 원본 파일명 :  board_1658205347977_cat
		log.info("makeThumbnail() 호출");
		
		String dirName = fileName.substring(0,fileName.indexOf("_")); //board 만 추출
		
		String imgPath = "C://uploadLiClass//"+dirName;
		
		File fileAdd = new File(imgPath, fileName);
		log.info("fileAdd(원본파일) : "+fileAdd);
		
		BufferedImage sourceImg = ImageIO.read(fileAdd);
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT,133);
		
		String thumbnailName = "thumbnail_"+fileName;
		String docRoot = imgPath+"/thumbnail";
		makeDir(docRoot);
		
		File newFile = new File(docRoot,thumbnailName);
		log.info("newFile(업로드할 파일) : "+newFile);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);  // 확장자추출
		log.info("formatName(확장자) : "+formatName);
		
		ImageIO.write(destImg, formatName, newFile);
		
		return thumbnailName;
	}
	
}
