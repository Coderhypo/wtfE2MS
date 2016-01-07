<%@ page import="models.Manager" %>
<%--
  Created by IntelliJ IDEA.
  User: hypo
  Date: 15-11-22
  Time: 上午12:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Manager manager = (Manager) request.getAttribute("manager");
%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="static/head.jsp"%>
	<title>修改管理员信息</title>
</head>
<body>
<%@include file="static/nav.jsp"%>
<%@include file="static/sideber.jsp"%>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
  <div class="col-lg-6 col-lg-offset-3" style="padding-top: 20px;">
    <h3>修改管理员信息</h3>
    <form class="form-horizontal" action="/editmanager/update" method="POST">
      <input type="hidden" name="id" value="<%=manager.getId()%>">
      <div class="form-group">
        <label class="col-sm-2 control-label">登录名</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name="login" placeholder="登录名" value="<%=manager.getLogin()%>">
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-2 control-label">昵称</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name="name" placeholder="昵称" value="<%=manager.getName()%>">
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-2 control-label">密码</label>
        <div class="col-sm-10">
          <input type="password" class="form-control" name="pass" placeholder="密码">
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
          <button type="submit" class="btn btn-info">确认信息</button>
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
