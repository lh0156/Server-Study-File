package com.test.main.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import org.w3c.dom.bootstrap.DOMImplementationRegistry;

import com.test.jdbc.DBUtil;


//*** DAO에서는 데이터 조작하지 않는다. 데이터 입출력만 한다.
public class BoardDAO {

	private Connection conn;
	private Statement stat; //매개변수X
	private PreparedStatement pstat; //매개변수O
	private ResultSet rs;
	
	public BoardDAO() {
		
		try {

			conn = DBUtil.open();
			stat = conn.createStatement();

		} catch (Exception e) {
			System.out.println("BoardDAO.BoardDAO()");
			e.printStackTrace();
		}
		
	}

	public int add(BoardDTO dto) {
		
		try {

			String sql = "insert into tblBoard (seq, id, subject, content, regdate, readcount, userip) values (seqBoard.nextVal, ?, ?, ?, default, default, ?)";
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getId());      //X
			pstat.setString(2, dto.getSubject()); //O
			pstat.setString(3, dto.getContent()); //O
			pstat.setString(4, dto.getUserip());  //X
			
			return pstat.executeUpdate();
			
			
//			String sql = String.format("insert into tblBoard (seq, id, subject, content, regdate, readcount, userip) values (seqBoard.nextVal, '%s', '%s', '%s', default, default, '%s')", dto.getId(), dto.getSubject().replace("'", "''"), dto.getContent().replace("'", "''"), dto.getUserip());
//			
//			return stat.executeUpdate(sql);

		} catch (Exception e) {
			System.out.println("BoardDAO.add()");
			e.printStackTrace();
		}
		
		return 0;
	}

	
	//List 서블릿이 목록주세요~ 라고 요청
	public ArrayList<BoardDTO> list(HashMap<String, String> map) {
		
		try {

			String where = "";
			
			if (map.get("searchmode").equals("y")) {
				where = String.format("where %s like '%%%s%%'"
								, map.get("column")
								, map.get("word").replace("'", "''"));
			}
			
			String sql = String.format("select * from vwBoard %s order by seq desc", where);
			
			rs = stat.executeQuery(sql);
			
			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
			
			while (rs.next()) {
				//레코드 1줄 -> BoardDTO 1개
				BoardDTO dto = new BoardDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getInt("readcount"));
				
				dto.setIsnew(rs.getDouble("isnew"));
				
				list.add(dto);
			}
			
			return list;

		} catch (Exception e) {
			System.out.println("BoardDAO.list()");
			e.printStackTrace();
		}
		
		return null;
	}

	//View 서블릿이 글번호를 줄테니 레코드(DTO)를 주세요~
	public BoardDTO get(String seq) {
		
		try {

			String sql = "select tblBoard.*, (select name from tblUser where id = tblBoard.id) as name from tblBoard where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				BoardDTO dto = new BoardDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setUserip(rs.getString("userip"));
				
				return dto;
			}

		} catch (Exception e) {
			System.out.println("BoardDAO.get()");
			e.printStackTrace();
		}
		
		return null;
	}

	//View 서블릿이 글번호를 줄테니 조회수 +1 해주세요~
	public void addReadCount(String seq) {
		
		try {

			String sql = "update tblBoard set readcount = readcount + 1 where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("BoardDAO.addReadCount()");
			e.printStackTrace();
		}		
		
	}

	//EditOk 서블릿이 DTO를 줄테니 수정해주세요~
	public int edit(BoardDTO dto) {

		try {

			String sql = "update tblBoard set subject = ?, content = ? where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getSubject());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getSeq());
			
			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("BoardDAO.edit()");
			e.printStackTrace();
		}
		
		return 0;
	}

	//DelOk 서블릿이 글번호를 줄테니 글을 삭제주세요~
	public int del(String seq) {
		
		try {

			String sql = "delete from tblBoard where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("BoardDAO.del()");
			e.printStackTrace();
		}
		
		return 0;
	}
	
}










