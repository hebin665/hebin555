<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>在线考试系统-正在考试</title>
    <link  rel="stylesheet" type="text/css"
           href="${pageContext.request.contextPath }/css/main.css">
    <link  rel="stylesheet" type="text/css"
           href="${pageContext.request.contextPath }/css/test.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/easyui/themes/icon.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/easyui/locale/easyui-lang-zh_CN.js"></script>
   <script type="text/javascript"
            src="${pageContext.request.contextPath }/js/jquery.easy-pie-chart.js"></script>

    <style>
        .hasBeenAnswer {
            background: #5d9cec;
            color:#fff;
        }

    </style>
</head>

<body>
<div data-options="region:'north'" style="line-height:60px;height:80px;background-image:url('${pageContext.request.contextPath}/image/signinback.jpg');background-size:cover">
    <font color="white" size="10" styleface="仿宋" style="font-weight:bold;margin-left:2%">驾 校 在 线 考 试 系 统</font>
    <font id="ft1" size="3px" style="margin-right:12%">当 前 考 生：<span id="sp1">${sessionScope.studentName }</span></font>
</div>
<div class="main">
    <!--nr start-->
    <div class="test_main">
        <div class="nr_left">
            <div class="test">
                <form action="${pageContext.request.contextPath }/postExam.action" method="post">

                    <div class="test_title">
                        <p class="test_time">
                            <i class="icon iconfont">&#xe6fb;</i><b class="alt-1"></b>
                        </p>
                        <font><input type="submit" id="submi" name="test_jiaojuan" value="交卷"></font>
                    </div>
                    <%!
                        int counter=0;
                        synchronized void counterFunction()
                        {
                            counter++;
                        }
                    %>
                    <div class="test_content">

                        <div class="test_content_title">
                            <h2>单选题</h2>
                            <p>
                                <span>共</span><i class="content_lit"></i><span>题，</span><span>合计</span><i class="content_fs">分</i><span>分</span>
                            </p>
                        </div>
                    </div>
                    <div class="test_content_nr">
                        <ul>
                    <c:forEach items="${list }" var="item1" varStatus="varStatus">
                        <c:if test="${item1.type eq '单选' }">
                            <%counterFunction();
                            %>

                            <li id="qu_0_<%=counter%>">
                                <div class="test_content_nr_tt">
                                    <i><%=counter %></i><font>${item1.subject }</font><b class="icon iconfont">&#xe881;</b>
                                </div>

                                <div class="test_content_nr_main">
                                    <ul>

                                        <li class="option">

                                            <input type="radio" class="radioOrCheck" name="answerMap[${item1.id }]" value="A"
                                                   id="0_answer_<%=counter%>_option_1"
                                            />


                                            <label for="0_answer_<%=counter%>_option_1">
                                                A.
                                                <p class="ue" style="display: inline;">${item1.optiona }</p>
                                            </label>
                                        </li>

                                        <li class="option">

                                            <input type="radio" class="radioOrCheck" name="answerMap[${item1.id }]" value="B"
                                                   id="0_answer_<%=counter %>_option_2"
                                            />


                                            <label for="0_answer_<%=counter %>_option_2">
                                                B.
                                                <p class="ue" style="display: inline;">${item1.optionb }</p>
                                            </label>
                                        </li>

                                        <li class="option">

                                            <input type="radio" class="radioOrCheck" name="answerMap[${item1.id }]" value="C"
                                                   id="0_answer_<%=counter %>_option_3"
                                            />


                                            <label for="0_answer_<%=counter %>_option_3">
                                                C.
                                                <p class="ue" style="display: inline;">${item1.optionc }</p>
                                            </label>
                                        </li>

                                        <li class="option">

                                            <input type="radio" class="radioOrCheck" name="answerMap[${item1.id }]" value="D"
                                                   id="0_answer_<%=counter %>_option_4"
                                            />


                                            <label for="0_answer_<%=counter %>_option_4">
                                                D.
                                                <p class="ue" style="display: inline;">${item1.optiond }</p>
                                            </label>
                                        </li>

                                    </ul>
                                    <div class="test_content_nr_img">
                                    <img src=${item1.imageurl}>
                                    </div>
                                </div>


                            </li>
                        </c:if>
                    </c:forEach>
                        </ul>
                    </div>
                    <div class="test_content">

                        <div class="test_content_title">
                            <h2>判断题</h2>
                            <p>
                                <span>共</span><i class="content_lit"></i><span>题，</span><span>合计</span><i class="content_fs">分</i><span>分</span>
                            </p>
                        </div>
                    </div>
                    <div class="test_content_nr">
                        <ul>
                            <c:forEach items="${list }" var="item1" varStatus="varStatus">
                                <c:if test="${item1.type eq '判断' }">
                                    <%counterFunction();
                                    %>

                                    <li id="qu_2_<%=counter%>">
                                        <div class="test_content_nr_tt">
                                            <i><%=counter %></i><font>${item1.subject }</font><b class="icon iconfont">&#xe881;</b>
                                        </div>

                                        <div class="test_content_nr_main">
                                            <ul>

                                                <li class="option">

                                                    <input type="radio" class="radioOrCheck" name="answerMap[${item1.id }]" value="A"
                                                           id="3_answer_<%=counter%>_option_1"
                                                    />


                                                    <label for="3_answer_<%=counter%>_option_1">
                                                        A.
                                                        <p class="ue" style="display: inline;">${item1.optiona }</p>
                                                    </label>
                                                </li>

                                                <li class="option">

                                                    <input type="radio" class="radioOrCheck" name="answerMap[${item1.id }]" value="B"
                                                           id="3_answer_<%=counter %>_option_2"
                                                    />


                                                    <label for="3_answer_<%=counter %>_option_2">
                                                        B.
                                                        <p class="ue" style="display: inline;">${item1.optionb }</p>
                                                    </label>
                                                </li>

                                            </ul>
                                            <div class="test_content_nr_img">
                                                <img src=${item1.imageurl}>
                                            </div>
                                        </div>

                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="test_content">
                        <div class="test_content_title">
                            <h2>多选题</h2>
                            <p>
                                <span>共</span><i class="content_lit">30</i><span>题，</span><span>合计</span><i class="content_fs">30</i><span>分</span>
                            </p>
                        </div>
                    </div>
                    <div class="test_content_nr">
                        <ul>
                        <c:forEach items="${list }" var="item2" varStatus="varStatus">
                        <c:if test="${item2.type eq '多选' }">
                        <%counterFunction();%>
                            <li id="qu_1_<%=counter %>">
                                <div class="test_content_nr_tt">
                                    <i><%=counter %></i><font>${item2.subject }</font><b class="icon iconfont">&#xe881;</b>
                                </div>

                                <div class="test_content_nr_main">
                                    <ul>

                                        <li class="option">


                                            <input type="checkbox" class="radioOrCheck" name="answerMap[${item2.id }]" value="A"
                                                   id="1_answer_<%=counter %>_option_1"
                                            />

                                            <label for="1_answer_<%=counter %>_option_1">
                                                A.
                                                <p class="ue" style="display: inline;">${item2.optiona }</p>
                                            </label>
                                        </li>

                                        <li class="option">


                                            <input type="checkbox" class="radioOrCheck" name="answerMap[${item2.id }]" value="B"
                                                   id="1_answer_<%=counter %>_option_2"
                                            />

                                            <label for="1_answer_<%=counter %>_option_2">
                                                B.
                                                <p class="ue" style="display: inline;">${item2.optionb }</p>
                                            </label>
                                        </li>

                                        <li class="option">


                                            <input type="checkbox" class="radioOrCheck" name="answerMap[${item2.id }]" value="C"
                                                   id="1_answer_<%=counter %>_option_3"
                                            />

                                            <label for="1_answer_<%=counter %>_option_3">
                                                C.
                                                <p class="ue" style="display: inline;">${item2.optionc }</p>
                                            </label>
                                        </li>

                                        <li class="option">


                                            <input type="checkbox" class="radioOrCheck" name="answerMap[${item2.id }]" value="D"
                                                   id="1_answer_<%=counter %>_option_4"
                                            />

                                            <label for="1_answer_<%=counter %>_option_4">
                                                D.
                                                <p class="ue" style="display: inline;">${item2.optiond }</p>
                                            </label>
                                        </li>

                                    </ul>
                                    <div class="test_content_nr_img">
                                        <img src=${item2.imageurl}>
                                    </div>
                                </div>

                            </li>
                        </c:if>
                        </c:forEach>
                        </ul>
                    </div>

                </form>
            </div>

        </div>
        <div class="nr_right">
            <div class="nr_rt_main">
                <div class="rt_nr1">
                    <div class="rt_nr1_title">
                        <h1>
                            <i class="icon iconfont">&#xe692;</i>答题卡
                        </h1>
                        <%!
                            int counter_answer=0;
                            synchronized void counter_answerFunction()
                            {
                                counter_answer++;
                            }
                        %>
                        <p class="test_time">
                            <i class="icon iconfont">&#xe6fb;</i><b class="alt-1"></b>
                        </p>
                    </div>

                    <div class="rt_content">
                        <div class="rt_content_tt">
                            <h2>单选题</h2>
                            <%--<p>--%>
                                <%--<span>共</span><i class="content_lit">60</i><span>题</span>--%>
                            <%--</p>--%>
                        </div>
                        <div class="rt_content_nr answerSheet">
                            <ul>
                                <c:forEach items="${list }" var="item1" varStatus="varStatus">
                                    <c:if test="${item1.type eq '单选' }">
                                        <%counter_answerFunction();
                                        %>
                                        <li><a href="#qu_0_<%=counter_answer%>"><%=counter_answer%></a></li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>

                    <div class="rt_content">
                        <div class="rt_content_tt">
                            <h2>判断题</h2>
                            <%--<p>--%>
                            <%--<span>共</span><i class="content_lit">60</i><span>题</span>--%>
                            <%--</p>--%>
                        </div>
                        <div class="rt_content_nr answerSheet">
                            <ul>
                                <c:forEach items="${list }" var="item1" varStatus="varStatus">
                                    <c:if test="${item1.type eq '判断' }">
                                        <%counter_answerFunction();
                                        %>
                                        <li><a href="#qu_2_<%=counter_answer%>"><%=counter_answer%></a></li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>

                    <div class="rt_content">
                        <div class="rt_content_tt">
                            <h2>多选题</h2>
                            <p>
                                <span>共</span><i class="content_lit">30</i><span>题</span>
                            </p>
                        </div>
                        <div class="rt_content_nr answerSheet">
                            <ul>
                                <c:forEach items="${list }" var="item2" varStatus="varStatus">
                                    <c:if test="${item2.type eq '多选' }">
                                        <%counter_answerFunction();
                                        %>
                                        <li><a href="#qu_1_<%=counter_answer%>"><%=counter_answer%></a></li>
                                    </c:if>
                                </c:forEach>



                            </ul>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
    <!--nr end-->
    <div class="foot"></div>
