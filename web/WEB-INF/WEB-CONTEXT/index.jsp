<%@ page import="cn.updev.EventWeight.Rate.EventGroupRate" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.updev.Events.Static.EventWeight" %>
<%@ page import="cn.updev.Events.Event.FinishRate" %>
<%--
  Created by IntelliJ IDEA.
  User: hypo
  Date: 15-11-22
  Time: 上午12:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	Integer unFinishUserEventNum = (Integer) session.getAttribute("unFinishUserEventNum");
	Integer unFinishteamEventNum = (Integer) session.getAttribute("unFinishteamEventNum");
	Integer allFinishEventNum = (Integer) session.getAttribute("allFinishEventNum");
	Integer eventFinishRate = (Integer) session.getAttribute("eventFinishRate");
	List<EventGroupRate> groupRates = (List<EventGroupRate>) session.getAttribute("eventGroupRate");
	FinishRate finishRate = new FinishRate();
%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="dashboard/static/head.jsp"%>
	<title>仪表盘 - SpongeTime</title>
</head>
<body>
<%@include file="dashboard/static/nav.jsp"%>
<%@include file="dashboard/static/sideber.jsp"%>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row">
		<ol class="breadcrumb">
			<li><a href="/admin"><span class="glyphicon glyphicon-home"></span></a></li>
			<li class="active">Dashboard</li>
		</ol>
	</div><!--/.row-->
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">
				个人仪表盘
				<a type="button" href="/admin/addevents" class="btn btn-default" title="添加事件"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></a>
				<a type="button" href="/admin/todolist" class="btn btn-default" title="查看TODO列表"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span></a>
			</h3>
		</div>
		<div class="col-lg-12">
			<div style="padding-left: 20px; padding-right: 20px;">
				<div class="alert alert-success" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<p>
						<b>
							<span class="glyphicon glyphicon-bullhorn" aria-hidden="true"></span>
							测试运行公告：
						</b>
						1.[往期月完成事件数]未完成 、 2.团队模块未完成、 3.更新事件权重算法 、4.邮件提醒已上线
					</p>
				</div>
			</div>
		</div>
	</div><!--/.row-->
        
	<div class="row">
		<div class="col-xs-6 col-md-6 col-lg-3">
			<div class="panel panel-blue panel-widget ">
				<div class="row no-padding">
					<div class="col-sm-3 col-lg-5 widget-left">
						<em class="glyphicon glyphicon-user glyphicon-l"></em>
					</div>
					<div class="col-sm-9 col-lg-7 widget-right">
						<div class="large"><%=unFinishUserEventNum%></div>
						<div class="text-muted">个人事件进行数</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-6 col-md-6 col-lg-3">
			<div class="panel panel-orange panel-widget">
				<div class="row no-padding">
					<div class="col-sm-3 col-lg-5 widget-left">
						<em class="glyphicon glyphicon-briefcase glyphicon-l"></em>
					</div>
					<div class="col-sm-9 col-lg-7 widget-right">
						<div class="large"><%=unFinishteamEventNum%></div>
						<div class="text-muted">团队任务进行数</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-6 col-md-6 col-lg-3">
			<div class="panel panel-teal panel-widget">
				<div class="row no-padding">
					<div class="col-sm-3 col-lg-5 widget-left">
						<em class="glyphicon glyphicon-check glyphicon-l"></em>
					</div>
					<div class="col-sm-9 col-lg-7 widget-right">
						<div class="large"><%=allFinishEventNum%></div>
						<div class="text-muted">已完成事件数</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-6 col-md-6 col-lg-3">
			<div class="panel panel-red panel-widget">
				<div class="row no-padding">
					<div class="col-sm-3 col-lg-5 widget-left">
						<em class="glyphicon glyphicon-stats glyphicon-l"></em>
					</div>
					<div class="col-sm-9 col-lg-7 widget-right">
						<div class="large"><%=eventFinishRate%>%</div>
						<div class="text-muted">任务完成率</div>
					</div>
				</div>
			</div>
		</div>
	</div><!--/.row-->
		
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">往期月完成事件数</div>
				<div class="panel-body">
					<div class="canvas-wrapper">
						<canvas class="main-chart" id="line-chart" height="200" width="600"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div><!--/.row-->
		
	<div class="row">
		<div class="col-xs-6 col-md-3">
			<div class="panel panel-default">
				<div class="panel-body easypiechart-panel">
					<h4 title="在理想时间前完成计划，视为提前完成">提前完成率</h4>
					<div class="easypiechart" id="easypiechart-blue" data-percent="<%=finishRate.getAheadTimeFinish()%>" ><span class="percent"><%=finishRate.getAheadTimeFinish()%>%</span>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-6 col-md-3">
			<div class="panel panel-default">
				<div class="panel-body easypiechart-panel">
					<h4 title="完成时间与理想时间差值不超过三天，视为正常完成">正常完成率</h4>
					<div class="easypiechart" id="easypiechart-orange" data-percent="<%=finishRate.getNormalTimeFinish()%>" ><span class="percent"><%=finishRate.getNormalTimeFinish()%>%</span>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-6 col-md-3">
			<div class="panel panel-default">
				<div class="panel-body easypiechart-panel">
					<h4 title="超过理想时间三天后完成，视为延迟完成">延迟完成率</h4>
					<div class="easypiechart" id="easypiechart-teal" data-percent="<%=finishRate.getLaterTimeFinish()%>" ><span class="percent"><%=finishRate.getLaterTimeFinish()%>%</span>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-6 col-md-3">
			<div class="panel panel-default">
				<div class="panel-body easypiechart-panel">
					<h4 title="超过理想时间一个月仍未完成，视为计划坠毁">计划坠毁率</h4>
					<div class="easypiechart" id="easypiechart-red" data-percent="<%=finishRate.getLongTimeNotFinish()%>" ><span class="percent"><%=finishRate.getLongTimeNotFinish()%>%</span>
					</div>
				</div>
			</div>
		</div>
	</div><!--/.row-->
	<div class="row">
		<div class="col-lg-12">
			<h4>进行中事件组实时进度</h4>
		</div>
	</div><!--/.row-->
	<div class="row">
		<%
			if(groupRates != null && groupRates.size() > 0){
				for(EventGroupRate groupRate : groupRates){

					String weight = "";
					if(groupRate.getWeight() == EventWeight.RED){

						weight = "danger";
					}else if(groupRate.getWeight() == EventWeight.YELLOW){

						weight = "warning";
					}else if(groupRate.getWeight() == EventWeight.BLUE){

						weight = "info";
					}else if(groupRate.getWeight() == EventWeight.GREEN){

						weight = "success";
					}
		%>
		<div class="col-xs-12 col-md-6">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close" style="margin-top: 10px; margin-right: 15px;">
				<span aria-hidden="true">&times;</span>
			</button>
			<div class="panel panel-default">
				<div class="panel-body easypiechart-panel">
					<h4><a style="text-decoration: none;" href="
						   <%
							   if(groupRate.getTeamId() == null){
								   out.print("/admin/eventsmanage?groupId=" + groupRate.getEventGroupId());
							   }else {
								   out.print("#");
							   }
						   %>
						   "><span class="label label-<%=weight%>"><%=groupRate.getEventGroupTitle()%></span></a> <small>实时进度</small></h4>
					<div style="padding-left: 8%;">
						<div class="progress" style="width: 90%; padding: 3px;">
							<div class="progress-bar progress-bar-<%=weight%> progress-bar-striped active" role="progressbar" aria-valuenow="<%=groupRate.getGroupRate()%>" aria-valuemin="0" aria-valuemax="100" style="width: <%=groupRate.getGroupRate()%>%">
								<span class="sr-only"><%=groupRate.getGroupRate()%>% 完成</span>
							</div>
						</div>
						<p class="text-center">
							<b>完成率：<%=groupRate.getGroupRate()%>%</b>&nbsp;
							事件数：<%=groupRate.getEvnetNum()%>&nbsp;
							完成数：<%=groupRate.getFinishEventNum()%>
						</p>
						<p class="text-center">
							<small>
								创建时间：<%=groupRate.getCreateTime()%>&nbsp;
								理想完成时间：<%=groupRate.getGroupExpect()%>&nbsp;
								预计完成时间：<%=groupRate.getFinishTime()%>
							</small>
						</p>
					</div>
				</div>
			</div>
		</div>
		<%
			}}else {
		%>
		<div class="col-xs-12 col-md-12">
			<div class="panel panel-default">
				<div class="panel-body easypiechart-panel">
					<h4>From：进程控制君</h4>
					<div style="padding: 15px;">
						<p>并没有发现您有正在进行中的事件组_(:з」∠)_。你可以创建一个新事件组,或者发起团队任务。</p>
						<a href="/admin/addEventGroup" class="btn btn-info">创建事件组</a>
						<a href="/admin/group/addtask" class="btn btn-success">发起团队任务</a>
					</div>
				</div>
			</div>
		</div>
		<%}%>
	</div><!--/.row-->
	<div class="row">
		<div class="col-xs-12 col-md-12" style="border-top:1px solid #cfcfcf;margin-top: 30px;">
			<footer style="padding-top: 15px;">
				<center>
					<p>
						SpongeTime designed and built with all the love in the world by
						<a href="http://www.ihypo.net" target="_blank"> @hhHypo</a> and
						<a href="https://github.com/blf2" target="_blank"> @BLF2</a>.
					</p>
					<p>本项目开源并受 <a href="https://github.com/Coderhypo/SpongeTime/blob/master/LICENSE" target="_blank"> MIT</a> 开源协议保护，
						项目源码获取：<a href="https://github.com/Coderhypo/SpongeTime" target="_blank"> CoderHypo/SpongeTime</a>。</p>
					<p>欢迎start，欢迎fork，欢迎<a href="http://form.mikecrm.com/f.php?t=6mg20r" target="_blank">反馈</a>！</p>
					<p>SpongeTime v0.5 Alpha Build 151211</p>
				</center>
			</footer>
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
<script>
	$('#calendar').datepicker({
	});

	!function ($) {
		$(document).on("click","ul.nav li.parent > a > span.icon", function(){
			$(this).find('em:first').toggleClass("glyphicon-minus");
		});
		$(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
	}(window.jQuery);

	$(window).on('resize', function () {
		if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
	})
	$(window).on('resize', function () {
		if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
	})
</script>
</body>

</html>
