function batchEditItems() {
	//提交form
	document.itemsForm.action =classpath+"/items/batchEditItems.html";
	document.itemsForm.submit();
}

function queryItems() {
	//提交form
	document.itemsForm.action =classpath+"/items/queryItems.html";
	document.itemsForm.submit();
}

function logout() {
	if(event.returnValue = confirm("你确认要注销吗？")) {
		document.itemsForm.action = classpath+"/logout.html";
		document.itemsForm.submit();
	}
}

function deleteItems() {
	if(event.returnValue = confirm("你确认要删除吗？")) {
		document.itemsForm.action = classpath+"/items/deleteItems.html";
		document.itemsForm.submit();
	}
}
function editItemsAllSubmit(){
	//提交form
	document.itemsForm.action=classpath+"/items/editItemsAllSubmit.html";
	document.itemsForm.submit();
}
function deleteItemsAllSubmit(){
	//提交form
	if(event.returnValue = confirm("你确认要删除吗？")){
		document.itemsForm.action=classpath+"/items/deleteItemsAllSubmit.html";
		document.itemsForm.submit();
	}
}