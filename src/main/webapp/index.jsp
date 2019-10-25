<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript">
    $(function () {
        alert("1");
        //获取全部部门
        $.ajax({
            url:"${pageContext.request.contextPath}/dept/findDeptList",
            type:"get",
            dataType:"json",
            success:function (obj) {
                alert("2");
                var str="<option value='0' >请选择部门</option>";
                $(obj).each(function (index,item) {
                    str +="<option value='"+item.deptno+"' >"+item.dname+"</option>";
                })
                $("#deptno").html(str);
            }
        });
    });
</script>

<body >
    <form action="${pageContext.request.contextPath}/emp/addEmp" method="post" >
        姓名: <input type="text" name="ename" /><br>
        籍贯: <input type="text" name="address" /><br>
        部门: <select name="deptno" id="deptno">
                </select><br>
        日期: <input name="hirdate" type="date" /><br>
        <input type="submit" value="注册"/>
    </form>
</body>
</html>
