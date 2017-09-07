package com.kosta.inhair.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.inhair.domain.Post;
import com.kosta.inhair.domain.User;
import com.kosta.inhair.service.PostService;

@Controller
@RequestMapping("/post")
public class PostController {

	@Autowired
	private PostService postService;

	@RequestMapping("/detail")
	public ModelAndView postDetail(int post_id, int rnum) {

		ModelAndView modelAndView = new ModelAndView("post/postDetail");
		Post post = postService.postSearch(post_id);
		post.setRnum(rnum);

		modelAndView.addObject("post", post);
		return modelAndView;
	}

	@RequestMapping("/create")
	public ModelAndView postCreateView(String designer_id, HttpSession session) {

		 User loginedUser = (User) session.getAttribute("loginedUser");

		ModelAndView modelAndView = new ModelAndView("post/post");
		modelAndView.addObject("designer_id", designer_id);
		 modelAndView.addObject("writer", loginedUser.getId());

		return modelAndView;
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public ModelAndView postCreate(Post post, @RequestParam("file") MultipartFile file) {

		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy_MM_dd_hh_mm_ss", Locale.KOREA);
		Date currentTime = new Date();
		String mTime = mSimpleDateFormat.format(currentTime);
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				File dir = new File("c:\\image\\post" + File.separator);
				if (!dir.exists()) {
					dir.mkdirs();
				}
				File saveFile = new File(dir.getAbsolutePath() + File.separator + mTime + post.getDesigner_id() + ".png");
				BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(saveFile));
				out.write(bytes);
				out.close();

			} catch (Exception e) {
				e.getMessage();
			}
		}
		post.setImg(mTime + post.getDesigner_id() + ".png");

		postService.postCreate(post);

		ModelAndView modelAndView = new ModelAndView(
				"redirect:/designer/detail?designer_id=" + post.getDesigner_id());

		return modelAndView;
	}

	@RequestMapping("/image")
	public void imageRegist(int post_id, HttpServletResponse resp) throws IOException {

		String image = postService.postSearch(post_id).getImg();

		InputStream in = null;
		FileInputStream fis = null;
		OutputStream out = null;

		if (image != null) {

			String imgName = image;
			String imagePath = "c:/image/post";

			fis = new FileInputStream(imagePath + "/" + imgName);
			in = new BufferedInputStream(fis);
		} else {
			resp.setContentType("image/png");
		}

		out = resp.getOutputStream();

		int readcnt = 0;
		byte[] buf = new byte[1024];

		while ((readcnt = in.read(buf)) != -1) {
			out.write(buf, 0, readcnt);

		}
		out.flush();

		if (in != null)
			in.close();
		if (out != null)
			out.close();
	}

	@RequestMapping("/update")
	public ModelAndView postUpdateView(int post_id, int rnum) {

		Post post = postService.postSearch(post_id);
		post.setRnum(rnum);
		ModelAndView modelAndView = new ModelAndView("post/postUpdate");
		modelAndView.addObject("post", post);

		return modelAndView;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView postUpdate(Post post, @RequestParam("file") MultipartFile file, int rnum) {
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy_MM_dd_hh_mm_ss", Locale.KOREA);
		Date currentTime = new Date();
		String mTime = mSimpleDateFormat.format(currentTime);
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				File dir = new File("c:\\image\\post" + File.separator);
				if (!dir.exists()) {
					dir.mkdirs();
				}
				File saveFile = new File(
						dir.getAbsolutePath() + File.separator + mTime + post.getDesigner_id() + ".png");
				BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(saveFile));
				out.write(bytes);
				out.close();

			} catch (Exception e) {
				e.getMessage();
			}
		}
		post.setImg(mTime + post.getDesigner_id() + ".png");
		postService.postUpdate(post);

		ModelAndView modelAndView = new ModelAndView("redirect:detail?post_id=" + post.getPost_id() + "&rnum="+rnum);
		return modelAndView;
	}

	@RequestMapping("/delete")
	public ModelAndView postDelete(int post_id) {

		Post post = postService.postSearch(post_id);
		postService.postDelete(post_id);

		ModelAndView modelAndView = new ModelAndView(
				"redirect:/designer/detail?designer_id=" + post.getDesigner_id());
		return modelAndView;

	}



}
