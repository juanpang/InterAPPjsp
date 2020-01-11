<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
	<head>
		<title>IS | Registro de Partidos</title>
	</head>
<body style="margin: 0; padding: 0;">
	<h1 style="position: absolute; top: 5%; left: 5%; font-size: 3em;">Registro de Partidos</h1>
<form action="tryFile.jsp" method="post">
<%@page import="java.sql.*" %>
<% 
String db="interapp";
String usuario="interapp";
String passwd="oH3C7!Jo5PZw5Zfc";

Connection conn=null;
Statement stmt=null;
Statement stmt2=null;
Statement stmt3=null;
Statement stmt5=null;
Statement stmt6=null;
Statement stmt7=null;
ResultSet rs=null;
ResultSet rs2=null;
ResultSet rs3=null;
ResultSet rs5=null;
ResultSet rs6=null;
ResultSet rs7=null;

String sql=null;
String sql2=null;
String sql3=null;
String sql5=null;
String sql6=null;
String sql7=null;

String disciplina=null;
String rama=null;
String cancha=null;
String hora=null;
String local=null;
String visitante=null;
String seccion=null;

try{
	Class.forName("org.gjt.mm.mysql.Driver");
	conn=DriverManager.getConnection("jdbc:mysql://arkesol.ddnsfree.com/"+db,usuario,passwd);
	
	stmt=conn.createStatement();
	stmt2=conn.createStatement();
	stmt3=conn.createStatement();
	stmt5=conn.createStatement();
	stmt6=conn.createStatement();
	stmt7=conn.createStatement();
	
	sql="SELECT deporte_id, Descripcion FROM deporte ORDER BY Descripcion";
	sql2="SELECT rama_id, Descripcion FROM rama";
	sql3="SELECT cancha_id, Descripcion FROM cancha";		
	sql5="SELECT delegaciones_id, Codigo FROM delegaciones ORDER BY Codigo";
	sql6="SELECT delegaciones_id, Codigo FROM delegaciones ORDER BY Codigo";
	sql7="SELECT seccion_id, Descripcion FROM seccion ORDER BY seccion_id";
	
	rs=stmt.executeQuery(sql);
	out.println("<select style=\"position: absolute; top: 25%; left: 10%; height: 8%;\" id=\"disciplina\" name=\"disciplina\">	<option selected>--Selecciona un deporte--</option>");
	while(rs.next()){
		disciplina=rs.getString("Descripcion");
		out.println("<option value=\""+ rs.getInt("deporte_id") +"\">"+disciplina+"</option>");
	} out.println("</select>");
	
	rs2=stmt2.executeQuery(sql2);
	out.println("<select style=\"position: absolute; top: 25%; left: 30%; height: 8%;\" id=\"rama\" name=\"rama\">	<option selected>--Selecciona una rama--</option>");
	while(rs2.next()){
		rama=rs2.getString("Descripcion");
		out.println("<option value=\""+ rs2.getInt("rama_id")+"\">"+rama+"</option>");
	} out.println("</select>");
	
	rs3=stmt3.executeQuery(sql3);
	out.println("<select style=\"position: absolute; top: 50%; left: 10%; height: 8%;\" id=\"cancha\" name=\"cancha\"> <option selected>--Selecciona una cancha--</option>");
	while(rs3.next()){
		cancha=rs3.getString("Descripcion");
		out.println("<option value=\""+ rs3.getInt("cancha_id")+"\">"+cancha+"</option>");
	} out.println("</select>");
	
	rs5=stmt5.executeQuery(sql5);
	out.println("<select style=\"position: absolute; top: 75%; left: 10%; height: 8%;\" id=\"local\" name=\"local\"> <option selected>--Selecciona un equipo--</option>");
	while(rs5.next()){
		local=rs5.getString("Codigo");
		out.println("<option value=\""+ rs5.getInt("delegaciones_id")+"\">"+local+"</option>");
	} out.println("</select>");
	
	rs6=stmt6.executeQuery(sql6);
	out.println("<select style=\"position: absolute; top: 75%; left: 35%; height: 8%;\" id=\"visitante\" name=\"visitante\">	<option selected>--Selecciona un equipo--</option>");
	while(rs6.next()){
		visitante=rs6.getString("Codigo");
		out.println("<option value=\""+ rs6.getInt("delegaciones_id")+"\">"+visitante+"</option>");
	} out.println("</select>");
	
	rs7=stmt7.executeQuery(sql7);
	out.println("<select style=\"position: absolute; top: 25%; left: 50%; height: 8%;\" id=\"seccion\" name=\"seccion\">		<option selected>--Selecciona una sección--</option>");
	while(rs7.next()){
		seccion=rs7.getString("Descripcion");
		out.println("<option value=\""+ rs7.getInt("seccion_id")+"\">"+seccion+"</option>");
	} out.println("</select>");
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
	try{rs5.close();} catch(Exception e){}
	try{rs6.close();} catch(Exception e){}
	try{rs7.close();} catch(Exception e){}
	try{stmt.close();} catch(Exception e){}
	try{stmt2.close();} catch(Exception e){}
	try{stmt3.close();} catch(Exception e){}
	try{stmt5.close();} catch(Exception e){}
	try{stmt6.close();} catch(Exception e){}
	try{stmt7.close();} catch(Exception e){}
	try{conn.close();} catch(Exception e){}
}

%>

<!--Disciplina-->
	<div style="position: absolute; top: 20%; left: 10%; font-size: 2em;">Disciplina</div>

<!--Rama-->
	<div style="position: absolute; top: 20%; left: 30%; font-size: 2em;">Rama</div>
	
<!--Seccion-->
	<div style="position: absolute; top: 20%; left: 50%; font-size: 2em;">Sección</div>
	
<!--Cancha-->
	<div style="position: absolute; top: 45%; left: 10%; font-size: 2em;">Cancha</div>
	
	<!--Parsear la hora o introducir opciones-->
<!--Hora-->
	<div style="position: absolute; top: 45%; left: 30%; font-size: 2em;">Día y Hora</div>
	<input type="datetime-local" style="position: absolute; top: 50%; left: 30%; height: 8%;" title="*El formato está basado en 12 horas con distinción a.m./p.m.">

<!--Contrincantes-->
<!--Local-->
	<div style="position: absolute; top: 70%; left: 10%; font-size: 2em;">Local</div>	
<!--Visitante-->
	<div style="position: absolute; top: 70%; left: 35%; font-size: 2em;">Visitante</div>
<!--Versus-->
	<div style="position: absolute; top: 75%; left: 27.5%; font-size: 2em;">VS</div>

<!--Button-->
	<button type="submit" style="position: absolute; top: 90%; left: 40%; background-color: blue; height: 5%; width: 10%"></button>
</form>
</body>
</html>