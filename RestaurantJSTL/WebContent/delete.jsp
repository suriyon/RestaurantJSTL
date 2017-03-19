<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="init.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<fmt:requestEncoding value="UTF-8"/>

<sql:update dataSource="${ds }" >
	delete from employee where id = ?;
	<sql:param value="${param.id }"></sql:param>
</sql:update>

<c:redirect url="index.jsp"></c:redirect>