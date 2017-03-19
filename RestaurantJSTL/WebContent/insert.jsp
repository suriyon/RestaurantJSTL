<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="init.jsp" %>    

<fmt:requestEncoding value="UTF-8"/>
<sql:query var="counter" dataSource="${ds }">
	select count(*) as c from employee where id = ?;
	<sql:param value="${param.id }"></sql:param>
</sql:query>
<c:forEach items="${counter.rows }" var="num">
	<c:if test="${num.c > 0 }">	
		<c:redirect url="insertform.jsp">
			<c:param name="paramName" value="${param.name }"></c:param>
			<c:param name="paramPosition" value="${param.position}"></c:param>
			<c:param name="paramSalary" value="${param.salary }"></c:param>
			<c:param name="paramMessage" value="รหัสซ้ำ ป้อนรหัสใหม่"></c:param>
		</c:redirect>
	</c:if>		
</c:forEach>

<c:choose>	
	<c:when test="${not empty param.salary }">
		<sql:update dataSource="${ds }" var="employee">
			insert into employee(id, name, position, salary) values(?, ?, ?, ?);
			<sql:param value="${param.id }"></sql:param>
			<sql:param value="${param.name }"></sql:param>
			<sql:param value="${param.position }"></sql:param>
			<sql:param value="${param.salary }"></sql:param>			
		</sql:update>
		<c:redirect url="index.jsp"></c:redirect>
	</c:when>
	<c:when test="${empty param.salary }">
		<sql:update dataSource="${ds }" var="employee">
			insert into employee(id, name, position) values(?, ?, ?);
			<sql:param value="${param.id }"></sql:param>
			<sql:param value="${param.name }"></sql:param>
			<sql:param value="${param.position }"></sql:param>
					
		</sql:update>
		<c:redirect url="index.jsp"></c:redirect>
	</c:when>
</c:choose>