</div>


<script>
    $(function() {
        show_time(0.5*60);
        $('li.option label').click(function() {
            debugger;
            var examId = $(this).closest('.test_content_nr_main').closest('li').attr('id'); // 得到题目ID
            var cardLi = $('a[href=#' + examId + ']'); // 根据题目ID找到对应答题卡
            // 设置已答题
            if(!cardLi.hasClass('hasBeenAnswer')){
                cardLi.addClass('hasBeenAnswer');
            }

        });

        $("#submi").click(function(){
            var b = checkIfselected();
            if(b==false){
                return false;
            }
            var flag=confirm("确定要交卷吗？");
            if(flag){
                return true;
            }else{
                return false;
            }
        })

    });
    function checkIfselected(){
        var size = $("input:checkbox:checked").size();
        var size2 = $("input:radio:checked").size();
        if(size<1 && size2<1){
            alert("请至少做一道吧，同学！");
            return false;
        }
    }
    function show_time(totalTime){
        if(totalTime==0){
            alert("考试时间结束！系统将会自动提交试卷！");
            $("form").submit(function(){
                checkIfselected();
            });
            return false;
        }
        var remainTime=totalTime-1;
        var min = remainTime/60;
        min=parseInt(min);
        var s=remainTime%60;
        var str=min+":"+s;
        $(".alt-1").text(str);
        setTimeout("show_time("+remainTime+")",1000);
    }
</script>

</body>

</html>