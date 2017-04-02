<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询商品列表</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/1.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/button.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/items.js"></script>
<script type="text/javascript">
	var classpath="${pageContext.request.contextPath }";
</script>
</head>
<body>
	<form name="itemsForm"
		action="${pageContext.request.contextPath }/items/queryItems.html"
		method="post">
		<div class="close">
			<input type="button" value="注销" onclick="logout()" class="green_button"/>
		</div>
		<h2 align="center"><img src="${pageContext.request.contextPath}/images/zebratable.png"/>商品列表</h2>
		<table  width="100%" border=1 class="zebra">
			<tr>
				<td></td>
				<td>商品名称</td>
				<td>商品价格</td>
				<td>生产日期</td>
				<td>商品描述</td>
				<td colspan="2">编辑</td>
			</tr>
			<c:forEach items="${itemsList}" var="item">
				<tr>
					<td></td>
					<td>${item.name }</td>
					<td>${item.price }</td>
					<td><fmt:formatDate value="${item.createtime}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>${item.detail }</td>

					<td><a
						href="${pageContext.request.contextPath }/items/itemsDetails.html?id=${item.id}"><img
							alt="修改"
							src="${pageContext.request.contextPath }/images/magnifier.png" /></a>	
						<a onclick="deleteItems()"
						href="${pageContext.request.contextPath }/items/deleteItems.html?id=${item.id}"><img
							alt="删除"
							src="${pageContext.request.contextPath }/images/publish_r.png"/></a></td>

				</tr>
			</c:forEach>
		</table>
		查询条件：
		<table border=1>
			<tr>
				<td width="300px">商品名称：<input class="aa" type="text" name="items.name" /><input type="button" value="查询" onclick="queryItems()" class="green_button"/></td>
				<td><input class="green_button" type="button" value="批量修改" onclick="batchEditItems()" /></td>
			</tr>
		</table>
	</form>
</body>

</html>