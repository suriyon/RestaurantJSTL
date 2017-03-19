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
<title>แก้ไขข้อมูล</title>
</head>
<body>
<h3>แก้ไขข้อมูล</h3>
<fmt:requestEncoding value="UTF-8"/>
<form action="editform.jsp" method="post">
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
		<form action="update.jsp" method="post">
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
							<input type="text" value="${emp.name }" name="name" required="required">
						</td>
					</tr>
					<tr>
						<td>รหัสพนักงาน</td>
						<td>
							<select name="position">
								<c:choose>
									<c:when test="${emp.position == 1 }">
										<option value="1" selected="selected">1: ผู้จัดการร้าน</option>
										<option value="2">2: พ่อครัว</option>
										<option value="3">3: พนักงานเสริฟ์</option>
										<option value="4">4: พนักงานขับรถ</option>
									</c:when>
									<c:when test="${emp.position == 2 }">
										<option value="1">1: ผู้จัดการร้าน</option>
										<option value="2" selected="selected">2: พ่อครัว</option>
										<option value="3">3: พนักงานเสริฟ์</option>
										<option value="4">4: พนักงานขับรถ</option>
									</c:when>
									<c:when test="${emp.position == 3 }">
										<option value="1">1: ผู้จัดการร้าน</option>
										<option value="2">2: พ่อครัว</option>
										<option value="3" selected="selected">3: พนักงานเสริฟ์</option>
										<option value="4">4: พนักงานขับรถ</option>
									</c:when>
									<c:when test="${emp.position == 4 }">
										<option value="1">1: ผู้จัดการร้าน</option>
										<option value="2">2: พ่อครัว</option>
										<option value="3">3: พนักงานเสริฟ์</option>
										<option value="4" selected="selected">4: พนักงานขับรถ</option>
									</c:when>
									<c:otherwise>
										<option value="1">1: ผู้จัดการร้าน</option>
										<option value="2">2: พ่อครัว</option>
										<option value="3">3: พนักงานเสริฟ์</option>
										<option value="4">4: พนักงานขับรถ</option>
									</c:otherwise>
								</c:choose>
							</select>
						</td>
					</tr>
					<tr>
						<td>เงินเดือน</td>
						<td>
							<input type="text" value="${emp.salary }" name="salary" 
							pattern="[0-9]{0,}" title="ป้อนเป็นตัวเลขเท่านั้น">						
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td></td>
					<td>
						<input type="submit" value="แก้ไข">
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