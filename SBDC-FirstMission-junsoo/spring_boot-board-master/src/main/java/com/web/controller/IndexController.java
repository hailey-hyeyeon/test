package com.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.web.domain.Board;
import com.web.domain.Reply;
import com.web.service.BoardService;

@Controller
public class IndexController {

	@Autowired
	private BoardService s;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String root() {
		return "index";
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "index";
	}

	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String board() {
		return "board";
	}

	@RequestMapping(value = "/mainBoard", method = RequestMethod.GET)
	public String mainBoard() {

		return "mainBoard";
	}

	@RequestMapping(value = "/saveBoard", method = RequestMethod.GET)
	public String saveBoard() {

		return "saveBoard";
	}

	@RequestMapping(value = "/deleteBoard", method = RequestMethod.GET)
	public String deleteBoard() {

		return "deleteBoard";
	}

	@RequestMapping(value = "/tempBoard", method = RequestMethod.GET)
	public String tempBoard() {

		return "tempBoard";
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write() {
		return "write";
	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view() {
		return "view";
	}
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update() {
		return "update";
	}
	

	@RequestMapping(value = "/writeAction", method = RequestMethod.POST)
	public String writeAction(HttpServletRequest req, @RequestParam("file") MultipartFile file,
			@RequestParam("title") String title, @RequestParam("writer") String writer, @RequestParam("contents") String contents)
			throws IllegalStateException, IOException {
		//String PATH = req.getSession().getServletContext().getRealPath("/");
		String PATH = req.getSession().getServletContext().getRealPath("/") + "resources/images" ;
		System.out.println(PATH);
		if (!file.getOriginalFilename().isEmpty()) {
			file.transferTo(new File(PATH + file.getOriginalFilename()));
			System.out.print(file.getOriginalFilename());
		}
		//s.addBoard(new Board(0, title, contents, file.getOriginalFilename())); // 생성자만들어서 dto
		s.addBoard(new Board(0, title, contents, writer, 0, PATH, PATH, 0, PATH));
		return "saveBoard";
	}

	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	@ResponseBody
	public List<Board> boardList() {
		return s.getBoard();
	}

	@RequestMapping(value = "/boardView", method = RequestMethod.GET) // 상세보기 API
	@ResponseBody
	public Board boardList(@RequestParam("idx") int idx) {
		return s.getBoardOne(idx);
	}

	/* 댓글작성 api */

	@RequestMapping(value = "/replyList", method = RequestMethod.GET) // 댓글
	@ResponseBody
	public List<Reply> replyList(@RequestParam("idx") int boardIdx) {
		return s.getReply(boardIdx);
	}

	@RequestMapping(value = "/writeReply", method = RequestMethod.POST)
	public String writeReply(@RequestParam("idx") int idx, @RequestParam("replyIdx") int replyIdx,
			@RequestParam("contents") String contents) {
		s.addReply(new Reply(0, idx, replyIdx, contents));
		return "redirect:view?idx=" + idx;
	}
	@RequestMapping(value = "/boardDelete", method = RequestMethod.POST)
	public String delete(@RequestParam("idx") int idx) {
		s.boardDelete(idx);
		return "test";
	}
}
