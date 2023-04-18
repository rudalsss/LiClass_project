package com.liclass.client.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.liclass.client.post.vo.PostVO;

@Mapper
public interface PostDAO {
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
	
	//경민) 클래스 기준 클래스일지 조회
	public List<PostVO> postOfClass(int c_no);
}
