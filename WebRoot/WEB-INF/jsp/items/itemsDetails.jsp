<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改商品信息</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/1.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/button.css" />
</head>
<body background="${pageContext.request.contextPath }/images/body.jpg">
	<a href="${pageContext.request.contextPath }/items/queryItems.html">主页</a>
	<form
		action="${pageContext.request.contextPath }/items/editItems.html"
		method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${items.id }"/> 
		<h2 align="center"><img src="${pageContext.request.contextPath}/images/zebratable.png"/>商品详情</h2>
		<table width="100%" border=1 class="zebra">	
			<tr>
				<td>商品名称</td>
				<td><input type="hidden" name="id" value="${items.id }"/>${items.name }</td>
			</tr>
			<tr>
				<td>商品价格</td>
				<td>${items.price }</td>
			</tr>
			<tr>
				<td>商品生产日期</td>
				<td><fmt:formatDate value="${items.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			</tr>
			<tr>
				<td>商品图片</td>
				<td><c:if test="${items.pic !=null}">
						<img src="/pic/${items.pic}" width=100 height=100 />
						<br />
					</c:if></td>
			</tr>
			<tr>
				<td>商品简介</td>
				<td>${items.detail }
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input class="button" type="submit" value="修改" />
				</td>
			</tr>
		</table>

	</form>
</body>

</html>