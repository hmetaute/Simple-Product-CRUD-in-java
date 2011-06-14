<%@ page import="java.util.Vector" language="java" %>
<%@ page import="javax.servlet.http.HttpServletResponse" language="java" %>
<%@ page import="business.Producto" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>   
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script language="JavaScript" SRC="producto.js"></script>
<script language="JavaScript" SRC="jquery-1.6.1.js"></script>
<title>Esta es la segunda pagina jsp</title>
</head>
<body>
	<form action="ManejadorProductos" method="POST">
	<input type="hidden" name="metodo" value="consulta"></input>
	<input type="hidden" name="nuevoProductoActivo" value="true"></input>
		<h1>Administrador de productos</h1>
		<table border ="0.5">
		<tr>
			<td>
				<b>Filtro</b>
			</td>
		</tr>
		<tr>
			<td>
				Nombre: <input type="text" name="NombreProducto" id="NombreProducto" size="20" value='<c:out value="${nombreConsultado}"/>' ><br>
			</td>
			<td>
				Descripcion: <input type="text" name="DescripcionProducto" id="DescripcionProducto" size="100" value='<c:out value="${descripcionConsultada}"/>'>
			</td>
			<td><input type="submit" value="Filtrar"></td>
		</tr>
		</table>	
					
	  <h4>Datos de búsqueda</h4>				
  	  <table border="1px">
  	  <tr>
	  	  <td>
	  	  	<b>Nombre</b>
	  	  </td>
	  	  <td>
	  	  	<b>Descripcion</b>
	  	  </td>
	  	  <td>
	  	  	<b>Estado</b>
	  	  </td>
  	  </tr>  	    	    	  	    	    	
	  <c:forEach items="${myList}" var="item" >
	  <tr>
	  	<td>
	  		<c:out value="${item.nombre}"/>
	  	</td>
	  	<td>
	  		<c:out value="${item.descripcion}"/>	
	  	</td>
	  	<td>
			<input type="checkbox" value='cb-<c:out value="${item.ID}"/>'  disabled <c:if test="${item.activo == 'S'}"><c:out value="checked" /></c:if>	></input>	  	
	  	</td>
	  	<td>
			<a href='javascript:eliminarProducto(<c:out value="${item.ID}"/>)'>Eliminar</a> 	  	
	  	</td>
	  	<td>
			<a href='javascript:editarProducto(<c:out value="${item.ID}"/>)'>Editar</a> 	  	
	  	</td>			  		  	 	    
	  </tr>	  
	  </c:forEach>
      </table>
            
      <h4>Datos del producto</h4>
      <table>
      	<tr>
      	<td>
      		Nombre: <input type="text" name="ingresoNombre" id ="ingresoNombre"></input>
      	</td>      	      
      	</tr>
      	<tr>
      	<td>
      		Descripcion: <input type="text" name="ingresoDescripcion" id ="ingresoDescripcion"></input>
      	</td>      	      
      	</tr>
      	<tr>
      	<td>
      		Estado Activo:<input type="checkbox" name="ingresoActivo" id ="ingresoActivo" checked="checked"></input>
      	</td>      	      
      	</tr>
      	<tr>
      	<td>
      		<a href="javascript:ingresarProducto()">Ingresar producto</a>
      	</td>
      	<td>
      		<a href="javascript:nuevoProducto();">Nuevo producto</a>
      	</td>
      	
      	</tr>
      
      
      
      </table>
      
      	    									
	</form>
</body>
</html>