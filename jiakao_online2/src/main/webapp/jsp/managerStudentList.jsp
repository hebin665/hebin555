<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/easyui/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/easyui/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
	$(function(){
		$("#tt").datagrid({
			url:'${pageContext.request.contextPath}/managerStudentGetList.action',
			pagination:true,
			rownumbers:true,
			fit:true,
			fitColumns:true,
			toolbar:'#tb',
			columns:[[
				{
					field:'cb',
					align:'center',
					checkbox:true,
				},
				{
					field:'id',
					title:'编号',
					width:100,
					align:'center',
				},
				{
					field:'name',
					title:'帐号',
					width:150,
					align:'center',
				},
				{
					field:'password',
					title:'密码',
					width:150,
					align:'center',
				},
				{
					field:'sex',
					title:'性别',
					width:100,
					align:'center',
				},
				{
					field:'jointime',
					title:'注册时间',
					width:200,
					align:'center',
					formatter:function(value){
						var date=new Date(value);
						var y=date.getFullYear();
						var m=date.getMonth()+1;
						var d=date.getDate();
						return y+"-"+m+"-"+d;
					}
				},
				{
					field:'profesion',
					title:'专业',
					width:200,
					align:'center',
				}
			]]
		})
	})
    function resetValue(){
        $("#name").val("");
        $("#password").val("");
        $("#sex").val("");
        $("#type").val("");
        $("#addorupdate").val("");
        $("#id").val("");
        $("#profesion").val("");
    }

    function deleteStudent(){
		var selections=$("#tt").datagrid("getSelections");
		if (selections.length==0) {
			$.messager.alert("系统提示","请选择要删除的数据！");
			return;
		}
		var ids=[];
		for (var i = 0; i < selections.length; i++) {
			ids.push(selections[i].id);
		}
		var idsStr = ids.join();
		$.messager.confirm("系统提示","确定要删除这"+selections.length+"条数据吗？",function(r){
			if (r) {
				$.ajax({
					url:'${pageContext.request.contextPath }/managerDeleteStudent.action',
					data:idsStr,
					type:'post',
					contentType:'application/json;charset=utf-8',
					success:function(result){
						if (result=="success") {
							$.messager.alert("系统提示","删除成功！");
							closeDialog();
							$("#tt").datagrid("reload");
						}else{
							$.messager.alert("系统提示","删除失败，请联系系统管理员！");
						}
					}
				})
			}
		})
	}
	
	function openAddDialog() {
        var choice = $("#addorupdate").val("1");
        $("#name").attr("readonly",false);//默认是可编辑的，false
        $("#dlg").dialog("open").dialog("setTitle","添加考生信息");
    }
    
    function openUpdateDialog() {
        var selectedRow = $("#tt").datagrid("getSelected");
        if(selectedRow==null){
            $.messager.alert("系统提示","请选择要修改的数据");
            return;
		}
		$("#fm").form("load",selectedRow);
        $("#addorupdate").val("2");
		$("#name").attr("readonly",true);
        $("#dlg").dialog("open").dialog("setTitle","修改考生信息");
    }


    function closeDialog(){
        resetValue();
        $("#dlg").dialog("close");
    }
    function addOrUpdateStudent(){
        var choice = $("#addorupdate").val();
        var myUrl;
        if (choice=="1") {
            myUrl="${pageContext.request.contextPath }/managerAddStudent.action";
        }else{
            myUrl="${pageContext.request.contextPath }/managerUpdateStudent.action";
        }
        $("#fm").form("submit",{
            url:myUrl,
            onSubmit:function(){//提交触发前的回调函数
                return $(this).form("validate");//检查组件验证是否通过
            },
            success:function(result){
                if (result=="success") {
                    $.messager.alert("系统提示","操作成功！");
                    closeDialog();
                    resetValue();
                    $("#ff").datagrid("reload");//重新加载网格
                }else{
                    $.messager.alert("系统提示","操作失败，请联系系统管理员！");
                    resetValue();
                }
            }
        })
	}
</script>
</head>
<body style="margin: 1px">
<table id="tt"></table>
<div id="tb">
	<a href="javascript:deleteStudent()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除考生信息</a>
	<a href="javascript:openUpdateDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改考生信息</a>
	<a href="javascript:openAddDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加考生信息</a>
</div>

<div id="dlg" class="easyui-dialog" data-options="buttons:'#bts',closed:true" style="width: 300px;height:300px">
	<form id="fm" method="post">
		<table cellpadding="10px">
			<tr>
				<td>
					<input type="hidden" id="id" name="id">
				</td>
				<td>
					<input type="hidden" id="addorupdate" value="">
				</td>
			</tr>
			<tr>
				<td>考生姓名</td>
				<td><input id="name" type="text" name="name"></td>
			</tr>
			<tr>
				<td>考生密码</td>
				<td><input id="password" type="password" name="password"></td>
			</tr>
			<tr>
				<td>性别</td>
				<td><input id="sex" type="text" name="sex"></td>
			</tr>
			<tr>
				<td>专业</td>
				<td><input id="profesion" type="text" name="profesion"></td>
			</tr>
		</table>
	</form>
</div>

<div id="bts">
	<a href="javascript:addOrUpdateStudent()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
	<a href="javascript:closeDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">关闭</a>
</div>

</body>
</html>