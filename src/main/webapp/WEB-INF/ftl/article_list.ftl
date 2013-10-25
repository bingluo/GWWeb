<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>东南大学公共卫生学院 <#if currentSection ??> : ${currentSection.title}</#if></title>
    <link rel="stylesheet" type="text/css" href="${rc.getContextPath()}/css/main.css">
    <script type="text/javascript" src="${rc.getContextPath()}/js/jquery-1.10.2.min.js"></script>
    <style type="text/css">
        .container {
            width: 950px;
            height: auto;
            min-height: 550px;
        }

        .pagination li {
            padding-top: 20px;
            list-style: none;
            float: left;
            font-size: 12px;
        }

        #article-table {
            width: 900px;
            margin: 20px;
            border: #ccc 1px solid;
        }

        #article-table th {
            padding: 15px 25px 15px 25px;
            background-color: #ededed;
            font-size: 14px;
        }

        #article-table th:first-child {
            text-align: left;
        }

        #article-table td {
            padding: 12px;
            font-size: 14px;
            text-align: center;
            border-top: 1px solid #ffffff;
            border-bottom: 1px solid #e0e0e0;
        }

        #article-table td:first-child {
            text-align: left;
        }

        #page-title {
            padding: 5px 5px 5px 15px;
            font-size: 15px;
        }
    </style>
</head>
<body>
<div class="main">
    <div class="header">
        <div class="logo"><img src="${rc.getContextPath()}/images/logo.gif" width="270" height="100"/></div>
        <div class="nav">
            <div class="litt_nav">
                <ul>
                    <li><a href="#">设为首页</a></li>
                    <li><a href="#">收藏本站</a></li>
                    <li><a href="#">学院论坛</a></li>
                    <li><a href="#">旧版登录</a></li>
                </ul>
            </div>
            <!--/litt_nav-->
            <div class="main_nav">
			<#if menuList??>
                <ul>
                    <li><a href="${rc.getContextPath()}/index">首页</a></li>
					<#list menuList as menuItemId>
						<#if menuSectionMap?has_content && menuSectionMap?keys?seq_contains(menuItemId)>
                            <li><a href="#"
                                   onmouseover="showSelect(${menuItemId_index + 1})">${menuSectionMap[menuItemId].title}</a>
                            </li>
						</#if>
					</#list>
                </ul>
				<#list menuList as menuItemId>
					<#if menuSectionMap?has_content && menuSectionMap?keys?seq_contains(menuItemId)>
                    <dl class="navtwo navtwo${menuItemId_index + 1}" id="nav${menuItemId_index + 1}">
						<#assign menuItem = menuSectionMap[menuItemId]>
						<#if menuItem.articleList??>
							<#list menuItem.articleList as article>
                                <dd <#if article_index == menuItem.articleList?size - 1>class="noborder"</#if>>
                                    <a href="${rc.getContextPath()}/pages/${menuItem.id}/articles/${article.id}">${article.title}</a>
                                </dd>
							</#list>
						</#if>
					</#if>
                </dl>
				</#list>
			</#if>
            </div>
            <!--/main_nav-->
        </div>
        <!--/nav-->
    </div>
    <!--/header-->
    <div class="container">
        <p id="page-title"><#if currentSection ??> ${currentSection.title}</#if></p>
	<#if articleList ??>
        <table id="article-table">
            <thead>
            <tr>
                <th>文章标题</th>
                <th>作者</th>
                <th>修改日期</th>
            </tr>
            </thead>
            <tbody>
				<#list articleList as article>
                <tr>
                    <td>
                        <a href="${rc.getContextPath()}/sections/${sectionId}/articles/${article.id}">${article.title}</a>
                    </td>
                    <td>${article.author}</td>
                    <td>${article.createDate?string("yyyy-MM-dd")}</td>
                </tr>
				</#list>
            </tbody>
        </table>
        <div class="article-pagination">
			<#assign pageTotalNum = (articleListCount / pageSize)?ceiling>
			<#if pageTotalNum != 0>
                <ul class="pagination">
                    <li><a <#if pageIndex != 1>href="?pageIndex=${pageIndex - 1}"<#else>disabled="true"</#if>>上一页</a>
                    <li>
                    <li>&nbsp;|&nbsp;</li>
					<#list 1..pageTotalNum as pageNum>
                        <li><a href="?pageIndex=${pageNum}">第${pageNum}页</a></li>
                        <li>&nbsp;|&nbsp;</li>
					</#list>
                    <li><a <#if pageIndex != pageTotalNum>href="?pageIndex=${pageIndex + 1}"
						   <#else>disabled="true"</#if>>下一页</a>
                    <li>
                </ul>
			</#if>
        </div>
	</#if>
    </div>
    <!--container-->
</div>
<!--main-->
<div class="footer">
    <p class="p1">中国&nbsp;&nbsp;&#8226;&nbsp;南京&nbsp;&#8226;&nbsp;东南大学公共卫生学院</p>

    <p>Copyright&nbsp;&nbsp;2013&nbsp;&nbsp;东南大学公共卫生学院&nbsp;&nbsp;版权所有&nbsp;&nbsp;All&nbsp;&nbsp;Right</p>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        $("div").not($(".main_nav")).hover(function(){
            $("dl").css("display","none");
        });

        $(".rootNav li").first().hover(function(){
            $("dl").css("display","none");
        });

    });
    function showSelect(id) {
        for (i = 1; i <= 7; i++) {
            if (i == id) {
                document.getElementById("nav" + i).style.display = "block";
            } else {
                document.getElementById("nav" + i).style.display = "none";
            }
        }
    }
</script>
</body>
</html>
