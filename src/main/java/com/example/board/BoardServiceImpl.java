package com.example.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardServiceImpl implements BoardService
{
    @Autowired
    BoardDAO boardDAO;

    @Override
    public int insertItem(BoardVO vo){
        return boardDAO.insertItems(vo);
    }

    @Override
    public int deleteItem(int seq){
        return boardDAO.deleteItems(seq);
    }

    @Override
    public int updateItem(BoardVO vo){
        return boardDAO.updateItems(vo);
    }

    @Override
    public BoardVO getItem(int seq){
        return boardDAO.getItems(seq);
    }

    @Override
    public List<BoardVO> getItemList(){
        return boardDAO.getItemsList();
    }
}
