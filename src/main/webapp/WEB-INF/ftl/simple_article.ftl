<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>东南大学公共卫生学院 <#if currentSection ??> : ${currentSection.title}</#if></title>
    <link rel="stylesheet" type="text/css" href="${rc.getContextPath()}/css/main.css">
    <script type="text/javascript" src="${rc.getContextPath()}/js/jquery-1.10.2.min.js"></script>
    <style type="text/css">
    .container {
        height: auto;
        min-height: 500px;
    }
    #article-title {
        font-size: 20px;
        padding-bottom: 15px;
    }
    #article-info {
        font-size: 15px;
        padding-bottom: 15px;
        font-style: italic;
    }
    #article-context {
        font-size: 14px;
        padding-bottom: 15px;
    }
    #article-attachment {
        padding-top: 15px;
        font-size: 12px;
        font-style: italic;
    }
    </style>
</head>
<body>
<div class="main">
    <#include "common/header.ftl"/>
    <div class="container">
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
                        <a href ="${attachment}" target="blank">${attachment?substring(lIndex + 1)}</a>
                        </br>
                    </#list>
                </div>
            </#if>
        </#if>
    </div><!--container-->
</div><!--main-->
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
    function showSelect(id){
        for(i=1;i<=7;i++){
            if(i==id){
                document.getElementById("nav"+i).style.display="block";
            }else{
                document.getElementById("nav"+i).style.display="none";
            }
        }
    }
</script>
</body>
</html>
