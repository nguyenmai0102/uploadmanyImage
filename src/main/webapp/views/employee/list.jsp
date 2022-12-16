<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: levietdunghiki
  Date: 13-Dec-22
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>This is list Page</h1>
<a href="<%=request.getContextPath()%>/employee/create">Create Employee</a>
<div>
    <form action="<%=request.getContextPath()%>/employee/search" method="post">
        <input type="text" name="search" />
        <input type="submit" value="search" />
    </form>
</div>
<table>
    <thead>
    <tr>
        <td>Id</td>
        <td>Name</td>
        <td>Email</td>
        <td>Avatar</td>
        <td>Name Company</td>
        <td>Edit</td>
        <td>Delete</td>

    </tr>
    </thead>
    <tbody>
    <c:forEach items="${listEmployee}" var="employee">
        <tr>
            <td>${employee.id}</td>
            <td>${employee.name}</td>
            <td>${employee.email}</td>
            <td><img width="100px" height="auto" src="${employee.avatar}" alt="avatar"></td>
            <td><a href="<%=request.getContextPath()%>/employee/edit?id=${employee.id}">Edit</a></td>
            <td><a href="<%=request.getContextPath()%>/employee/delete?id=${employee.id}">Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>