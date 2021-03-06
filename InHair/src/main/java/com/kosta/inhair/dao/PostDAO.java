package com.kosta.inhair.dao;

import java.util.List;

import com.kosta.inhair.domain.Post;

public interface PostDAO {

	// 후기등록
	int postCreate(Post post);

	// 후기수정
	int postUpdate(Post post);

	// 후기삭제
	int postDelete(int post_id);

	// 후기검색(Detail)
	Post postSearch(int post_id);

	// 디자이너 별 후기 리스트
	List<Post> postList(String designer_id);

	
	// 디자이너 별 모든 별점
	List<Double> allStarpoint(String designer_id);
}
