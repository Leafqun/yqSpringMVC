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

	<form
		action="${pageContext.request.contextPath }/items/updateItems.html"
		method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${items.id }"/> 
		<h2 align="center"><img src="${pageContext.request.contextPath}/images/zebratable.png"/>商品修改</h2>
		<table width="100%" border=1 class="zebra">	
			<tr>
				<td>商品名称</td>
				<td><input class="aa" type="text" name="name" value="${items.name }" /></td>
			</tr>
			<tr>
				<td>商品价格</td>
				<td><input class="aa" type="text" name="price" value="${items.price }" /></td>
			</tr>
			<tr>
				<td>商品生产日期</td>
				<td><input class="aa" type="text" name="createtime"
					value="<fmt:formatDate value="${items.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/>" /></td>
			</tr>
			<tr>
				<td>商品图片</td>
				<td><c:if test="${items.pic !=null}">
						<img src="/pic/${items.pic}" width=100 height=100 />
						<br />
					</c:if> <input type="file" name="items_pic"/></td>
			</tr>
			<tr>
				<td>商品简介</td>
				<td><textarea rows="3" cols="30" name="detail" class="aa" >${items.detail }</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input class="button" type="submit" value="提交" />
				</td>
			</tr>
		</table>

	</form>
</body>

</html>