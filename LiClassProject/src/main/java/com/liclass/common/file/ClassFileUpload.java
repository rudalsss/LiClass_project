package com.liclass.common.file;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.web.multipart.MultipartFile;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ClassFileUpload {
	/*
	 * 1) makeDir() : 폴더 생성 & 반환 메서드
	 *  파일 업로드할 폴더 생성
	 * 
	 */
	public static void makeDir(String docRoot) {
		File fileDir = new File(docRoot);
		if(fileDir.exists()) {  	//경로에 폴더가 존재하면
			return;						//종료
		}
		fileDir.mkdir();			//경로에 폴더가 존재하지 않으면 폴더생성
	}
	
	/*
	 * 2) fileUpdload() : 파일 업로드 메서드 (이름을 적절하게 완성(real_name)해서 경로(docRoot)에 파일(fileAdd) 저장 )
	 * System.currentTimeMillis()( 현재시간을 long타입으로 반환 )를 사용 -> 파일명 중복 해결! 
	 * 
	 */
	public static String fileUpdload(MultipartFile file, String fileName) throws IOException{
		log.info("fileUPload 호출 성공");
		
		String real_name = null;
		String org_name = file.getOriginalFilename();	 //클라이언트가 전달해준 기존 파일명 반환(getOriginalFilename)
		
		// 중복되지 않게 저장할 파일명(real_name) 가공
		if(org_name != null && (!org_name.equals(""))) {
			real_name = fileName + "_" + System.currentTimeMillis()+"_"+org_name;	// 저장할 파일 이름 : 폴더명_시간값_기존이름
			
			String docRoot = "C://uploadLiClass//"+fileName;   	//저장경로(docRoot)
			makeDir(docRoot); 																//폴더가 없으면 생성해라
			File fileAdd = new File(docRoot + "/"+ real_name); 	//완성경로파일 객체(fileAdd) = C://uploadLiClass/class/class_시간값_기존이름.gif
			log.info("업로드할 파일(fileAdd) : "+fileAdd);
			
			file.transferTo(fileAdd); //이 메서드에 의해 저장 경로에 실질적으로 File이 생성됨
		}
		return real_name;			  //서버에 저장된 파일명 변환(board_1658205447977_cat.jpg)
	}
	
	
	/*
	 * fileDelete() : 파일 삭제 메서드
	 * 파일 이름으로 경로를 추적하여 해당파일을 삭제
	 * class_1658205347977_cat.jpg (class파일에 위치)
	 * thumbnail_class_1658205347977_cat.jpg (class/thumbnail 파일에 위치)
	 */
	public static boolean fileDelete(String fileName) throws IOException { //fileName = thumbnail_board_1658205347977_cat.jpg
		log.info("fileDelete 호출 성공");
		log.info(fileName+"을 삭제할 것이다...");
		boolean result = false;
		String startDirName = "", docRoot= ""; //직속폴더, 완성경로
		String dirName = fileName.substring(0, fileName.indexOf("_")); //폴더명 추출
		
		log.info("추출한 폴더명: " +dirName);
		
		if(dirName.equals("thumbnail")) { // 썸네일이미지라면..
			startDirName = fileName.substring(dirName.length()+1, fileName.indexOf("_", dirName.length()+1)); //class
			//thumbnail의 길이수+1부터 시작하여(_), thumbnail의 길이수+1 다음부터 시작하여 _전까지
			docRoot = "C://uploadLiClass//"+startDirName+"//"+dirName; //C://uploadLiClass//class//thumbnail
		} else {
			docRoot = "C://uploadLiClass//"+dirName;	//C://uploadLiClass//board
		}
		
		log.info("완성 경로: "+docRoot);
		
		File fileDelete = new File(docRoot + "/" + fileName); //완성경로 + 파일이름 = 진짜 완성경로
		
		if(fileDelete.exists() && fileDelete.isFile()) {
			result =fileDelete.delete();
		}
		log.info("파일 삭제여부(f/t): "+result);
		return result;
	}
	
	/*
	 * makeThumbnail() : 파일 썸네일 생성 메서드
	 * 기존파일이름을 받아서 썸네일 이름 생성, 실제 생성까지
	 * Thumbnail 경로 및 파일명 : thumbnail/thumbnail_class_11658205347977_cat.jpg
	 */
	public static String makeThumbnail(String fileName) throws Exception{
		log.info("thumbnail 만들기 함수 호출 성공");
		String dirName = fileName.substring( 0, fileName.indexOf("_") );	//dirName = class :: 원본 이미지가 존재하는 폴더 추출
		String imgPath = "C://uploadLiClass//"+dirName; 								//추출된 폴더의 실제경로 (물리적 위치 : C:\...)
		File fileAdd = new File(imgPath, fileName); 
		log.info("원본 이미지 파일(fileAdd): "+fileAdd);
		
		BufferedImage sourceImg = ImageIO.read(fileAdd); //fileAdd에 해당하는 이미지파일 읽어와서 데이터로 저장.
		BufferedImage destImg = Scalr.resize(sourceImg , Scalr.Method.AUTOMATIC , Scalr.Mode.FIT_TO_HEIGHT, 133); //크기조정
								//resize( 대상(BufferedImage타입), 
		
		String thumbnailName = "thumbnail_"+fileName; //썸네일 이미지 이름 : thumbnail_ + 기존파일명
		String docRoot = imgPath + "/thumbnail"; 	  			//썸네일 경로 : C://uploadLiClas//class//thumbnail
		makeDir(docRoot);															//썸네일 폴더 생성
		
		File newFile = new File(docRoot, thumbnailName);
		log.info("업로드할 파일(newFile): "+newFile);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1); //확장자 : jpg
		log.info("확장자(formatName: "+formatName);
		
		ImageIO.write(destImg, formatName, newFile);	//조정한 이미지 데이터를 생성한 파일에 저장.
		return thumbnailName;	//서버에 저장된 파일명 반환 (thumbnail_class_1658205347977_cat.jpg)
	}
}
