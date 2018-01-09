<%--
  Created by IntelliJ IDEA.
  User: 张振伟
  Date: 2018/1/9
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title></title>
</head>
<table id="tab">
</table>
<script>
    $(function(){


    $('#tab').bootstrapTable({
           url:'meal/query',
          method:'get',
         striped:true,
          pagination: true,
        pageNumber: 1,                       //初始化加载第一页，默认第一页
        pageSize: 10,                       //每页的记录行数（*）
        pageList: [10, 25, 50, 100],
        column:[{
               checkbox:true

        },{
               field:'mealname',
            title:'商品名称',
        },{
          field:'status',title:'商品状态',formtter:function(v,r,i){
                switch (v) {
                    case 1:
                        return '正常';
                        break;
                    case 2:
                        return '下架';
                        break;
                    case 3:
                        return '删除';
                        break;
                    default:
                        return '未知';
                        break;
                }
            }
        }]
    });
    });
</script>
</html>
