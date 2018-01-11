<%--
  Created by IntelliJ IDEA.
  User: 张振伟
  Date: 2018/1/11
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="form-group" title="商品详情" data-options="fit:true">
    <form class="itemForm" id="itemAddForm" name="itemAddForm" method="post">
        <tr>
            <td class="label">商品类别：</td>
            <td>
                <input id="cid" name="cid" style="width:200px;"class="form-control input-sm">
            </td>
        </tr>
        <tr>
            <td class="label">商品：</td>
            <td>
                <input class="form-control input-sm" type="text" id="title" name="title"
                       data-options="required:true" style="width:100%">
            </td>
        </tr>
        <tr>
            <td class="label">商品卖点：</td>
            <td>
                <input class="form-control input-sm" type="text" id="sellPoint" name="sellPoint"
                       data-options="validType:'length[0,150]',multiline:true" style="width:100%;height:60px;">
            </td>
        </tr>
        <tr>
            <td class="label">商品价格：</td>
            <td>
                <input class="form-control input-sm" type="text" id="priceView" name="priceView"
                       data-options="required:true,min:0,precision:2">
                <input type="hidden" id="price" name="price">
            </td>
        </tr>
        <tr>
            <td class="label">商品库存：</td>
            <td>
                <input class="form-control input-sm" type="text" id="num" name="num"
                       data-options="required:true,min:0,precision:0">
            </td>
        </tr>
        <tr>
            <td class="label"></td>
            <td>
                <input class="form-control input-sm" type="text" id="barcode" name="barcode"
                       data-options="validType:'length[0,30]'">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <!-- 加载编辑器的容器 -->
                <script id="container" name="itemDesc" type="text/plain">商品描述</script>
            </td>
        </tr>

        <tr class="paramsShow" style="display:none;">
            <td class="label">商品规格：</td>
            <td>

            </td>
        </tr>
        <tr>
            <td>

            </td>
        </tr>
        <tr>
            <td colspan="2">
                <button onclick="submitForm()" class="btn btn-info btn-xs" type="button"
                        data-options="iconCls:'icon-ok'">保存
                </button>
                <button onclick="clearForm()" class="btn btn-info btn-xs" type="button"
                        data-options="iconCls:'icon-undo'">重置
                </button>
            </td>
        </tr>
        </table>
        <input name="paramData" id="paramData" style="display:none;">
    </form>
</div>

<script>
    //保存按钮
    function submitForm() {
        $('#itemAddForm').form('submit', {
            //提交后台的谁进行处理
            url: 'item',
            //提交前需要做的处理操作，返回false终止提交
            onSubmit: function () {
                //将前台的元转换为后台的分，设置给隐藏域
                $('#price').val($.trim($('#priceView').val()) * 100);
                //当所有控件校验通过才会返回true，否则返回false
                return $(this).form('validate');
            },
            success: function (data) {
                if (data > 0) {
                    $.messager.alert('温馨提示','新增商品成功！','info');
                    myttshop.addTab('查询商品','item-list');
                }
            }
        });
    }


</script>
