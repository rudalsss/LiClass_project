package com.liclass.admin.management.studio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liclass.admin.management.center.dao.CenterDAO;
import com.liclass.admin.management.center.vo.CenterVO;
import com.liclass.admin.management.studio.dao.StudioDao;
import com.liclass.admin.management.studio.vo.StudioVO;
import com.liclass.common.file.StudioFileUpload;

import lombok.Setter;

@Service
public class StudioServiceImpl implements StudioService {
	@Setter(onMethod_=@Autowired)
	private StudioDao studioDao;
	
	@Setter(onMethod_=@Autowired)
	private CenterDAO centerDao;

	
	// 스튜디오 글목록 구현
	@Override
	public List<StudioVO> studioList(StudioVO svo) {
		List<StudioVO> list = null;
		list = studioDao.studioList(svo);
		return list;
	}
	
	
	// 클라이언트 스튜디오 글목록 구현
		@Override
		public List<StudioVO> clientStudioList(StudioVO svo) {
			List<StudioVO> list = null;
			list = studioDao.clientStudioList(svo);
			return list;
		}
	

	// 전체 레코드 수 구현
	@Override
	public int studioListCnt(StudioVO svo) {
		return studioDao.studioListCnt(svo);
	}

	// 스튜디오 글입력 구현
	@Override
	public int studioInsert(StudioVO svo) throws Exception {
		int result = 0;
		
		/* 예외를 발생시킬 코드 작성 
		bvo.setB_num(0);
		if(bvo.getB_num() == 0){
		throw new IllegalArgumentException("0번 글은 등록할 수 없습니다.");
		} */
		
		if(svo.getFile().getSize()>0) { // 업로드할 파일이 존재하면(파일의 크기로)
			String fileName = StudioFileUpload.fileUpload(svo.getFile(), "studio"); //studio_1658205347977_cat.jpg
			svo.setS_file(fileName); // 업로드 파일명 설정
			
			String thumbName = StudioFileUpload.makeThumbnail(fileName); //thumbnail_studio_1658205347977_cat.jpg
			svo.setS_thumb(thumbName); //thumbnail 파일명 설정
		}
		
		result = studioDao.studioInsert(svo);
		return result;
	}

	// 스튜디오 글상세 구현
	@Override
	public StudioVO studioDetail(StudioVO svo) {
		StudioVO detail = null;
		
		detail = studioDao.studioDetail(svo);
		return detail;
	}

	@Override
	public StudioVO updateForm(StudioVO svo) {
		StudioVO updateData = null;
		
		updateData = studioDao.studioDetail(svo);
		
		return updateData;
	}

	// 스튜디오 글수정 구현
	@Override
	public int studioUpdate(StudioVO svo) throws Exception {
		int result = 0;
		if(!svo.getFile().isEmpty()) {		// 새롭게 업로드할 파일이 존재하면
			if(!svo.getFile().isEmpty()) {	// 기존 파일이 존재하면
				StudioFileUpload.fileDelete(svo.getS_file());
				StudioFileUpload.fileDelete(svo.getS_thumb());
			}
			
			String fileName = StudioFileUpload.fileUpload(svo.getFile(), "studio");
			svo.setS_file(fileName);
			
			String thumbName = StudioFileUpload.makeThumbnail(fileName);
			svo.setS_thumb(thumbName);
		}
		
		result = studioDao.studioUpdate(svo);
		return result;
	}

	@Override
	public int studioDelete(StudioVO svo) throws Exception {
		int result = 0;
		if(!svo.getS_file().isEmpty()) { //s_file 필드의 값이 null이거나 "" 아니면(이미지 파일이 존재하면)
			StudioFileUpload.fileDelete(svo.getS_file());
			StudioFileUpload.fileDelete(svo.getS_thumb());
		}
		
		result = studioDao.studioDelete(svo.getS_no());
		return result;
	}

	@Override
	public List<CenterVO> centerNameList() {
		List<CenterVO> list = null;
		list = centerDao.centerNameList();
		return list;
	}
	
}
