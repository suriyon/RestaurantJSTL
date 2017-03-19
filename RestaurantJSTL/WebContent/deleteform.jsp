<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="menu.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="init.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ลบข้อมูล</title>
</head>
<body>
<h3>ลบข้อมูล</h3>
<fmt:requestEncoding value="UTF-8"/>
<form action="deleteform.jsp" method="post">
	<label>ป้อนรหัสพนักงาน</label>
	<input type="text" name="search" placeholder="enter id" required="required"	>
	<input type="submit" value="ค้นหา">
</form>
<c:if test="${param.search != null }">
	<sql:query var="employee" dataSource="${ds }">
		select * from employee where id = ?;
		<sql:param value="${param.search }"></sql:param>
	</sql:query>
	<c:if test="${not empty employee.rows  }">
		<form action="delete.jsp" method="post">
			<table>
				<c:forEach items="${employee.rows }" var="emp">
					<tr>
						<td>รหัสพนักงาน</td>
						<td>
							<input type="text" value="${emp.id }" readonly="readonly" name="id">
						</td>
					</tr>
					<tr>
						<td>ชื่อ-นามสกุล</td>
						<td>
							<input type="text" value="${emp.name }" name="name" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td>รหัสพนักงาน</td>
						<td>
							<input type="text" value="${emp.position }" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td>เงินเดือน</td>
						<td>
							<input type="text" value="${emp.salary }" name="salary" 
							readonly="readonly">						
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td></td>
					<td>
						<input type="submit" value="ลบ">
					</td>
				</tr>			
			</table>
		</form>
	</c:if>
	<c:if test="${empty employee.rows }">
		<label style="color: red;">*ไม่มีข้อมูลที่ค้นหา</label>
	</c:if>
</c:if>
</body>
</html>