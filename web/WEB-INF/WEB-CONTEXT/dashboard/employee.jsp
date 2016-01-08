<%@ page import="java.util.Map" %>
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
  List<Map> ems = (List<Map>) request.getAttribute("ems");
  List<Department> departments = (List<Department>) request.getAttribute("departments");
%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="static/head.jsp"%>
	<title>员工管理</title>
</head>
<body>
<%@include file="static/nav.jsp"%>
<%@include file="static/sideber.jsp"%>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
  <div style="padding-top: 20px;">
    <h3>员工管理</h3>
    <hr/>
    <div class="col-md-8 col-md-offset-2">
      <h4>员工列表</h4>
      <table class="table table-bordered table-hover">
        <thead>
        <tr>
          <th>员工ID</th>
          <th>员工代码</th>
          <th>姓名</th>
          <th>性别</th>
          <th>部门</th>
          <th>入职时间</th>
          <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <%
          if(ems != null){

            for(Map em : ems){
        %>
        <tr>
          <th scope="row"><%=em.get("id")%></th>
          <td><%=em.get("code")%></td>
          <td><%=em.get("name")%></td>
          <td><%=em.get("sex")%></td>
          <td><%=em.get("dp")%></td>
          <td><%=em.get("workday")%></td>
          <td>
            <div class="btn-group btn-group-xs" role="group" aria-label="...">
              <a type="button" href="/employee/edit?id=<%=em.get("id")%>" class="btn btn-info">修改</a>
              <a type="button" href="/employee/delete?id=<%=em.get("id")%>" class="btn btn-danger">删除</a>
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
    <hr/>
    <div class="col-md-8 col-md-offset-2">
      <h4>添加员工</h4>
      <form class="form-horizontal" action="/employee/add" method="POST">
        <div class="form-group">
          <label class="col-sm-2 control-label">员工代码</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="code" placeholder="员工代码">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label">员工姓名</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" name="name" placeholder="员工姓名">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label">员工性别</label>
          <div class="col-sm-10">
            <select name="sex" class="form-control">
              <option value="男">男</option>
              <option value="女">女</option>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label">部门</label>
          <div class="col-sm-10">
            <select name="dpId" class="form-control">
              <%
                if(departments != null){

                  for(Department department : departments){
              %>
              <option value="<%=department.getId()%>"><%=department.getName()%></option>
              <%
                  }
                }
              %>
            </select>
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-info">添加员工</button>
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
