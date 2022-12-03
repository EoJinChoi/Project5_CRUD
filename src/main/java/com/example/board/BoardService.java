package com.example.board;

import java.util.List;

public interface BoardService
{
    public int insertItem(BoardVO vo);
    public int deleteItem(int seq);
    public int updateItem(BoardVO vo);
    public BoardVO getItem(int seq);
    public List<BoardVO> getItemList();
}
