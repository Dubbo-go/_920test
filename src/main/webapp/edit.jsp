<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script type="application/javascript" src="js/jquery.min.js"></script>
<script type="application/javascript">
    $(function () {
        //根据eid查询用户信息
        $.ajax({
            url:"emp/findEmpByEid",
            data:{"eid":${param.eid}},
            type:"get",
            dataType:"json",
            success:function (obj) {
                var date = new Date(obj.hirdate);
                var newdate = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
                $("#ename").val(obj.ename);
                $("#address").val(obj.address);
                $("#hirdate").val(newdate);
                $("#eid").val(obj.eid);

                //查询全部的部门
                $.ajax({
                    url:"dept/findDeptList",
                    type:"get",
                    dataType:"json",
                    success:function (rs) {
                        var str="";
                        $(rs).each(function (index,item) {
                            if (obj.deptno==item.deptno) {
                                str +="<option selected value='"+item.deptno+"' >"+item.dname+"</option>";
                            }else{
                                str +="<option value='"+item.deptno+"' >"+item.dname+"</option>";
                            }
                        })
                        $("#deptno").html(str);
                    }
                });
            }
        });
    });
</script>

<body>
    <form action="emp/updateEmp" method="post">
        <input id="eid" name="eid" type="hidden">
        姓名: <input type="text" id="ename" name="ename" /><br>
        籍贯: <input type="text" id="address" name="address" /><br>
        部门: <select name="deptno" id="deptno">

                </select><br>
        日期: <input name="hirdate" id="hirdate" type="text" /><br>
        <input type="submit" value="更新"/>
    </form>
</body>
</html>
