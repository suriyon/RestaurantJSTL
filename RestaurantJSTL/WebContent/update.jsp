<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="init.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<fmt:requestEncoding value="UTF-8"/>

<c:choose>	
	<c:when test="${not empty param.salary }">
		<sql:update dataSource="${ds }" var="employee">
			update employee set name = ?, position = ?, salary = ? where id = ?;			
			<sql:param value="${param.name }"></sql:param>
			<sql:param value="${param.position }"></sql:param>
			<sql:param value="${param.salary }"></sql:param>
			<sql:param value="${param.id }"></sql:param>			
		</sql:update>		
	</c:when>
	<c:when test="${empty param.salary }">
		<sql:update dataSource="${ds }" var="employee">
			update employee set name = ?, position = ? where id = ?;			
			<sql:param value="${param.name }"></sql:param>
			<sql:param value="${param.position }"></sql:param>
			<sql:param value="${param.id }"></sql:param>
		</sql:update>
	</c:when>	
</c:choose>
<c:redirect url="index.jsp"></c:redirect>