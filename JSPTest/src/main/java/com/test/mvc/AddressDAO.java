package com.test.mvc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

//DAO, Data Access Object
//- 데이터 처리 코드 담당 객체
public class AddressDAO {
	
	private Connection conn;
	private Statement stat;
	private ResultSet rs;
	
	public AddressDAO() {
		try {
			conn = DBUtil.open();
			stat = conn.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<AddressDTO> list() {
		
		//주소록 목록 주세요~
		try {

			String sql = "select * from tblAddress order by seq desc";
			rs = stat.executeQuery(sql);
			
			//Address 서블릿이 알 수 있는 형태로 바꿔서 돌려주자!!
			//7	헤헤헤	23	010-4545-5478	서울시 강동구 암사동
			
			//ResultSet > (변환) > ArrayList<AddressDTO>
			
			ArrayList<AddressDTO> list = new ArrayList<AddressDTO>();
			
			while (rs.next()) {
				//레코드 1줄 -> DTO 1개
				AddressDTO dto = new AddressDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));
				dto.setTel(rs.getString("tel"));
				dto.setAddress(rs.getString("address"));
				
				list.add(dto);				
			} //while
			
			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}

	public AddressDTO get(String seq) {
		
		//번호를 줄테니 DTO를 주세요~
		try {

			String sql = "select * from tblAddress where seq = " + seq;
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				
				AddressDTO dto = new AddressDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));
				dto.setTel(rs.getString("tel"));
				dto.setAddress(rs.getString("address"));
				
				return dto;				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}






















