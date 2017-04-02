<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询商品列表</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/1.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/button.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/items.js"></script>
<script type="text/javascript">
	var classpath = "${pageContext.request.contextPath }";
</script>
</head>
<body background="${pageContext.request.contextPath }/images/body.jpg">
	<form name="itemsForm"
		action="${pageContext.request.contextPath }/items/queryItems.html"
		method="post">
		<h2 align="center">
			<img src="${pageContext.request.contextPath}/images/zebratable.png" />批量修改界面
		</h2>
		<table width="100%" border=1 class="zebra">
			<tr>
				<td></td>
				<td>商品名称</td>
				<td>商品价格</td>
				<td>生产日期</td>
				<td>商品描述</td>
				<td>操作</td>
			</tr>
			<c:forEach items="${itemsList }" var="item" varStatus="status">
				<tr>
					<td><input type="checkbox" name="ids" value="${item.id }" /></td>
					<td><input type="hidden" name="itemsList[${status.index }].id"
						value="${item.id }" /><input class="aa"
						name="itemsList[${status.index }].name" value="${item.name }" /></td>
					<td><input class="aa" name="itemsList[${status.index }].price"
						value="${item.price }" /></td>
					<td><input class="aa"
						name="itemsList[${status.index }].createtime"
						value="<fmt:formatDate value="${item.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/>" /></td>
					<td><input class="aa"
						name="itemsList[${status.index }].detail" value="${item.detail }" /></td>
					<td><a
						href="${pageContext.request.contextPath }/items/editItems.html?id=${item.id}"><img
							alt="修改"
							src="${pageContext.request.contextPath }/images/publish_r.png" /></a></td>

				</tr>
			</c:forEach>

		</table>
		查询条件：
		<table width="100%" border=1>
			<tr>
				<td>商品名称：<input name="items.name" class="aa" />
				</td>
				<td><input type="button" value="查询" onclick="batchEditItems()"
					class="button" /> <input type="button" value="批量修改提交"
					onclick="editItemsAllSubmit()" class="button" /> <input
					type="button" value="批量删除" onclick="deleteItemsAllSubmit()"
					class="button" /></td>
			</tr>
		</table>
	</form>
</body>

</html>