<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>东南大学公共卫生学院</title>
    <link rel="stylesheet" type="text/css" href="${rc.getContextPath()}/css/main.css">
    <script type="text/javascript" src="${rc.getContextPath()}/js/jquery-1.10.2.min.js"></script>
</head>
<body>
<div class="main">
<#include "common/header.ftl"/>
    <div class="post"><img src="${rc.getContextPath()}/images/post.jpg" width="980" height="200"/></div>
    <div class="container">
        <div class="nleft">
            <div>
                <div class="update_tit"></div>
                <ul class="update">
                <#if 学术报告??>
                    <#list 学术报告.articleList as article>
                        <#if article_index<8>
                            <li>
                                <div class="title"><a
                                        href="${rc.getContextPath()}/article/52-${article.id}.html">${article.title}</a>
                                </div>
                                <div class="pdate">${article.createDate?string("MM-dd")}</div>
                                <#if article_index <= 1>
                                    <div class="new"><img src="${rc.getContextPath()}/images/news.gif" width="20"
                                                          height="11"/></div>
                                </#if>
                            </li>
                        </#if>
                    </#list>
                </#if>
                </ul>
            </div>
            <div>
                <div class="pic_tit"></div>
                <div class="pic">
                    <img src="images/pic1.jpg" width="202" height="138"/>
                </div>
                <div class="friend_link">
                    <form name="myForm">
                        <select>
                            <option selected="selected">友情文字链接站点</option>
                        </select>
                    </form>
                </div>
            </div>
        </div>
        <!--/nleft-->
        <div class="nright">
            <div class="wraper">
                <div class="collage_tit" style="cursor: pointer;" <#if 学院公告??>onclick="navTo(${学院公告.id})"</#if>></div>
                <ul class="update higher">
                <#if 学院公告??>
                    <#list 学院公告.articleList as article>
                        <#if article_index<8>
                            <li>
                                <div class="title"><a
                                        href="${rc.getContextPath()}/article/53-${article.id}.html">${article.title}</a>
                                </div>
                                <div class="pdate">${article.createDate?string("MM-dd")}</div>
                                <#if article_index <= 1>
                                    <div class="new"><img src="${rc.getContextPath()}/images/news.gif" width="20"
                                                          height="11"/></div>
                                </#if>
                            </li>
                        </#if>
                    </#list>
                </#if>
                </ul>
            </div>
            <!--/wraper-->
            <div class="wraper">
                <div class="news_tit" style="cursor: pointer;" <#if 学院新闻??>onclick="navTo(${学院新闻.id})"</#if>></div>
                <ul class="update higher">
                <#if 学院新闻??>
                    <#list 学院新闻.articleList as article>
                        <#if article_index<8>
                            <li>
                                <div class="title"><a
                                        href="${rc.getContextPath()}/article/54-${article.id}.html">${article.title}</a>
                                </div>
                                <div class="pdate">${article.createDate?string("MM-dd")}</div>
                                <#if article_index <= 1>
                                    <div class="new"><img src="${rc.getContextPath()}/images/news.gif" width="20"
                                                          height="11"/></div>
                                </#if>
                            </li>
                        </#if>
                    </#list>
                </#if>
                </ul>
            </div>
            <!--/wraper-->
            <div class="wraper">
                <div class="deu_tit" style="cursor: pointer;" <#if 教务信息??>onclick="navTo(${教务信息.id})"</#if>></div>
                <ul class="update higher">
                <#if 教务信息??>
                    <#list 教务信息.articleList as article>
                        <#if article_index<8>
                            <li>
                                <div class="title"><a
                                        href="${rc.getContextPath()}/article/55-${article.id}.html">${article.title}</a>
                                </div>
                                <div class="pdate">${article.createDate?string("MM-dd")}</div>
                                <#if article_index <= 1>
                                    <div class="new"><img src="${rc.getContextPath()}/images/news.gif" width="20"
                                                          height="11"/></div>
                                </#if>
                            </li>
                        </#if>
                    </#list>
                </#if>
                </ul>
            </div>
            <!--/wraper-->
            <div class="wraper">
                <div class="student_tit" style="cursor: pointer;" onclick="navToStudentWork()"></div>
                <ul class="update higher">
                <#if notice??>
                    <#list notice.articleList as article>
                        <#if article_index<8>
                            <li>
                                <div class="title"><a
                                        href="${rc.getContextPath()}/article/${notice.id}-${article.id}.html">${article.title}</a>
                                </div>
                                <div class="pdate">${article.createDate?string("MM-dd")}</div>
                                <#if article_index <= 1>
                                    <div class="new"><img src="${rc.getContextPath()}/images/news.gif" width="20"
                                                          height="11"/></div>
                                </#if>
                            </li>
                        </#if>
                    </#list>
                </#if>
                </ul>
            </div>
            <!--/wraper-->
        </div>
        <!--/nright-->
    </div>
    <!--/container-->
</div>
<!--/main-->
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
    function navTo(sectionId) {
        window.location.href = "${rc.getContextPath()}/cat/1/section/" + sectionId+"/";
    }
    function navToStudentWork() {
        window.location.href = "${rc.getContextPath()}/student_work";
    }

</script>
</body>
</html>
