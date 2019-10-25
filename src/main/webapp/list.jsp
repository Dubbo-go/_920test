<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/20
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script type="application/javascript" src="js/jquery.min.js"></script>
<script type="application/javascript">
    $(function () {
        //获取用户全部数据
        FenYe(1);
    });
    
    function FenYe(pageNum) {
        $.ajax({
            url:"emp/findEmpList",
            data:{"pageNum":pageNum},
            type:"get",
            dataType:"json",
            success:function (pageInfo) {
                $(".aaa").remove();
                $("#d1").text(pageInfo.pageNum);
                $("#dd2").val(pageInfo.prePage);

                if(pageInfo.pageNum==pageInfo.pages){
                    pageInfo.nextPage=pageInfo.pages;
                }
                $("#dd3").val(pageInfo.nextPage);
                $("#dd4").val(pageInfo.pages);
                $("#d5").text(pageInfo.pages);
                var rs = pageInfo.list;
                var str="";
                for(var i = 0;i < rs.length;i++){
                    var date = new Date(rs[i].hirdate);
                    var newdate = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
                    str +="<tr class='aaa' >\n" +
                        "            <td>"+rs[i].eid+"</td>\n" +
                        "            <td>"+rs[i].ename+"</td>\n" +
                        "            <td>"+rs[i].address+"</td>\n" +
                        "            <td>"+rs[i].dept.dname+"</td>\n" +
                        "            <td>"+newdate+"</td>\n" +
                        "            <td><a href='emp/deleteEmpByEid?eid="+rs[i].eid+"'>删除</a>&nbsp;&nbsp;<a href='edit.jsp?eid="+rs[i].eid+"'>更新</a></td>\n" +
                        "        </tr>";
                }
                $("#ttr").after(str);
            }
        });
    }
</script>
<style type="text/css">
    #tab{
        text-align: center;
        margin-left: 400px;
        margin-top: 40px;
    }
    #span1{
        margin-left: 470px;
    }
</style>
<body>
<input id="dd2" type="hidden"/>
<input id="dd3" type="hidden"/>
<input id="dd4" type="hidden"/>
    <table id="tab" width="500px" border="1px">
        <tr id="ttr">
            <th>编号</th>
            <th>姓名</th>
            <th>籍贯</th>
            <th>部门</th>
            <th>入职日期</th>
            <th>操作</th>
        </tr>

    </table>
    <span id="span1" ></span>
    当前是第&nbsp;<span id="d1"></span>&nbsp;页
    <a href="javascript:FenYe()">首页</a>
    <a href="javascript:FenYe($('#dd2').val())">上一页</a>
    <a href="javascript:FenYe($('#dd3').val())">下一页</a>
    <a href="javascript:FenYe($('#dd4').val())">尾页</a>
    共有&nbsp;<span id="d5"></span>&nbsp;页


</body>
</html>
