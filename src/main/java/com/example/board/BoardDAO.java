package com.example.board;

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
    JdbcTemplate template;

    public void setTemplate(JdbcTemplate template){
        this.template = template;
    }

    private final String ITEMS_INSERT = "insert into ITEMS (item,  writer, price, content, method, regDate, updateAt) values (?,?,?,?,?,?,?)";
    private final String ITEMS_UPDATE = "update ITEMS set item=?, writer=?, price=?, content=?, method=? where seq=?";
    private final String ITEMS_DELETE = "delete from ITEMS  where seq=?";
    private final String ITEMS_GET = "select * from ITEMS where seq=?";
    private final String ITEMS_LIST = "select * from ITEMS order by seq desc";

    public int insertItems(BoardVO vo){
        return template.update(ITEMS_INSERT, new Object[]{vo.getItem(), vo.getWriter(), vo.getPrice(), vo.getContent(), vo.getMethod(), vo.getRegDate(), vo.getUpdateAt()});
    }

    public int deleteItems(int id){
        return template.update(ITEMS_DELETE, new Object[]{id});
    }

    public int updateItems(BoardVO vo){
        return template.update(ITEMS_UPDATE, new Object[]{vo.getItem(), vo.getWriter(), vo.getPrice(), vo.getContent(), vo.getMethod(), vo.getSeq()});
    }

    public BoardVO getItems(int seq){
        return template.queryForObject(ITEMS_GET, new Object[]{seq}, new BoardRowMapper());
    }

    public List<BoardVO> getItemsList(){
        return template.query(ITEMS_LIST, new BoardRowMapper());
    }

    class BoardRowMapper implements RowMapper<BoardVO>{
        Date current = new Date(new Timestamp(System.currentTimeMillis()).getTime());
        @Override
        public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
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
