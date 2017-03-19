<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="menu.jsp" %>
<%@ include file="init.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ค้นหาข้อมูล</title>
</head>
<body>
<h3>ค้นหาข้อมูล</h3>
<fmt:requestEncoding value="UTF-8"/>
<form action="search.jsp" method="post">
	<label>ค้นหาข้อมูลจากรหัส หรือชื่อ-นามสกุล</label>
	<input type="text" name="search">
	<input type="submit" value="ค้นหา">
</form>

<c:if test="${param.search != null }">
	<sql:query var="employees" dataSource="${ds }">
		select * from employee where id = ? or name like ?;
		<sql:param value="${param.search }"></sql:param>
		<sql:param value="%${param.search }%"></sql:param>
	</sql:query>
	
	<c:if test="${not empty employees.rows }">
		<table>
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
						<td style="text-align: center;">${employee.id }</td>
						<td>${employee.name }</td>
						<td style="text-align: center;">${employee.position }</td>
						<td style="text-align: right;">${employee.salary }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	<c:if test="${empty employees.rows }">
		<label style="color: red;">*ไม่มีข้อมูลที่ค้นหา</label>
	</c:if>
</c:if>


</body>
</html>