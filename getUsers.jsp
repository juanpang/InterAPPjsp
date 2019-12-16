<%@page import="java.sql.*"%>
<% //@ include file="Database.jsp" %>
<%
final boolean DEBUG = false;
	//String db = request.getParameter("db");
	String db 		= "interapp";
	String user 	= "USER3";
	String passwd	= "IAPruebas";
	
	Connection conn = null;
	Statement stmt	= null;
	ResultSet rs	= null;
	
	String sql 		= null;
	String us 		= null;
	String pw 		= null;
	int rid		= 0;
	
	us = request.getParameter("username") == null ? "": request.getParameter("username");
	pw = request.getParameter("pwd") == null ? "": request.getParameter("pwd");
	
	try
	{
		Class.forName("org.gjt.mm.mysql.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, passwd);
		
		stmt = conn.createStatement();
		
		sql  = "SELECT usuario_id FROM usuario WHERE (Username = '"+us+"'  AND Pssword = '"+pw+"') OR (Correo = '"+us+"' AND Pssword = '"+pw+"')";
		
		System.out.println(sql);
		
		rs   = stmt.executeQuery(sql);
		
		if (rs.next())
		{
			rid = rs.getInt("usuario_id");
			out.println("[{\"LOGIN\":\"succesful\", \"ID\":"+rid+"}]");
		}else{
			out.println("[{\"LOGIN\":\"unsuccesful\"}]");
		}
		
		try{conn.close();}catch(Exception e){}
					
		rs.close();
		
	}
	catch(SQLException e)
	{
		out.println("SQLException caught: " + e.getMessage());
	}
	finally
	{
		try{rs.close();} catch(Exception e){}
		try{stmt.close();} catch(Exception e){}
		try{conn.close();} catch(Exception e){}
	}
%>