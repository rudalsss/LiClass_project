package com.liclass.client.post.service;

import java.util.List;

import com.liclass.client.post.vo.PostVO;

public interface PostService{
		//클래스일지 Create 
		public int postInsert(PostVO vo) throws Exception;
		//클래스일지 Read(List) 
		public List<PostVO> postList(PostVO vo);
		//클래스일지 Read(Detail) 
		public PostVO postDetail(PostVO vo);
		//클래스일지 Update
		public int postUpdate(PostVO vo)throws Exception;
		//클래스일지 Delete 
		public int postDelete(PostVO vo)throws Exception;
}
