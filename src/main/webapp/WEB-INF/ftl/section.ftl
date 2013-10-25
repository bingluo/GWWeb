<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>东南大学公共卫生学院 <#if category ??> : ${category.title}</#if></title>
    <link rel="stylesheet" type="text/css" href="${rc.getContextPath()}/css/main.css">
    <script type="text/javascript" src="${rc.getContextPath()}/js/jquery-1.10.2.min.js"></script>
    <style type="text/css">
        .container {
            width: 900px;
            height: auto;
            min-height: 500px;
        }

        #nav-left-head {
            padding-bottom: 20px;
        }

        .nav-left-item {
            padding-bottom: 10px;
            font-size: 15px;
        }

        #nav-left-head {
            font-size: 15px;
        }

        #article-title {
            font-size: 20px;
            padding-bottom: 15px;
        }

        #article-info {
            font-size: 15px;
            font-style: italic;
            padding-bottom: 15px;
        }

        #article-context {
            font-size: 14px;
        }

        #article-attachment {
            padding-top: 20px;
        }

        .pagination li {
            display: inline;
        }

    </style>
</head>
<body>
<div class="main">
<#include "common/header.ftl" />
    <div class="container">
        <table>
            <tr>
                <td valign="top" min-width="250">
                    <ul id="nav-left">
                        <li id="nav-left-head">
                            <img src="${rc.getContextPath()}/images/article_page_list.gif" width="10"
                                 height="10"/>${category.title}
                        </li>
                    <#if sections ??>
                        <#list sectionList as sectionItem>
                            <li class="nav-left-item"
                                <#if sectionItem.id==currentSection.id>style="font-weight:bold;"</#if>>
                                <a href="${rc.getContextPath()}/cat/${category.id}/section/${sectionItem.id}/">${sectionItem.title}</a>
                            </li>
                        </#list>
                    </#if>
                    </ul>
                </td>
                <td valign="top">
                <#if currentSection.type.name() == "Exclusive">
                    <#if article ??>
                        <p id="article-title">${article.title}</p>
                        <p id="article-info">作者：${article.author} , 修改时间：${article.createDate?string("yyyy-MM-dd")}</p>
                        <div id="article-context">
                        ${article.context}
                        </div>
                        <#if article.attachmentList??>
                            <div id="article-attachment">
                                <p>附件列表：</p>
                                <#list article.attachmentList as attachment>
                                    <#assign lIndex = attachment?last_index_of("/")>
                                    <a href="${attachment}" target="blank">${attachment?substring(lIndex + 1)}</a>
                                    </br>
                                </#list>
                            </div>
                        </#if>
                    </#if>
                <#else>
                    <p id="page-title"><#if currentSection ??> ${currentSection.title}</#if></p>
                    <#if currentSection.articleList??>
                        <table id="article-table">
                            <thead>
                            <tr>
                                <th>文章标题</th>
                                <th>作者</th>
                                <th>修改日期</th>
                            </tr>
                            </thead>
                            <tbody>
                                <#list currentSection.articleList as article>
                                <tr>
                                    <td>
                                        <a href="${rc.getContextPath()}/article/${currentSection.id}-${article.id}.html">${article.title}</a>
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
                                    <li><a <#if pageIndex != 1>href="?pageIndex=${pageIndex - 1}"
                                           <#else>disabled="true"</#if>>上一页</a>
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
                </#if>
                </td>
            </tr>
        </table>
        <!--list-->
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