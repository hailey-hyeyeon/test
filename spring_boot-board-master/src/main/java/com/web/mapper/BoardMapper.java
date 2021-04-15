package com.web.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.web.domain.Board;
import com.web.domain.Reply;

@Repository("BoardMapper")
public interface BoardMapper {
	public boolean addBoard(Board b); //추가
	public List<Board> getBoard(); // 리스트
	public Board getBoardOne(int idx); //상세
	public boolean addReply(Reply r);
	public List<Reply> getReply(int boardIdx);
	public boolean boardDelete(int idx);
	//수정만 없음
}
