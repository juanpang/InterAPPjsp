<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@page import="java.sql.*" %>
<%

boolean DEBUG=true;

String db      = "interapp";
String usuario = "interapp";
String passwd  = "oH3C7!Jo5PZw5Zfc";

Connection conn = null;
Statement stmt  = null;
Statement stmt2 = null;
ResultSet rs    = null;


String sql  = null;
String sql2 = null;


String delegacion      = null;
String deporte         = null;
String seccion         = null;
String rama            = null;
String nombres         = null;
String PrimerApellido  = null;
String SegundoApellido = null;

int entero= 0;
int numero= 0;
String numeroStr;

delegacion	    =	request.getParameter("delegacion") == null ? "": request.getParameter("delegacion");
delegacion	    =	request.getParameter("delegacion") == null ? "": request.getParameter("delegacion");
deporte		    =	request.getParameter("deporte") == null ? "": request.getParameter("deporte");
seccion		    =	request.getParameter("seccion") == null ? "": request.getParameter("seccion");
rama		    = 	request.getParameter("rama") == null ? "": request.getParameter("rama");
nombres 	    =	request.getParameter("nombres") == null ? "": request.getParameter("nombres");
PrimerApellido	=	request.getParameter("PrimerApellido") == null ? "": request.getParameter("PrimerApellido");
SegundoApellido	=	request.getParameter("SegundoApellido") == null ? "": request.getParameter("SegundoApellido");
numeroStr		= 	request.getParameter("numero")	== null ? "": request.getParameter("numero");

try{
	numero=Integer.parseInt(numeroStr);
}
catch(Exception e){}


try{
	Class.forName("org.gjt.mm.mysql.Driver");
	conn=DriverManager.getConnection("jdbc:mysql://arkesol.ddnsfree.com/"+db,usuario,passwd);
	
	stmt=conn.createStatement(); //Nombre, primer_apellido,segundo_apellido,Numero,ID_Eq
	stmt2=conn.createStatement();
	
	sql="SELECT e.equipo_id FROM equipo e, rama r, delegaciones del, deporte dep, seccion s WHERE del.delegaciones_id=e.ID_D AND del.Codigo ='"+delegacion+"' AND r.rama_id = e.ID_R AND r.Descripcion ='"+rama+"' AND dep.deporte_id=e.ID_De AND dep.Descripcion ='"+deporte+"' AND s.seccion_id=e.ID_S AND s.Descripcion='" +seccion+"'";

	
	rs=stmt.executeQuery(sql);
		if(rs.next()){
		entero=rs.getInt("equipo_id");
		}
	sql2="INSERT INTO jugadores(Nombre,primer_apellido,segundo_apellido,Numero,ID_Eq) VALUES("+nombres+","+PrimerApellido+","+SegundoApellido+","+numero+","+entero+");";
	
	stmt2.executeUpdate(sql2);
	
}

catch(SQLException e)
{
	out.println("SQLException caught: " + e.getMessage());
}
finally
{
	try{rs.close();} catch(Exception e){}
	try{stmt.close();} catch(Exception e){}
	try{stmt2.close();} catch(Exception e){}
	try{conn.close();} catch(Exception e){}
}

%>