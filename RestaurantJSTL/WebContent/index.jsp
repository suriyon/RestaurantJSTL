<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="menu.jsp" %>  
<%@ include file="init.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Restaurant JSTL</title>
</head>
<body>
  

<h2>Restaurant JSTL</h2>
<c:choose>
	<c:when test="${not empty ds }">
		<sql:query var="employees" dataSource="${ds }">
			select * from employee;
		</sql:query>
		<c:if test="${not empty employees.rows }">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>รหัสพนักงาน</th>
						<th>ชื่อ-นามสกุล</th>
						<th>ตำแหน่ง</th>
						<th>เงินเดือน</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${employees.rows }" var="employee">
						<tr>
							<td>${employee.id }</td>
							<td>${employee.name }</td>
							<td>${employee.position }</td>
							<td>${employee.salary }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</c:when>
	<c:otherwise>
		<c:out value="No Data"></c:out>
	</c:otherwise>
</c:choose>
</body>
</html>