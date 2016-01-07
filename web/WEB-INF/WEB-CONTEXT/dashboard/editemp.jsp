<%@ page import="models.Department" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Employee" %>
<%--
  Created by IntelliJ IDEA.
  User: hypo
  Date: 15-11-22
  Time: 上午12:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Employee employee = (Employee) request.getAttribute("employee");
  List<Department> departments = (List<Department>) request.getAttribute("departments");
%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="static/head.jsp"%>
	<title>修改员工信息</title>
</head>
<body>
<%@include file="static/nav.jsp"%>
<%@include file="static/sideber.jsp"%>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
  <div class="col-lg-6 col-lg-offset-3" style="padding-top: 20px">
    <h3>修改员工信息</h3>
    <form class="form-horizontal" action="/employee/update" method="POST">
      <input type="hidden" name="id" value="<%=employee.getId()%>">
      <div class="form-group">
        <label class="col-sm-2 control-label">员工代码</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name="code" placeholder="员工代码" value="<%=employee.getCode()%>">
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-2 control-label">员工姓名</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name="name" placeholder="员工姓名" value="<%=employee.getName()%>">
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
          <button type="submit" class="btn btn-info">确认修改</button>
          <a type="button" href="/employee/all" class="btn btn-default">返回</a>
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
