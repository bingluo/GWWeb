<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>东南大学公共卫生学院 : 学生工作</title>
    <link rel="stylesheet" type="text/css" href="${rc.getContextPath()}/css/student_work.css">
    <link rel="stylesheet" href="${rc.getContextPath()}/css/flexslider.css" type="text/css">
    <script type="text/javascript" src="${rc.getContextPath()}/js/jquery-1.10.2.min.js"></script>
    <script src="${rc.getContextPath()}/js/jquery.flexslider-min.js"></script>
    <script type="text/javascript" src="${rc.getContextPath()}/js/base.js"></script>
    <style type="text/css">
        .flexslider {
            margin-top: 10px;
            margin-bottom: 0;
            width: 980px;
            height: 200px;
            border: 0;
            z-index: -1;
        }
    </style>
    <script type="text/javascript" charset="utf-8">
        $(window).load(function() {
            $('.flexslider').flexslider({
                controlNav: false,
                directionNav: false,
                animation: "fade"
            });
        });
    </script>
</head>
<body>
<div class="main">
<div class="header">
    <div class="logo"><img src="${rc.getContextPath()}/images/sw_seu_logo.gif" width="270" height="100"/></div>
	<#include "common/navi.ftl"/>
</div>
    <div class="flexslider">
        <ul class="slides">
            <li>
                <img src="${rc.getContextPath()}/images/slider-1.png"/>
            </li>
            <li>
                <img src="${rc.getContextPath()}/images/slider-2.png"/>
            </li>
            <li>
                <img src="${rc.getContextPath()}/images/slider-3.png"/>
            </li>
            <li>
                <img src="${rc.getContextPath()}/images/slider-4.png"/>
            </li>
        </ul>
    </div>
