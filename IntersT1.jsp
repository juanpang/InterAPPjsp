<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
	<title>Registro de Jugadores</title>
</head>
<body>
	<!--Titulo-->
	<div class="ReJu" style="position:absolute;width: 130.72%;height: 13.80%;left: 30px;top: 0%;font-family: Roboto Slab;font-style: normal;font-weight: normal;font-size: 80px;line-height: 106px;">Registro de Jugadores</div>
	<form action="TRY.jsp" method="post"></form>
	<%@page import="java.sql.*" %>
	<%
	String db="interapp";
	String usuario="interapp";
	String passwd="oH3C7!Jo5PZw5Zfc";
	
	Connection conn=null;
	Statement stmt=null;
	Statement stmt2=null;
	Statement stmt3=null;
	Statement stmt4=null;
	
	ResultSet rs=null;
	ResultSet rs2=null;
	ResultSet rs3=null;
	ResultSet rs4=null;
	
	String sql=null;
	String sql2=null;
	String sql3=null;
	String sql4=null;
	
	String delegacion=null;
	String deporte=null;
	String seccion=null;
	String rama=null;
	
	try{
		Class.forName("org.gjt.mm.mysql.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://arkesol.ddnsfree.com/"+db,usuario,passwd);
		
		stmt=conn.createStatement();
		stmt2=conn.createStatement();
		stmt3=conn.createStatement();
		stmt4=conn.createStatement();
		
		sql="SELECT delegaciones_id, Codigo FROM delegaciones ORDER BY Codigo";
		sql2="SELECT deporte_id, Descripcion FROM deporte ORDER BY Descripcion";
		sql3="SELECT seccion_id, Descripcion FROM seccion ORDER BY Descripcion";
		sql4="SELECT rama_id, Descripcion FROM rama ORDER BY rama_id";
		
	//<!--delegacion-->
	rs=stmt.executeQuery(sql);
		out.println("<select  type=\"text\" id=\"delegacion\" placeholder=\"DELEGACION\" style=\"position: absolute; width: 25%;height: 9%;left: 2%;top: 22%;\"><option selected>DELEGACION</option>");
		while(rs.next()){
			delegacion=rs.getString("Codigo");
			out.println("<option value=\""+ rs.getInt("delegaciones_id") +"\">"+delegacion+"</option>");
		}
		out.println("</select>");
	
	//<!--deporte-->
	rs2=stmt2.executeQuery(sql2);
		out.println("<select type=\"text\" id=\"deporte\" placeholder=\"DEPORTE\" style=\"position: absolute; width: 25%;height: 9%;left: 2%;top: 42%;\"><option selected>DEPORTE</option>");
		while(rs2.next()){
			deporte=rs2.getString("Descripcion");
			out.println("<option value=\""+ rs2.getInt("deporte_id") +"\">"+deporte+"</option>");
		}
		out.println("</select>");
		
	//<!--seccion-->
	rs3=stmt3.executeQuery(sql3);
		out.println("<select type=\"text\" id=\"seccion\" style=\"position: absolute; width: 25%;height: 9%;left: 2%;top: 62%;\"><option selected>SECCION</option>");
		while(rs3.next()){
			seccion=rs3.getString("Descripcion");
			out.println("<option value=\""+ rs3.getInt("seccion_id") +"\">"+seccion+"</option>");
		}
		out.println("</select>");
		
	//<!--rama-->
	rs4=stmt4.executeQuery(sql4);
		out.println("<select type=\"text\" id=\"rama\" style=\"position: absolute; width: 25%;height: 9%;left: 2%;top: 82%;\"><option selected>RAMA</option>");
		while(rs4.next()){
			rama=rs4.getString("Descripcion");
			out.println("<option value=\""+ rs4.getInt("rama_id") +"\">"+rama+"</option>");
		}
		out.println("</select>");
}	
	
	catch(SQLException e)
	{
		out.println("SQLException caught: " + e.getMessage());
	}
	finally
	{
		try{rs.close();} catch(Exception e){}
		try{rs2.close();} catch(Exception e){}
		try{rs3.close();} catch(Exception e){}
		try{rs4.close();} catch(Exception e){}
		try{stmt.close();} catch(Exception e){}
		try{stmt2.close();} catch(Exception e){}
		try{stmt3.close();} catch(Exception e){}
		try{stmt4.close();} catch(Exception e){}	
		try{conn.close();} catch(Exception e){}
	}
	
	%>
	

	
	<!--numero-->
	<input type="text" id="numero" placeholder="NUMERO" style="position: absolute; width: 14%;height: 8%;left: 30%;top: 82%;">

	<!--Nombres-->
	<input type="text" id="nombres" placeholder="NOMBRES" style="position: absolute; width: 25%;height: 8%;left: 30%;top: 22%;">

	<!--PRIMER APELLIDO-->
	<input type="text" id="primerapellido" placeholder="PRIMER APELLIDO" style="position: absolute; width: 25%;height: 8%;left: 30%;top: 42%;">
	<!--Segundo APELLIDO-->
	<input type="text" id="segundoapellido" placeholder="SEGUNDO APELLIDO" style="position: absolute; width: 25%;height: 8%;left: 30%;top: 62%;">
	<!--Boton-->
	<input type="submit" value="Registrar" id="botonEnv" style="position: absolute;width: 10%; height: 9%;left: 45.2%; top: 82%;">


	
</body>
</html>