//跳转修改页面
$("#update").bind("click",function(){
	var billId=$("#billId").val();
	location.href="/getBookByid.action?id="+billId;
});
//删除
$("#del").bind("click",function(){
	var billId=$("#billId").val();
		if(confirm("确认删除？")){
			location.href="/deleteBook.action?id="+billId;
		}
});
