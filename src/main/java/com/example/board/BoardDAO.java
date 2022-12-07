package com.example.board;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Date;
@Repository
public class BoardDAO
{
    @Autowired
//    JdbcTemplate template;
    SqlSession sqlSession;

//    public void setTemplate(JdbcTemplate template){
//        this.template = template;
//    }

    private final String ITEMS_INSERT = "insert into ITEMS (item,  writer, price, content, method, regDate, updateAt) values (?,?,?,?,?,?,?)";
    private final String ITEMS_UPDATE = "update ITEMS set item=?, writer=?, price=?, content=?, method=? where seq=?";
    private final String ITEMS_DELETE = "delete from ITEMS  where seq=?";
    private final String ITEMS_GET = "select * from ITEMS where seq=?";
    private final String ITEMS_LIST = "select * from ITEMS order by seq desc";

    public int insertItems(BoardVO vo){
        int result = sqlSession.insert("Board.insertBoard", vo);
        return result;
//        return template.update(ITEMS_INSERT, new Object[]{vo.getItem(), vo.getWriter(), vo.getPrice(), vo.getContent(), vo.getMethod(), vo.getRegDate(), vo.getUpdateAt()});
    }

    public int deleteItems(int id){
//        return template.update(ITEMS_DELETE, new Object[]{id});
        return sqlSession.delete("Board.deleteBoard", id);
    }

    public int updateItems(BoardVO vo){
        return sqlSession.update("Board.updateBoard", vo);
//        return template.update(ITEMS_UPDATE, new Object[]{vo.getItem(), vo.getWriter(), vo.getPrice(), vo.getContent(), vo.getMethod(), vo.getSeq()});
    }

    public BoardVO getItems(int seq){
        BoardVO one = sqlSession.selectOne("Board.getBoard", seq);
        return one;
//        return template.queryForObject(ITEMS_GET, new Object[]{seq}, new BoardRowMapper());
    }

    public List<BoardVO> getItemsList(){
        List<BoardVO> list = sqlSession.selectList("Board.getBoardList");
        return list;
//        return template.query(ITEMS_LIST, new BoardRowMapper());
    }

    class BoardRowMapper implements RowMapper<BoardVO>{
        @Override
        public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
            System.out.println("Reading start!!!!  " + rs.getString("item"));
            BoardVO data = new BoardVO();
            data.setSeq(rs.getInt("seq"));
            data.setItem(rs.getString("item"));
//                data.setPhoto(rs.getString("photo"));
            data.setWriter(rs.getString("writer"));
            data.setPrice(rs.getString("price"));
            data.setContent(rs.getString("content"));
            data.setMethod(rs.getString("method"));
            data.setRegDate(rs.getDate("regDate"));
            data.setUpdateAt(rs.getDate("updateAt"));
            return data;
        }
    }
}
