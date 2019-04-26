<%--
  Created by IntelliJ IDEA.
  User: 79831
  Date: 2019/4/4
  Time: 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>驾考在线考试</title>
    <link href="${pageContext.request.contextPath }/image/main_logo.ico" rel="shortcut icon">
    <style type="text/css">
        h2{color:white;}
       label{color: white}
    </style>
</head>
<body style="background-image:url('${pageContext.request.contextPath}/image/loginback.jpg');background-size:cover">
<div style="text-align:center;margin-top:12%">
    <font face="仿宋" size="10" color="white">请选择您要登陆的类型</font>
    <h2>No.1驾考系统登录，No.1驾考网站为您准备了驾考考网上报名系统登录随机试题模拟考试训练，您需要在规定时间内完成给定的驾考考网上报名系统登录答题。要继续进行更多的驾考考网上报名系统登录练习，只需在答题结束后点击重新出卷按钮。No.1驾考助您考试成功早日拿证！</h2>
    <input type="radio" name="radio1" value="student" id="radio1"><label for='radio1'>考生登陆</label>
    <input type="radio" name="radio1" value="manager" id="radio2"><label for='radio2'>管理员登陆</label>
    <input type="button" id="button" onClick="checks()"><label for='button'>确定</label>


</div>
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
    function checks() {
        var radios = document.getElementsByName("radio1");
        for (var i = 0; i < radios.length; i++) {
            var users = radios[i].value;
            if(radios[i].checked==true){
                if(radios[i].value=="student"){
                    window.location.href = "${pageContext.request.contextPath}/jsp/login.jsp";
                }else {
                    window.location.href = "${pageContext.request.contextPath}/jsp/managerLogin.jsp";
                }
            }


        }
}
</script>
</body>
</html>
