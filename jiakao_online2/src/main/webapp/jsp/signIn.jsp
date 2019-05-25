<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath }/image/main_logo.ico" rel="shortcut icon">
<title>在线考试系统-注册</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("input:first").change(function(){
			var name=$(this).val();
			if(name==""){
				return;
			}
			$.ajax({
				url:'${pageContext.request.contextPath}/checkSignIn.action',
				data:'name='+name,
				type:'post',
				success:function(data){
					if(data==false){
						$("#sp").text("帐号已被注册！");
					}else{
						$("#sp").text("");
					}
				}
			})
		})
		$("#subm").click(function(){
			var flag=true;
			$(":text").each(function(){
				var thisVal = $(this).val();
				var thisText=$(this).parent().prev().text();
				if(thisVal==""){
					alert(thisText+"不能为空！");
					flag=false;
					return false;
				}
			})
			if(flag){
				var password1=$("#password1").val();
				var password2=$("#password2").val();
				var spanText = $("#sp").text();
				if(spanText != ""){
					alert("帐号已被注册！");
					return false;
				}
				if(password1=="" || password2==""){
					alert("请输入密码！");
					return false;
				}
				if(password1 != password2){
					alert("两次密码输入不一致！");
					return false;
				}
				return true;
			}
		})
	})
</script>
</head>
<body style="background-image:url('${pageContext.request.contextPath}/image/loginback.jpg');background-size:cover">
<div style="line-height:80px;height:80px;background-image:url('${pageContext.request.contextPath}/image/signinback.jpg');background-size:cover">
	<font color="white" size="10" face="仿宋" style="font-weight:bold;margin-left:2%">驾 校 在 线 考 试 网</font>
</div>
<div style="margin-top:2%;margin-left:2%">
	<font color="black">当前位置 ： 考生注册</font>
</div>
<center style="margin-top:2%">
	<form action="${pageContext.request.contextPath }/signIn.action" method="post">
		<table cellpadding="6px">
			<tr>
				<td><font color="#E8FFF5">帐号</font></td>
				<td><input type="text" name="name"><font id="sp" color="red"></font></td>
			</tr>
			<tr>
				<td><font color="#E8FFF5">密码</font></td>
				<td><input id="password1" type="password" name="password"></td>
			</tr>
			<tr>
				<td><font color="#E8FFF5">确认密码</font></td>
				<td><input id="password2" type="password"></td>
			</tr>
			<tr>
				<td><font color="#E8FFF5">性别</font></td>
				<td>
					<select name="sex">
						<option value="男"><font color="#E8FFF5">男</font></option>
						<option value="女"><font color="#E8FFF5">女</font></option>
					</select>
				</td>
			</tr>
			<tr>
				<td><font color="#E8FFF5">专业</font></td>
				<td><input type="text" name="profesion"></td>
			</tr>
			<tr>
				<td><input id="subm" type="submit" value="注册" style="background:yellow"></td>
				<td align="right"><input type="reset" value="重置" style="background:yellow"></td>
			</tr>
		</table>
		<br>
		<br>
		<a href="${pageContext.request.contextPath }/jsp/login.jsp"><font color="#E8FFF5">回 去 登 录</font></a>
	</form>
</center>
</body>
</html>