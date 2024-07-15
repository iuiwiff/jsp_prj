package kr.co.sist.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import oracle.sql.ConcreteProxyUtil;

public class DbConnection {
	private static DbConnection dbCon;
	
	private DbConnection() {
		
	}//DbConnection
	
	public static DbConnection getInstance() {
		if(dbCon == null) {
			dbCon = new DbConnection();
		}//end if
		return dbCon;
	}//getInstance
	
	public Connection getConn(String dbcpName) throws SQLException {
		Connection con = null;
		
		//1. JDNI사용객체 생성
		try {
		Context ctx = new InitialContext();
		
		//2. DBCP에서 DataSource 얻기
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/"+dbcpName);
		
		//3. DataSource에서 Connection 얻기
		con = ds.getConnection();
		
		} catch(NamingException ne) {
			ne.printStackTrace();
		}//end catch
		return con;
	}//getConn

	
	public void closeCon(ResultSet rs, Statement stmt, Connection con) 
	throws SQLException {
		try {
			if(rs != null) { rs.close(); }//end if
			if(stmt != null) { stmt.close(); }//end if
		}finally {
			if(con != null) { con.close(); }//end if
		}//end finally
	
	}// closeCon
	
}//class
