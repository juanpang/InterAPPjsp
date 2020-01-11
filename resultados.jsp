<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>IS | Registro Resultados</title>
	<link rel="stylesheet" type="text/css" href="CSSGeneralInterWeb.css">
</head>
<body>

<!-- Registro de Resultados -->
	<h1 style="position: absolute; top: 0%; left: 5%; font-size: 3.5em;">Registro de Resultados</h1>
	
	<%@page import="java.sql.*" %>
<%

//boolean DEBUG=true;

String db="interapp";
String usuario="interapp";
String passwd="oH3C7!Jo5PZw5Zfc";

Connection conn=null;
Statement stmt=null;

ResultSet rs=null;

String sql=null;

String disciplina=null;
String partido=null;
String eq=null;
String eq2=null;

try{
	Class.forName("org.gjt.mm.mysql.Driver");
	conn=DriverManager.getConnection("jdbc:mysql://arkesol.ddnsfree.com/"+db,usuario,passwd);
	
	stmt=conn.createStatement();
	
	sql="SELECT Descripcion FROM deporte ORDER BY Descripcion";
	
	rs=stmt.executeQuery(sql);
	out.println("<select id=\"deporte\" name=\"deporte\" style=\"position: absolute; left: 6%; top: 17.5%; height: 9%; width: 15%; font-size: 1em; text-align-last:center;\"><option selected>DEPORTE</option>");
	while(rs.next()){
		disciplina=rs.getString("Descripcion");
		out.println("<option>"+disciplina+"</option>");
	} out.println("</select>");

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
	

<!-- Deporte -->
<!-- Partido -->
	<select id="partido" name="partido" style="position: absolute; left: 26%; top: 17.5%; height: 9%; width: 15%; font-size: 1em; text-align-last:center;">
		<option selected>PARTIDO</option>
	</select>
	
	<!-- Marcador -->
<h2 style="position: absolute; left: 16%; top: 27.5%; font-size: 2.8em">Marcador</h2>
<input style="position: absolute; left: 13.5%; top: 44%; height: 7%; width: 7%; font-size: 2.5em; text-align: center;"></input>
<input style="position: absolute; left: 26%; top: 44%; height: 7%; width: 7%; font-size: 2.5em; text-align: center;"></input>
<div style="position: absolute; left: 14.5%; top: 54%; font-size: 2em;">Local</div>
<div style="position: absolute; left: 25.5%; top: 54%; font-size: 2em;">Visitante</div>
<div style="position: absolute; left: 22.5%; top: 41.5%; font-size: 4em;">-</div>

	<!-- Ganador -->
<h2 style="position: absolute; left: 12%; top: 60%; font-size: 2.8em">Equipo Ganador</h2>
<select id="ganador" name="ganador" style="position: absolute; left: 16%; top: 75%; height: 9%; width: 15%; font-size: 1em; text-align-last:center;">
		<option selected>LOCAL</option>
		<option>VISITANTE</option>
	</select>

<!-- Tabla jugadores -->
<div class="tabla">
		<table>
		
			<tr>

			  <th class="TablaEq">Equipo</th>
			  
			   <th class="TablaNombre">Jugador</th>

			   <th class="Tabla">Tarjeta<br>amarilla</th>

			   <th class="Tabla">Tarjeta<br>roja</th>

			   <th class="Tabla">Goles</th>

			   <th class="Tabla">Jugador<br>del partido</th>

		  </tr>
		  <tr>
		  		<td class="TablaEquipo">Garibaldi</td>
		  		<td class="TablaNombre">insertar nombre aqui</td>
		  		<td class="Tabla">
		  			<input class="imput"></input>
		  		</td>
		  		<td class="Tabla">  
		  			<button class="boton">.</button>
		  		</td>
		  		<td class="Tabla">
		  			<input class="imput"></input>
		  		</td>
		  		<td class="Tabla">
		  			<button class="boton">.</button>
		  		</td>
		  </tr>
		</table>
	</div>

</body>
</html>