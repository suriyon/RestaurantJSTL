<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>    

<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
user="root" password="root" url="jdbc:mysql://localhost/tpqidb?characterEncoding=UTF-8"/>