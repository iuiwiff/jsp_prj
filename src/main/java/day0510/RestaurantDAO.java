package day0510;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConnection;
import kr.co.sist.user.restaurant.RestaurantVO;

public class RestaurantDAO {

	public static RestaurantDAO rDAO;
	
	public RestaurantDAO() {
		
	}
	
	public static RestaurantDAO getInstance() {
		
		if(rDAO == null) {
			rDAO = new RestaurantDAO();
		}//end if
		return rDAO;
	}//getInstance
	
	
	public List<RestaurantVO> selectAllRestaurant()throws SQLException{
		List<RestaurantVO> list=new ArrayList<RestaurantVO>();
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		DbConnection db=DbConnection.getInstance();
		
		try {
		//1. JNDI 사용객체 생성
		//2. DataSource 얻기
		//3. Connection 얻기
			con=db.getConn("jdbc/dbcp");
		//4. 쿼리문 생성객체 얻기(Dynamic Query)
			StringBuilder selectRestaurant=new StringBuilder();
			selectRestaurant
			.append("	select  name, menu, lat, lng, input_date	")
			.append("	from restaurant order by input_date desc	");
			
			pstmt=con.prepareStatement(selectRestaurant.toString());
			
		//5. 바인드변수에 값 설정
		//6. 쿼리문 수행 후 결과얻기
			
			rs=pstmt.executeQuery();
			
			RestaurantVO rVO=null;
			while(rs.next()) {
				rVO=new RestaurantVO(rs.getString("name"), rs.getString("menu"),
						rs.getDouble("lat"), rs.getDouble("lng"),
						rs.getDate("input_date"));
				
				list.add(rVO);
			}//end while
			
		}finally {
		//7. 연결 끊기
			db.closeCon(rs, pstmt, con);
		}//end finally
		return list;
	}//selectAllRestaurant
	
}
