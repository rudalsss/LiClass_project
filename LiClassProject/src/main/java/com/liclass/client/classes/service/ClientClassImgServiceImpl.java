package com.liclass.client.classes.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liclass.client.classes.dao.ClientClassImgDAO;
import com.liclass.client.classes.vo.ClientClassImgVO;

import lombok.Setter;

@Service
public class ClientClassImgServiceImpl implements ClientClassImgService{
		
		@Setter(onMethod_ = @Autowired)
		private ClientClassImgDAO cilentClassImgDao;
	
		//은아) 클래스 전체이미지
		@Override
		public List<ClientClassImgVO> getImgs(int c_no) {
			List<ClientClassImgVO> classImgs = cilentClassImgDao.getImgs(c_no);
			return classImgs;
		}
}
