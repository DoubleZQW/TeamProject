<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>美食达</title>

    <script>try {
        document.execCommand('BackgroundImageCache', false, true);
    } catch (e) {
    }</script>
    <![endif]-->
    <!--[if IE 6]>
    <script type="text/javascript" src="js/evpng.js"></script>
    <script language="javascript" type="text/javascript">EvPNG.fix(".pngFix,.pngFix:hover");</script><![endif]-->
    <link rel="stylesheet" type="text/css" media="all" href="css/ss_base.css"/>
    <link rel="stylesheet" type="text/css" media="all" href="css/main.css"/>
    <link rel="stylesheet" type="text/css" media="all" href="css/index.css"/>
    <script type="text/javascript" src="js/j.m.js"></script>
    <script type="text/javascript" src="js/list.js"></script>
    <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=100">
    <meta http-equiv="Expires" content="Tue, 16 Jan 2018 13:40:02 GMT">
    <script type="text/javascript" src="js/m.js"></script>

    <!-- Required Stylesheets -->
    <link href="resources/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <link href="resources/css/commons.css" rel="stylesheet">
    <%-- bootstrap-table --%>
    <link href="resources/bootstrap-table/bootstrap-table.css" rel="stylesheet">

    <!-- Required Javascript -->
    <script src="resources/jquery/jquery-3.2.1.js"></script>
    <script src="resources/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <%-- bootstrap-closable-tab.js --%>
    <script src="resources/bootstrap-closable-tab/closable-tab-div.js"></script>
    <%-- bootstrap-table --%>
    <script src="resources/bootstrap-table/bootstrap-table.js" rel="stylesheet"></script>
    <script src="resources/bootstrap-table/bootstrap-table-zh-CN.js" rel="stylesheet"></script>
    <%-- moment.js --%>
    <script src="resources/moment/moment.js" rel="stylesheet"></script>
    <script src="resources/moment/moment-with-locales.js" rel="stylesheet"></script>
    <script src="resources/sweet-alert/sweetalert.min.js" rel="stylesheet"></script>
    <%--<script src="https://sweetalert.js.org/assets/sweetalert/sweetalert.min.js"></script>--%>
    <%-- 自定义扩展的js --%>
    <script src="resources/js/commons.js"></script>

    <script>var _hmt = _hmt || [];
    (function () {
        var hm = document.createElement("script");
        hm.src = "//hm.baidu.com/hm.js?01dd6a7c493607e115255b7e72de5f40";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
    </script>
</head>
<body>

<div class="header">
    <div class="header_c">
        <a href="/TeamProject" class="logo pngFix"></a>
        <div class="main_search_top_w">
            <div class="suggestionsBox" id="suggestions" style="display:none;">
                <ul class="suggestionList" id="autoSuggestionsList"></ul>
            </div>
            <form class="search" action="#">
                <input type="text" class="text" name="q" defaultval="请输入菜名/商家名" x-webkit-speech=""
                       value="请输入菜名/商家名" autocomplete="off"
                       onfocus="if(this.value=='请输入菜名/商家名'){this.value='';}$(this).css('color','#333');"
                       onblur="if(this.value==''){this.value='请输入菜名/商家名';$(this).css('color','#999');}"
                       href="/ajax/ajaxtitle.php" id=""><input type="submit" class="submit" value="搜 索" style="margin-left: -18px;">
            </form>
        </div>


        <%--右上角的登录-注册按钮/下拉菜单部分--%>
        <link rel="stylesheet" type="text/css" href="resources/drop-menu/css/style2.css" />
        <script src="resources/drop-menu/js/modernizr.custom.63321.js"></script>
        <%--<script src="http://www.jq22.com/jquery/1.8.3/jquery.min.js"></script>--%>
        <script type="text/javascript" src="resources/drop-menu/js/jquery.dropdown.js"></script>
        <%--导入我的common.js--%>
        <script type="text/javascript" src="resources/drop-menu/js/common.js"></script>
        <div class="cd-dropdown-position">
            <c:choose>
                <c:when test="${empty sess.userName}">

                    <div class="log-reg-box">
                        <button class="col-xs-6" onclick="clean_index();show_login('div_main');">
                            登录
                        </button>
                        <button class="col-xs-6" onclick="clean_index();show_register('div_main');">
                            注册
                        </button>
                    </div>
                </c:when>
                <c:otherwise>

                    <div class="cd-dropdown-position">
                        <select id="cd-dropdown" class="cd-select" style="height: 30px;width: 50px">
                            <option value="-1" selected>${sess.userName}</option>
                            <option value="1" class="glyphicon glyphicon-shopping-cart">购物车</option>
                            <option value="2" class="glyphicon glyphicon-list-alt">订单中心</option>
                            <option value="3" class="glyphicon glyphicon-user">用户概览</option>
                            <option value="4" class="glyphicon glyphicon-log-out">退出登录</option>
                        </select>
                    </div>
                    <script type="text/javascript">
					    $( function() {
						    $( '#cd-dropdown' ).dropdown( {
							    gutter : 5,
							    delay : 100,
							    random : true
						    } );
					    });

					    $(function() {
						    $('.cd-dropdown').find('li span').click(function() {
						        show_div_proxy(this.innerHTML);
                            });
					    });
                    </script>
                </c:otherwise>
            </c:choose>
        </div>

    </div>
</div>
<div id="div_main" class="nav">
    <ul id="main_nav">
        <li><a href="/TeamProject" class="link pngFix"><strong>首页</strong></a></li>
        <li>
            <a href="#" class="link pngFix"><strong>美食</strong></a>
            <div class="dw clearfix">
                <div class="dww clearfix dww_cpdq">
                    <div class="dwitem clearfix pngFix">
                        <dl class="clearfix">
                            <dt><a href="http://www.meishij.net/chufang/diy/">家常菜谱</a></dt>
                            <dd><a href="http://www.meishij.net/chufang/diy/jiangchangcaipu/">家常菜</a></dd>
                            <dd><a href="http://www.meishij.net/chufang/diy/langcaipu/">凉菜</a></dd>
                            <dd><a href="http://www.meishij.net/chufang/diy/sushi/">素食</a></dd>
                            <dd><a href="http://www.meishij.net/chufang/diy/wancan/">晚餐</a></dd>
                            <dd><a href="http://www.meishij.net/chufang/diy/sijiacai/">私家菜</a></dd>
                            <dd><a href="http://www.meishij.net/chufang/diy/recaipu/">热菜</a></dd>
                            <dd><a href="http://www.meishij.net/chufang/diy/haixian/">海鲜</a></dd>
                            <dd><a href="http://www.meishij.net/chufang/diy/yunfu/">孕妇</a></dd>
                            <dd><a href="http://www.meishij.net/chufang/diy/zaocan/">早餐</a></dd>
                            <dd><a href="http://www.meishij.net/chufang/diy/wucan/">午餐</a></dd>
                            <dd><a href="http://www.meishij.net/chufang/diy/tianpindianxin/">甜品点心</a></dd>
                            <dd><a href="http://www.meishij.net/chufang/diy/tangbaocaipu/">汤粥</a></dd>
                            <dd><a href="http://www.meishij.net/chufang/diy/baobaocaipu/">宝宝食谱-婴儿食谱</a></dd>
                            <dd><a href="http://www.meishij.net/chufang/diy/gaodianxiaochi/">糕点主食</a></dd>
                            <dd><a href="http://www.meishij.net/chufang/diy/weibolucaipu/">微波炉</a></dd>
                        </dl>
                    </div>
                    <div class="dwitem dwitem_half clearfix">
                        <dl class="clearfix">
                            <dt><a href="http://www.meishij.net/china-food/caixi/">中华菜系</a></dt>
                            <dd><a href="http://www.meishij.net/china-food/caixi/chuancai/">川菜</a></dd>
                            <dd><a href="http://www.meishij.net/china-food/caixi/yuecai/">粤菜</a></dd>
                            <dd><a href="http://www.meishij.net/china-food/caixi/dongbeicai/">东北菜</a></dd>
                            <dd><a href="http://www.meishij.net/china-food/caixi/xiangcai/">湘菜</a></dd>
                            <dd><a href="http://www.meishij.net/china-food/caixi/lucai/">鲁菜</a></dd>
                            <dd><a href="http://www.meishij.net/china-food/caixi/zhecai/">浙菜</a></dd>
                            <dd><a href="http://www.meishij.net/china-food/caixi/hubeicai/">湖北菜</a></dd>
                            <dd><a href="http://www.meishij.net/china-food/caixi/qingzhencai/">清真菜</a></dd>
                        </dl>
                    </div>
                    <div class="dwitem dwitem_half clearfix">
                        <dl class="clearfix">
                            <dt><a href="http://www.meishij.net/china-food/xiaochi/">各地小吃</a></dt>
                            <dd><a href="http://www.meishij.net/china-food/xiaochi/sichuan/">四川小吃</a></dd>
                            <dd><a href="http://www.meishij.net/china-food/xiaochi/guangdong/">广东小吃</a></dd>
                            <dd><a href="http://www.meishij.net/china-food/xiaochi/beijing/">北京小吃</a></dd>
                            <dd><a href="http://www.meishij.net/china-food/xiaochi/shanxii/">陕西小吃</a></dd>
                        </dl>
                    </div>
                    <br/>
                    <div class="dwitem dwitem_half clearfix">
                        <dl class="clearfix">
                            <dt><a href="http://www.meishij.net/chufang/diy/guowaicaipu1/">外国菜谱</a></dt>
                            <dd><a href="http://www.meishij.net/chufang/diy/guowaicaipu1/hanguo/">韩国料理</a></dd>
                            <dd><a href="http://www.meishij.net/chufang/diy/guowaicaipu1/japan/">日本料理</a></dd>
                            <dd><a href="http://www.meishij.net/chufang/diy/guowaicaipu1/faguo/">法国菜</a></dd>
                            <dd><a href="http://www.meishij.net/chufang/diy/guowaicaipu1/yidali/">意大利餐</a></dd>
                        </dl>
                    </div>
                    <div class="dwitem dwitem_half clearfix">
                        <dl class="clearfix">
                            <dt><a href="http://www.meishij.net/hongpei/">烘焙</a></dt>
                            <dd><a href="http://www.meishij.net/hongpei/dangaomianbao/">蛋糕面包</a></dd>
                            <dd><a href="http://www.meishij.net/hongpei/bingganpeifang/">饼干配方</a></dd>
                            <dd><a href="http://www.meishij.net/hongpei/tianpindianxin/">甜品点心</a></dd>
                        </dl>
                    </div>
                    <br/>
                    <div class="dwitem dwitem_half clearfix">
                        <dl class="clearfix">
                            <dt><a href="http://www.meishij.net/pengren/">厨房百科</a></dt>
                            <dd><a href="http://www.meishij.net/pengren/baipanzhoubian/">摆盘围边</a></dd>
                            <dd><a href="http://www.meishij.net/pengren/jiqiao/">烹饪技巧</a></dd>
                            <dd><a href="http://www.meishij.net/pengren/chufangmiaozhao/">生活妙招</a></dd>
                            <dd><a href="http://www.meishij.net/pengren/chufang/">美食专题</a></dd>
                        </dl>
                    </div>
                    <div class="dwitem dwitem_half clearfix">
                        <dl class="clearfix">
                            <dt><a href="http://www.meishij.net/shicai/">食材百科</a></dt>
                            <dd><a href="http://www.meishij.net/shicai/shucai_list">蔬菜</a></dd>
                            <dd><a href="http://www.meishij.net/shicai/shuiguo_list">水果</a></dd>
                            <dd><a href="http://www.meishij.net/shicai/gulei_list">谷类</a></dd>
                        </dl>
                    </div>
                    <div class="bgitem"></div>
                </div>
            </div>
        </li>
        <li><a href="#" class="link pngFix"><strong>全部商家</strong></a>
        </li>
        <li><a href="javascript:toOrder();" class="link pngFix"><strong>我的订单</strong></a></li>
        <li style="position:relative;z-index:100;"><a style="padding:0 11px;" href="cart" class="link pngFix"><strong>购物车</strong>
        </a></li>
        <li><a href="#" class="link"><strong>个人中心</strong><img
                src="picture/20160909164810_443.png"
                style="display:inline-block;margin-left:-7px;vertical-align:top;margin-top:8px;"></a></li>
    </ul>
</div>
<div class="bottom_back_top_top bottom_back_top_top_slideUp" id="bottom_back_top_top">
    <a href="#" class="backtotop pngFix">回到顶部</a>
</div>
<div class="main_w clearfix" id="divbody">
    <div class="main clearfix">
        <div class="index_zzw" id="index_zzw">
            <div class="index_zzw_main" id="index_zzw_main">
                <div class="zzw_item zzw_item_3" po="3" c="5">
                    <h3 class="bbtitles bbtitles_zzw">今日夜宵推荐：夜宵，在家里吃更有温度！</h3>
                    <ul class="clearfix">
                        <c:forEach items="${midnightlist}" var="node1">
                        <li>
                            <a target="_blank" href="${node1.href}" title="${node1.title}"
                               class="img"><img alt="${node1.title}" src="${node1.src}"/></a>
                            <div class="c pngFix">
                                <h2><a target="_blank" href="${node1.href}"
                                       title="${node1.title}">${node1.title}</a></h2>
                                <strong>${node1.titledesc}</strong>
                                <span><a href="####">${node1.effect}</a><em class="arrow pngFix"></em></span>
                            </div>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="zzw_item zzw_item_2" po="2" c="4">
                    <h3 class="bbtitles bbtitles_zzw">今日晚餐推荐：今晚，吃点鲜的，猴头菇的鲜！</h3>
                    <ul class="clearfix">
                        <c:forEach items="${dinnerList}" var="node2">
                        <li>
                            <a target="_blank" href="${node2.href}" title="${node2.title}"
                               class="img"><img alt="${node2.title}" src="${node2.src}"/></a>
                            <div class="c pngFix">
                                <h2><a target="_blank" href="${node2.href}"
                                       title="${node2.title}">${node2.title}</a></h2>
                                <strong>${node2.titledesc}</strong>
                                <span><a href="####">${node2.effect}</a><em class="arrow pngFix"></em></span>
                            </div>
                        </li>
                        </c:forEach>

                    </ul>
                </div>
                <div class="zzw_item zzw_item_4" po="4" c="1">
                    <h3 class="bbtitles bbtitles_zzw">今日早餐推荐：清晨，走进厨房，惊喜的味道迎面而来！</h3>
                    <ul class="clearfix">
                        <c:forEach items="${breakfastList}" var="node3">
                            <li>
                                <a target="_blank" href="${node3.href}" title="${node3.title}"
                                   class="img"><img alt="${node3.title}" src="${node3.src}"/></a>
                                <div class="c pngFix">
                                    <h2><a target="_blank" href="${node3.href}"
                                           title="${node3.title}">${node3.title}</a></h2>
                                    <strong>${node3.titledesc}</strong>
                                    <span><a href="####">${node3.effect}</a><em class="arrow pngFix"></em></span>
                                </div>
                            </li>
                        </c:forEach>

                    </ul>
                </div>
                <div class="zzw_item zzw_item_1" po="1" c="3">
                    <h3 class="bbtitles bbtitles_zzw">今日下午茶推荐：一点点口味或形式的小改变，可以带来心情上的大不同！</h3>
                    <ul class="clearfix">
                        <c:forEach items="${afternoonteaList}" var="node4">
                            <li>
                                <a target="_blank" href="${node4.href}" title="${node4.title}"
                                   class="img"><img alt="${node4.title}" src="${node4.src}"/></a>
                                <div class="c pngFix">
                                    <h2><a target="_blank" href="${node4.href}"
                                           title="${node4.title}">${node4.title}</a></h2>
                                    <strong>${node4.titledesc}</strong>
                                    <span><a href="####">${node4.effect}</a><em class="arrow pngFix"></em></span>
                                </div>
                            </li>
                        </c:forEach>

                    </ul>
                </div>
                <div class="zzw_item zzw_item_5" po="5" c="2">
                    <h3 class="bbtitles bbtitles_zzw">今日午餐推荐：午餐，要吃的好一点！</h3>
                    <ul class="clearfix">
                        <c:forEach items="${lunchList}" var="node5">
                            <li>
                                <a target="_blank" href="${node5.href}" title="${node5.title}"
                                   class="img"><img alt="${node5.title}" src="${node5.src}"/></a>
                                <div class="c pngFix">
                                    <h2><a target="_blank" href="${node5.href}"
                                           title="${node5.title}">${node5.title}</a></h2>
                                    <strong>${node5.titledesc}</strong>
                                    <span><a href="####">${node5.effect}</a><em class="arrow pngFix"></em></span>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="maskleft" id="maskleft"></div>
            <div class="maskright" id="maskright"></div>
            <div class="prev_btn prev_btn_1 pngFix" id="zzw_prev_btn"></div>
            <div class="next_btn next_btn_1 pngFix" id="zzw_next_btn"></div>
            <div class="index_3meal_tab" id="index_timelinebox">
                <div class="index_3meal_tab_w">
                    <span class="timex timex_0" id="#i_time4"><span>早餐时间</span></span>
                    <span class="timex timex_1" id="#i_time10"><span>午餐时间</span></span>
                    <span class="timex timex_2" id="#i_time14"><span>下午茶时间</span></span>
                    <span class="timex timex_3" id="#i_time16"><span>晚餐时间</span></span>
                    <span class="timex timex_4 timex_current" id="#i_time21"><span>夜宵时间</span></span>
                </div>
                <div class="timeline_left"></div>
                <div class="timeline_right"></div>
                <span class="time time4" id="i_time4">4:00</span><span class="time time10"
                                                                       id="i_time10">10:00</span><span
                    class="time time14" id="i_time14">14:00</span><span class="time time16"
                                                                        id="i_time16">16:00</span><span
                    class="time time21" id="i_time21">21:00</span><span class="time time4_" id="i_time4_">4:00</span>
            </div>
        </div>
        <h3 class="bbtitles">1月，防寒保暖，补益心脾<span class="paixu"><a target="_blank" href="http://i.meishi.cc/recipe_list/">更多菜单 ></a></span>
        </h3>
        <div class="ztlist_style1 clearfix" id="ztlist_style1_index">
            <div id="index_cd_leftarrow"></div>
            <div id="index_cd_leftarrow_mask"></div>
            <div id="index_cd_rightarrow"></div>
            <div id="index_cd_rightarrow_mask"></div>
            <div class="ztlist_style1_item_w" id="ztlist_style1_item_w">
                <div class="ztlist_style1_item_ww" id="ztlist_style1_item_ww">
                    <div class="ztlist_style1_item_w1">
                        <div class="ztlist_style1_item">
                            <ul class="ztlist_style1_item_list clearfix">
                                <li class="current clearfix">
                                    <div class="topzt">
                                        <a target="_blank"
                                           href="http://i.meishi.cc/huodong/zt.php?zt_id=1431&from_s=home2" class="img">
                                            <img src="picture/3887a5c858ea36fc3cafa9f2dba506e6.jpg"><span
                                                class="fixer"></span></a>
                                        <div class="c">
                                            <strong class="title"><a target="_blank"
                                                                     href="http://i.meishi.cc/huodong/zt.php?zt_id=1431&from_s=home2">年夜饭18天养成计</a></strong>
                                            <p>年夜饭18天养成计</p></div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="ztlist_style1_item">
                            <ul class="ztlist_style1_item_list clearfix">
                                <li class="current clearfix">
                                    <div class="topzt">
                                        <a target="_blank"
                                           href="http://i.meishi.cc/huodong/zt.php?zt_id=1319&from_s=home2" class="img"><img
                                                src="picture/6ac39c5f33030ec9d1d5d678d72fd3ec.jpg"><span
                                                class="fixer"></span></a>
                                        <div class="c">
                                            <strong class="title"><a target="_blank"
                                                                     href="http://i.meishi.cc/huodong/zt.php?zt_id=1319&from_s=home2">中秋就要到了，然而...
                                                ...</a></strong>
                                            <p>小编们却为月饼掐了一场架</p></div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="ztlist_style1_item mr0">
                            <ul class="ztlist_style1_item_list clearfix">
                                <li class="current clearfix">
                                    <div class="topzt">
                                        <a target="_blank"
                                           href="https://www.meishij.net/huodong/zt_detail.php?id=1099&from_s=home2"
                                           class="img"><img src="picture/20180103174804_710.jpg"><span
                                                class="fixer"></span></a>
                                        <div class="c">
                                            <strong class="title"><a target="_blank"
                                                                     href="https://www.meishij.net/huodong/zt_detail.php?id=1099&from_s=home2">十种引爆味蕾的茄子做...</a></strong>
                                            <p>十种引爆味蕾的茄子做法</p></div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="ztlist_style1_item mb0">
                            <ul class="ztlist_style1_item_list clearfix">
                                <li class="current clearfix">
                                    <div class="topzt">
                                        <a target="_blank"
                                           href="https://www.meishij.net/huodong/zt_detail.php?id=1095&from_s=home2"
                                           class="img"><img src="picture/20180103165754_606.jpg"><span
                                                class="fixer"></span></a>
                                        <div class="c">
                                            <strong class="title"><a target="_blank"
                                                                     href="https://www.meishij.net/huodong/zt_detail.php?id=1095&from_s=home2">超诱人的鸡翅做法
                                                保...</a></strong>
                                            <p>超诱人的鸡翅做法 </p></div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="ztlist_style1_item mb0">
                            <ul class="ztlist_style1_item_list clearfix">
                                <li class="current clearfix">
                                    <div class="topzt">
                                        <a target="_blank"
                                           href="https://www.meishij.net/huodong/zt_detail.php?id=1091&from_s=home2"
                                           class="img"><img src="picture/20180103151009_690.jpg"><span
                                                class="fixer"></span></a>
                                        <div class="c">
                                            <strong class="title"><a target="_blank"
                                                                     href="https://www.meishij.net/huodong/zt_detail.php?id=1091&from_s=home2">自从见到芝士以后，卡...</a></strong>
                                            <p>自从见到芝士以后</p></div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="ztlist_style1_item mr0 mb0">
                            <ul class="ztlist_style1_item_list clearfix">
                                <li class="current clearfix">
                                    <div class="topzt">
                                        <a target="_blank"
                                           href="https://www.meishij.net/huodong/zt_detail.php?id=1083&from_s=home2"
                                           class="img"><img src="picture/20180103152234_619.jpg"><span
                                                class="fixer"></span></a>
                                        <div class="c">
                                            <strong class="title"><a target="_blank"
                                                                     href="https://www.meishij.net/huodong/zt_detail.php?id=1083&from_s=home2">冬季必吃的5种“根”...</a></strong>
                                            <p>冬季必吃的5种“根”菜</p></div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="ztlist_style1_item_w1">
                        <div class="ztlist_style1_item">
                            <ul class="ztlist_style1_item_list clearfix">
                                <li class="current clearfix">
                                    <div class="topzt">
                                        <a target="_blank"
                                           href="https://www.meishij.net/huodong/zt_detail.php?id=1079&from_s=home2"
                                           class="img"><img src="picture/20180103122024_391.jpg"><span
                                                class="fixer"></span></a>
                                        <div class="c">
                                            <strong class="title"><a target="_blank"
                                                                     href="https://www.meishij.net/huodong/zt_detail.php?id=1079&from_s=home2">早知道午餐肉还能这样...</a></strong>
                                            <p>午餐肉这么做最好吃</p></div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="ztlist_style1_item">
                            <ul class="ztlist_style1_item_list clearfix">
                                <li class="current clearfix">
                                    <div class="topzt">
                                        <a target="_blank"
                                           href="https://www.meishij.net/huodong/zt_detail.php?id=1075&from_s=home2"
                                           class="img"><img src="picture/20180103114803_409.jpg"><span
                                                class="fixer"></span></a>
                                        <div class="c">
                                            <strong class="title"><a target="_blank"
                                                                     href="https://www.meishij.net/huodong/zt_detail.php?id=1075&from_s=home2">小寒进补有门道，教你...</a></strong>
                                            <p>小寒进补有门道</p></div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="ztlist_style1_item mr0">
                            <ul class="ztlist_style1_item_list clearfix">
                                <li class="current clearfix">
                                    <div class="topzt">
                                        <a target="_blank"
                                           href="https://www.meishij.net/huodong/zt_detail.php?id=1071&from_s=home2"
                                           class="img"><img src="picture/20180103105725_879.jpg"><span
                                                class="fixer"></span></a>
                                        <div class="c">
                                            <strong class="title"><a target="_blank"
                                                                     href="https://www.meishij.net/huodong/zt_detail.php?id=1071&from_s=home2">鸡肉最好吃的方法，你...</a></strong>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="ztlist_style1_item mb0">
                            <ul class="ztlist_style1_item_list clearfix">
                                <li class="current clearfix">
                                    <div class="topzt">
                                        <a target="_blank"
                                           href="https://www.meishij.net/huodong/zt_detail.php?id=1067&from_s=home2"
                                           class="img"><img src="picture/20180103105817_819.jpg"><span
                                                class="fixer"></span></a>
                                        <div class="c">
                                            <strong class="title"><a target="_blank"
                                                                     href="https://www.meishij.net/huodong/zt_detail.php?id=1067&from_s=home2">吐司承包了你一周的早...</a></strong>
                                            <p>吐司承包了你一周的早餐</p></div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="ztlist_style1_item mb0">
                            <ul class="ztlist_style1_item_list clearfix">
                                <li class="current clearfix">
                                    <div class="topzt">
                                        <a target="_blank"
                                           href="https://www.meishij.net/huodong/zt_detail.php?id=1063&from_s=home2"
                                           class="img"><img src="picture/20180102172805_688.jpg"><span
                                                class="fixer"></span></a>
                                        <div class="c">
                                            <strong class="title"><a target="_blank"
                                                                     href="https://www.meishij.net/huodong/zt_detail.php?id=1063&from_s=home2">让你口水横流的事情
                                                ...</a></strong>
                                            <p>让你口水横流的事情</p></div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="ztlist_style1_item mr0 mb0">
                            <ul class="ztlist_style1_item_list clearfix">
                                <li class="current clearfix">
                                    <div class="topzt">
                                        <a target="_blank"
                                           href="https://www.meishij.net/huodong/zt_detail.php?id=1059&from_s=home2"
                                           class="img"><img src="picture/20180102112621_967.jpg"><span
                                                class="fixer"></span></a>
                                        <div class="c">
                                            <strong class="title"><a target="_blank"
                                                                     href="https://www.meishij.net/huodong/zt_detail.php?id=1059&from_s=home2">年糕年年高
                                                这样做才...</a></strong>
                                            <p>年糕年年高</p></div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="ztlist_style1_item_w1">
                        <div class="ztlist_style1_item">
                            <ul class="ztlist_style1_item_list clearfix">
                                <li class="current clearfix">
                                    <div class="topzt">
                                        <a target="_blank"
                                           href="https://www.meishij.net/huodong/zt_detail.php?id=1047&from_s=home2"
                                           class="img"><img src="picture/20171230174129_887.jpg"><span
                                                class="fixer"></span></a>
                                        <div class="c">
                                            <strong class="title"><a target="_blank"
                                                                     href="https://www.meishij.net/huodong/zt_detail.php?id=1047&from_s=home2">新年吃鱼，年年有余</a></strong>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="ztlist_style1_item">
                            <ul class="ztlist_style1_item_list clearfix">
                                <li class="current clearfix">
                                    <div class="topzt">
                                        <a target="_blank"
                                           href="https://www.meishij.net/huodong/zt_detail.php?id=1043&from_s=home2"
                                           class="img"><img src="picture/20171229205719_122.jpg"><span
                                                class="fixer"></span></a>
                                        <div class="c">
                                            <strong class="title"><a target="_blank"
                                                                     href="https://www.meishij.net/huodong/zt_detail.php?id=1043&from_s=home2">今年最嗨的跨年方式，...</a></strong>
                                            <p>最嗨的跨年方式</p></div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="ztlist_style1_item mr0">
                            <ul class="ztlist_style1_item_list clearfix">
                                <li class="current clearfix">
                                    <div class="topzt">
                                        <a target="_blank"
                                           href="https://www.meishij.net/huodong/zt_detail.php?id=1039&from_s=home2"
                                           class="img"><img src="picture/20180101110122_488.jpg"><span
                                                class="fixer"></span></a>
                                        <div class="c">
                                            <strong class="title"><a target="_blank"
                                                                     href="https://www.meishij.net/huodong/zt_detail.php?id=1039&from_s=home2">十款简单又好吃的蒸菜...</a></strong>
                                            <p>十款简单又好吃的蒸菜 </p></div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="ztlist_style1_item mb0">
                            <ul class="ztlist_style1_item_list clearfix">
                                <li class="current clearfix">
                                    <div class="topzt">
                                        <a target="_blank"
                                           href="https://www.meishij.net/huodong/zt_detail.php?id=1035&from_s=home2"
                                           class="img"><img src="picture/20171229105955_635.jpg"><span
                                                class="fixer"></span></a>
                                        <div class="c">
                                            <strong class="title"><a target="_blank"
                                                                     href="https://www.meishij.net/huodong/zt_detail.php?id=1035&from_s=home2">元旦要吃鸡蛋哦~其中...</a></strong>
                                            <p>元旦吃鸡蛋</p></div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="ztlist_style1_item mb0">
                            <ul class="ztlist_style1_item_list clearfix">
                                <li class="current clearfix">
                                    <div class="topzt">
                                        <a target="_blank"
                                           href="https://www.meishij.net/huodong/zt_detail.php?id=1031&from_s=home2"
                                           class="img"><img src="picture/20171227141944_769.jpg"><span
                                                class="fixer"></span></a>
                                        <div class="c">
                                            <strong class="title"><a target="_blank"
                                                                     href="https://www.meishij.net/huodong/zt_detail.php?id=1031&from_s=home2">大棒骨熬完汤就扔掉？...</a></strong>
                                            <p>这样吃骨髓最健康</p></div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="ztlist_style1_item mr0 mb0">
                            <ul class="ztlist_style1_item_list clearfix">
                                <li class="current clearfix">
                                    <div class="topzt">
                                        <a target="_blank"
                                           href="https://www.meishij.net/huodong/zt_detail.php?id=1027&from_s=home2"
                                           class="img"><img src="picture/20171226110314_967.jpg"><span
                                                class="fixer"></span></a>
                                        <div class="c">
                                            <strong class="title"><a target="_blank"
                                                                     href="https://www.meishij.net/huodong/zt_detail.php?id=1027&from_s=home2">万能调料葱油做出来的...</a></strong>
                                            <p>葱油真的是好东西耶~</p></div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="main_footer pngFix">
    </div>
</div>

<script type="text/javascript">
    function toOrder() {
        $.ajax({
            url: 'order-list',
            method: 'get',
            success: function (html) {
                $('#divbody').html(html);
            }
        });
    }

</script>
</body>
</html>