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
	Statement stmt2 = null;
	Statement stmt3 = null;
	ResultSet rs	= null;
	ResultSet rs2	= null;
	
	String sql 		= null;
	String sql2 	= null;
	String sql3		= null;
	String us 		= null;
	String pw 		= null;
	String email	= null;
	String col		= null;
	int ID_TdU		= 0;
	int rid		= 0;
	
	us = request.getParameter("username") == null ? "": request.getParameter("username");
	pw = request.getParameter("passwd") == null ? "": request.getParameter("passwd");
	email = request.getParameter("email") == null ? "": request.getParameter("email");
	col = request.getParameter("colegio") == null? "": request.getParameter("colegio");
	
	try
	{
		Class.forName("org.gjt.mm.mysql.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, passwd);
		
		stmt = conn.createStatement();
		stmt2 = conn.createStatement();
		stmt3 = conn.createStatement();
		
		sql2 = "SELECT delegaciones_id FROM delegaciones WHERE Codigo = '"+col+"'";
		
		if(DEBUG) System.out.println(sql2);
		rs = stmt.executeQuery(sql2);
		
		if (rs.next())
		{
			ID_TdU = rs.getInt("delegaciones_id");
		}
		
		sql  = "INSERT INTO usuario (ID_TdU, Username, Pssword, Correo, ID_D) VALUES (4,'"+us+"','"+pw+"','"+email+"',"+ID_TdU+")";
		stmt2.executeUpdate(sql);
		
		sql3 = "SELECT usuario_id FROM usuario WHERE Username = '"+us+"'  AND Pssword = '"+pw+"'";
		System.out.println(sql3);
		rs2 = stmt3.executeQuery(sql3);
		
		if(rs2.next())
		{
			System.out.println("Aqui bien");
			rid = rs2.getInt("usuario_id");
			System.out.println(rid);
		}
		
		out.println("[{\"LOGEdit\": \"Succesful\",\"ID\":"+rid+"}]");
		
		if(DEBUG) System.out.println(sql);
		
		try{conn.close();}catch(Exception e){}
					
		rs.close();
		
	}
	catch(SQLException e)
	{
		out.println("[{\"LOGEdit\":\"unsuccesful\"}]");
		out.println("SQLException caught: " + e.getMessage());
	}
	finally
	{
		try{rs.close();} catch(Exception e){}
		try{stmt.close();} catch(Exception e){}
		try{conn.close();} catch(Exception e){}
	}
%>
