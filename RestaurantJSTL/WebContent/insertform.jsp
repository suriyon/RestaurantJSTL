<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="menu.jsp" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>เพิ่มข้อมูลพนักงาน</title>
<title>Restaurant JSTL</title>
</head>
<body>
 
<h3>เพิ่มข้อมูลพนักงาน</h3>
<form action="insert.jsp" method="post">
	<table>
		<tr>
			<td>รหัสพนักงาน</td>
			<td>
				<input type="text" name="id" required="required" pattern="[S][0-9]{4}"
				title="รหัสขึ้นต้นด้วย S และตามด้วยตัวเลขอีก 4 หลัก">
				<c:if test="${not empty param.paramMessage }">
					<label style="color: red;">
						${param.paramMessage }
					</label>
				</c:if>
			</td>
		</tr>
		<tr>
			<td>ชื่อ-นามสกุล</td>
			<td>
				<input type="text" name="name" required="required" value="${param.paramName }">
			</td>
		</tr>
		<tr>
			<td>ตำแหน่ง</td>
			<td>
				<select name="position" required="required">
					<c:choose>
						<c:when test="${param.paramPosition == 1 }">
							<option value="1" selected="selected">1: ผู้จัดการร้าน</option>
							<option value="2">2: พ่อครัว</option>
							<option value="3">3: พนักงานเสริฟ์</option>
							<option value="4">4: พนักงานขับรถ</option>
						</c:when>
						<c:when test="${param.paramPosition == 2 }">
							<option value="1">1: ผู้จัดการร้าน</option>
							<option value="2" selected="selected">2: พ่อครัว</option>
							<option value="3">3: พนักงานเสริฟ์</option>
							<option value="4">4: พนักงานขับรถ</option>
						</c:when>
						<c:when test="${param.paramPosition == 3 }">
							<option value="1">1: ผู้จัดการร้าน</option>
							<option value="2">2: พ่อครัว</option>
							<option value="3" selected="selected">3: พนักงานเสริฟ์</option>
							<option value="4">4: พนักงานขับรถ</option>
						</c:when>
						<c:when test="${param.paramPosition == 4 }">
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
				<input type="text" name="salary" pattern="[0-9]{0,}"
				title="กรอกตัวเลขเท่านั้น" value="${param.paramSalary }">
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="submit" value="เพิ่ม">
			</td>
		</tr>
	</table>
</form>
</body>
</html>