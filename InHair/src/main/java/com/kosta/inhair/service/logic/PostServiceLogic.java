package com.kosta.inhair.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.inhair.dao.DesignerDAO;
import com.kosta.inhair.dao.PostDAO;
import com.kosta.inhair.domain.Designer;
import com.kosta.inhair.domain.Post;
import com.kosta.inhair.service.PostService;

@Service
public class PostServiceLogic implements PostService{

	@Autowired
	private PostDAO postDAO;
	@Autowired
	private DesignerDAO designerDAO;
	
	@Override
	public int postCreate(Post post) {
		return postDAO.postCreate(post);
	}

	@Override
	public int postUpdate(Post post) {
		return postDAO.postUpdate(post);
	}

	@Override
	public int postDelete(int post_id) {
		return postDAO.postDelete(post_id);
	}

	@Override
	public Post postSearch(int post_id) {
		return postDAO.postSearch(post_id);
	}

	@Override
	public List<Post> postList(String designer_id) {
		return postDAO.postList(designer_id);
	}


	@Override
	public double avgStarpoint(String designer_id) {
		
		List<Double> list= postDAO.allStarpoint(designer_id);

		double sum = 0;
		for(double starpoint : list){
			sum += starpoint;
		}

		double avgStarpoint = sum/list.size();
		
		if(Double.isNaN(avgStarpoint) == true) {
			avgStarpoint = 0;
		}
		Designer de = designerDAO.designerSearch(designer_id);
		de.setStarpoint(avgStarpoint);
		designerDAO.designerUpdate(de);
		return avgStarpoint;
	
	}
	
	

}
