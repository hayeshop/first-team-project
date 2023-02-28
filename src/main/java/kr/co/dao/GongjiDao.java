package kr.co.gongji.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.gongji.dto.GongjiDto;

public class GongjiDao {
	Connection conn;
    public GongjiDao() throws Exception
    {
	    Class.forName("com.mysql.jdbc.Driver"); 
		String db="jdbc:mysql://localhost:3306/pension";
		conn=DriverManager.getConnection(db,"root","1234");
    }
    
    public void write_ok(HttpServletRequest request, 
    		HttpServletResponse response,
    		HttpSession session) throws Exception // 관리자만 적을수 있다.. => 관리자인지 확인 => session
    {
    	request.setCharacterEncoding("utf-8");
    	String title=request.getParameter("title");
    	String content=request.getParameter("content");
    	int chk;
    	if(request.getParameter("chk")==null)
    	{
    		chk=0;
    	}
    	else
    	{
    		chk=1;
    	}
    	
    	String userid="";
    	if(userid.equals("admin"))
    	{
    		// db에 insert
    		String sql="insert into gongji(title,content,chk,writeday) values(?,?,?,now())";
    		
    		PreparedStatement pstmt=conn.prepareStatement(sql);
    		pstmt.setString(1, title);
    		pstmt.setString(2, content);
    		pstmt.setInt(3, chk);
    		pstmt.executeUpdate();
    		
    		pstmt.close();
    		conn.close();
    		
    		response.sendRedirect("list.jsp");
    	}
    	else
    	{
    		conn.close();
    		response.sendRedirect("../main/main.jsp");
    	}
    }
    
    public void list(HttpServletRequest request) throws Exception
    {
    	String sql="select * from gongji order by chk desc, id desc";
    	
    	PreparedStatement pstmt=conn.prepareStatement(sql);
    	
    	ResultSet rs=pstmt.executeQuery();
    	
    	ArrayList<GongjiDto> glist=new ArrayList<GongjiDto>();
    	
    	while(rs.next())
    	{
    		GongjiDto gdto=new GongjiDto();
    		gdto.setTitle(rs.getString("title"));
    		gdto.setWriteday(rs.getString("writeday"));
    		gdto.setChk(rs.getInt("chk"));
    		glist.add(gdto);
    	}
    	
    	request.setAttribute("glist", glist);
    }
    
    public void content(HttpServletRequest request) throws Exception
    {
    	String id=request.getParameter("id");
    	
    	String sql="select * from gongji where id=?";
    	
    	PreparedStatement pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, id);
    	
    	ResultSet rs=pstmt.executeQuery();
    	rs.next();
    	
    	GongjiDto gdto=new GongjiDto();
		gdto.setTitle(rs.getString("title"));
		gdto.setWriteday(rs.getString("writeday"));
		gdto.setChk(rs.getInt("chk"));
		gdto.setContent(rs.getString("content"));
		
		request.setAttribute("gdto", gdto);
    }
    
    public void delete(HttpServletRequest request,
    		HttpServletResponse response) throws Exception
    {
    	String id=request.getParameter("id");
    	
    	String sql="select * from gongji where id=?";
    	
    	PreparedStatement pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, id);
    	
    	pstmt.executeUpdate();
    	
    	pstmt.close();
    	conn.close();
    	
    	response.sendRedirect("list.jsp");
    }

    public void update(HttpServletRequest request) throws Exception
    {
    	String id=request.getParameter("id");
    	
    	String sql="select * from gongji where id=?";
    	
    	PreparedStatement pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, id);
    	
    	ResultSet rs=pstmt.executeQuery();
    	rs.next();
    	
    	GongjiDto gdto=new GongjiDto();
    	gdto.setId(rs.getInt("id"));
		gdto.setTitle(rs.getString("title"));
		gdto.setWriteday(rs.getString("writeday"));
		gdto.setChk(rs.getInt("chk"));
		gdto.setContent(rs.getString("content"));
		
		request.setAttribute("gdto", gdto);
    }
    
    public void update_ok(HttpServletRequest request,
    		HttpServletResponse response) throws Exception
    {
    	request.setCharacterEncoding("utf-8");
    	String id=request.getParameter("id");
    	String title=request.getParameter("title");
    	String content=request.getParameter("content");
    	int chk;
    	if(request.getParameter("chk")==null)
    	{
    		chk=0;
    	}
    	else
    	{
    		chk=1;
    	}
    	
    	String sql="update gongji set title=?,content=?,chk=? where id=?";
    	
    	PreparedStatement pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, title);
    	pstmt.setString(2, content);
    	pstmt.setInt(3, chk);
    	pstmt.setString(4, id);
    	
    	pstmt.executeUpdate();
    	
    	pstmt.close();
    	conn.close();
    	
    	response.sendRedirect("content.jsp?id="+id);
    }
    
}