<div class="container">
    <div class="wraper">
        <div class="notice_tit" style="cursor: pointer;" <#if 通知公告??>onclick="navTo(${通知公告.id})"</#if>></div>
        <div>
            <ul class="update">
			<#if 通知公告??>
				<#if 通知公告.articleList??>
				<#list 通知公告.articleList as article>
					<#if article_index<8>
                        <li>
                            <div class="title"><a href="${rc.getContextPath()}/article/${通知公告.id}-${article.id}.html" title="${article.title}">${article.title}</a></div>
                            <div class="pdate">${article.createDate?string("MM-dd")}</div>
							<#if article_index <= 1>
                                <div class="new"><img src="${rc.getContextPath()}/images/news.gif" width="20"
                                                      height="11"/></div>
							</#if>
                        </li>
					</#if>
				</#list>
				</#if>
			</#if>
            </ul>
        </div>
    </div>
    <!--wraper-->
    <div class="wraper">
        <div class="regular_tit" style="cursor: pointer;" <#if 日常管理??>onclick="navTo(${日常管理.id})"</#if>></div>
        <div>
            <ul class="update">
			<#if 日常管理??>
				<#if 日常管理.articleList??>
				<#list 日常管理.articleList as article>
					<#if article_index<8>
                        <li>
                            <div class="title"><a href="${rc.getContextPath()}/article/${日常管理.id}-${article.id}.html" title="${article.title}">${article.title}</a></div>
                            <div class="pdate">${article.createDate?string("MM-dd")}</div>
							<#if article_index <= 1>
                                <div class="new"><img src="${rc.getContextPath()}/images/news.gif" width="20"
                                                      height="11"/></div>
							</#if>
                        </li>
					</#if>
				</#list>
				</#if>
			</#if>
            </ul>
        </div>
    </div>
    <!--wraper-->
    <div class="wraper">
        <div class="party_tit" style="cursor: pointer;" <#if 学生党团建设??>onclick="navTo(${学生党团建设.id})"</#if>></div>
        <div>
            <ul class="update">
			<#if 学生党团建设??>
				<#if 学生党团建设.articleList??>
				<#list 学生党团建设.articleList as article>
					<#if article_index<8>
                        <li>
                            <div class="title"><a href="${rc.getContextPath()}/article/${学生党团建设.id}-${article.id}.html" title="${article.title}">${article.title}</a></div>
                            <div class="pdate">${article.createDate?string("MM-dd")}</div>
							<#if article_index <= 1>
                                <div class="new"><img src="${rc.getContextPath()}/images/news.gif" width="20"
                                                      height="11"/></div>
							</#if>
                        </li>
					</#if>
				</#list>
				</#if>
			</#if>
            </ul>
        </div>
    </div>
    <!--wraper-->
    <div class="wraperdown">
        <div class="student_tit" style="cursor: pointer;" <#if 学生活动??>onclick="navTo(${学生活动.id})"</#if>></div>
        <div>
            <ul class="update">
			<#if 学生活动??>
				<#if 学生活动.articleList??>
				<#list 学生活动.articleList as article>
					<#if article_index<8>
                        <li>
                            <div class="title"><a href="${rc.getContextPath()}/article/${学生活动.id}-${article.id}.html" title="${article.title}">${article.title}</a></div>
                            <div class="pdate">${article.createDate?string("MM-dd")}</div>
							<#if article_index <= 1>
                                <div class="new"><img src="${rc.getContextPath()}/images/news.gif" width="20"
                                                      height="11"/></div>
							</#if>
                        </li>
					</#if>
				</#list>
				</#if>
			</#if>
            </ul>
        </div>
    </div>
    <!--wraper-->
    <div class="wraperdown">
        <div class="graduate_tit" style="cursor: pointer;" <#if 升学实习就业??>onclick="navTo(${升学实习就业.id})"</#if>></div>
        <div>
            <ul class="update">
			<#if 升学实习就业??>
				<#if 升学实习就业.articleList??>
				<#list 升学实习就业.articleList as article>
					<#if article_index<8>
                        <li>
                            <div class="title"><a href="${rc.getContextPath()}/article/${升学实习就业.id}-${article.id}.html" title="${article.title}">${article.title}</a></div>
                            <div class="pdate">${article.createDate?string("MM-dd")}</div>
							<#if article_index <= 1>
                                <div class="new"><img src="${rc.getContextPath()}/images/news.gif" width="20"
                                                      height="11"/></div>
							</#if>
                        </li>
					</#if>
				</#list>
				</#if>
			</#if>
            </ul>
        </div>
    </div>
    <!--wraper-->
    <div class="wraperdown">
        <div class="master_tit" style="cursor: pointer;" <#if 研究生工作??>onclick="navTo(${研究生工作.id})"</#if>></div>
        <div>
            <ul class="update">
			<#if 研究生工作??>
				<#if 研究生工作.articleList??>
				<#list 研究生工作.articleList as article>
					<#if article_index<8>
                        <li>
                            <div class="title"><a href="${rc.getContextPath()}/article/${研究生工作.id}-${article.id}.html" title="${article.title}">${article.title}</a></div>
                            <div class="pdate">${article.createDate?string("MM-dd")}</div>
							<#if article_index <= 1>
                                <div class="new"><img src="${rc.getContextPath()}/images/news.gif" width="20"
                                                      height="11"/></div>
							</#if>
                        </li>
					</#if>
				</#list>
				</#if>
			</#if>
            </ul>
        </div>
    </div>
</div>
<div class="footer">
    <p class="p1">中国&nbsp;&nbsp;&#8226;&nbsp;南京&nbsp;&#8226;&nbsp;东南大学公共卫生学院</p>
    <p>Copyright&nbsp;&nbsp;2013&nbsp;&nbsp;东南大学公共卫生学院&nbsp;&nbsp;版权所有&nbsp;&nbsp;All&nbsp;&nbsp;Right</p>
</div>
<script type="text/javascript">
    function navTo(sectionId) {
        window.location.href = "${rc.getContextPath()}/cat/8/section/" + sectionId+"/";
    }
</script>
</body>
</html>