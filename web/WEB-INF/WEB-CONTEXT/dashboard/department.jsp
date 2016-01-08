<%@ page import="java.util.List" %>
<%@ page import="models.Department" %>
<%--
  Created by IntelliJ IDEA.
  User: hypo
  Date: 15-11-22
  Time: 上午12:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  List<Department> departments = (List<Department>) request.getAttribute("dps");
%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="static/head.jsp"%>
	<title>部门管理</title>
</head>
<body>
<%@include file="static/nav.jsp"%>
<%@include file="static/sideber.jsp"%>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
  <div style="padding-top: 20px;">
    <h3>部门管理</h3>
    <hr/>
    <div class="col-md-6">
      <table class="table table-bordered table-hover">
        <thead>
        <tr>
          <th>部门ID</th>
          <th>部门代码</th>
          <th>部门名称</th>
          <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <%
          if(departments != null){

            for(Department department : departments){
        %>
        <tr>
          <th scope="row"><%=department.getId()%></th>
          <td><%=department.getCode()%></td>
          <td><%=department.getName()%></td>
          <td>
            <div class="btn-group btn-group-xs" role="group" aria-label="...">
              <a type="button" href="/department/edit?id=<%=department.getId()%>" class="btn btn-info">修改</a>
              <a type="button" href="/department/delete?id=<%=department.getId()%>" class="btn btn-danger">删除</a>
            </div>
          </td>
        </tr>
        <%
            }
          }
        %>
        </tbody>
      </table>
    </div>
    <div class="col-md-6">
      <form class="form-horizontal" action="/department/add" method="POST">
        <div class="form-group">
          <label class="col-sm-2 control-label">部门代码</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="code" placeholder="部门代码">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label">部门名称</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="name" placeholder="部门名称">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-info">添加部门</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>	<!--/.main-->
<script src="/static/js/jquery-1.11.1.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/chart.min.js"></script>
<script src="/static/js/chart-data.js"></script>
<script src="/static/js/easypiechart.js"></script>
<script src="/static/js/easypiechart-data.js"></script>
<script src="/static/js/bootstrap-datepicker.js"></script>
</body>
</html>
