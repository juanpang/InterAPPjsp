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
	String dep		= null;
	int depid		= 0;
	
	try
	{
		Class.forName("org.gjt.mm.mysql.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, passwd);
		
		stmt = conn.createStatement();
		
		sql  = "SELECT d.Descripcion, d.deporte_id FROM deporte_activo d_a, seccion s, deporte d WHERE d_a.ID_S=s.seccion_id AND s.Activa = 1 AND d_a.ID_De=d.deporte_id";
		
		System.out.println(sql);
		
		rs   = stmt.executeQuery(sql);
		
		out.print("[{");
		
		while(rs.next()){
			dep = rs.getString("Descripcion");
			depid = rs.getInt("deporte_id");
			out.print("\"deporte\": \""+dep+"\", \"id\": "+depid+"},{");
		}
		
		out.print("\"deporte\": \""+dep+"\", \"id\": "+depid+"}]");		
		
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