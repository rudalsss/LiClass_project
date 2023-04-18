package com.liclass.client.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liclass.client.post.dao.PostDAO;
import com.liclass.client.post.vo.PostVO;

import lombok.Setter;

@Service
public class PostServiceImpl implements PostService {
	
	@Setter(onMethod_ = @Autowired)
	private PostDAO postDao;
	
	//클래스일지 Create 
	@Override
	public int postInsert(PostVO vo) throws Exception{
		int result = postDao.postInsert(vo) ;
		return result;
	}
	
	//클래스일지 Read(List) 
	@Override
	public List<PostVO> postList(PostVO vo) {
		List<PostVO> postList = postDao.postList(vo);
		return postList;
	}
	//클래스일지 Read(Detail)
	@Override
	public PostVO postDetail(PostVO vo) {
		PostVO pvo = postDao.postDetail(vo);
		return pvo;
	}
	//클래스일지 Update 
	@Override
	public int postUpdate(PostVO vo)throws Exception {
		int result = postDao.postUpdate(vo);
		return result;
	}
	//클래스일지 Delete 
	@Override
	public int postDelete(PostVO vo)throws Exception {
		int result = postDao.postDelete(vo);
		return result;
	}

}
