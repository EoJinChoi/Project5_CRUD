package com.example.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/board")
public class BoardController
{
    @Autowired
    BoardServiceImpl boardService;

    @RequestMapping(value = "posts", method = RequestMethod.GET)
    public String boardlist(Model model){
        model.addAttribute("list", boardService.getItemList());
        return "posts";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addPost(){
        return "addpostform";
    }

    @RequestMapping(value = "/addok", method = RequestMethod.POST)
    public String addPostOK(BoardVO vo){
        if(boardService.insertItem(vo) == 0)
            System.out.println("데이터 추가 실패 ");
        else
            System.out.println("데이터 추가 성공!!!");
        return "redirect:posts";
    }

    @RequestMapping(value = "/editform/{id}" , method = RequestMethod.GET)
    public String editPost(@PathVariable("id") Integer id, Model model){
        BoardVO boardVO = boardService.getItem(id);
        model.addAttribute("boardVO", boardVO);
        return "editform";
    }

    @RequestMapping(value = "/editok", method = RequestMethod.POST)
    public String editPostOK(BoardVO vo){
        if(boardService.updateItem(vo) == 0)
            System.out.println("데이터 수정 실패 ");
        else
            System.out.println("데이터 수정 성공!!!");
        return "redirect:posts";
    }

    @RequestMapping(value = "/deleteok/{id}" , method = RequestMethod.GET)
    public String deletePost(@PathVariable("id") int id){
        if(boardService.deleteItem(id) == 0)
            System.out.println("데이터 삭제 실패 ");
        else
            System.out.println("데이터 삭제 성공!!!");
        return "redirect:../posts";
    }
}
